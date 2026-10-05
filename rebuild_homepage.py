import subprocess
from pathlib import Path

ROOT = Path(".").resolve()
CSS_DIR = ROOT / "css"

PICO_URL = "https://cdn.jsdelivr.net/npm/@picocss/pico@2/css/pico.classless.amber.min.css"

CSS_DIR.mkdir(exist_ok=True)
print('Downloading CSS file')
subprocess.run(
    ["curl", "-L", "-o", str(CSS_DIR / "pico.css"), PICO_URL],
    check=True,
)

folders = [ROOT] + [p for p in ROOT.rglob("*") if p.is_dir()]
for folder in folders:
    if not folder.is_dir():
        continue

    md = folder / "index.md"
    if not md.exists():
        continue

    html = folder / "index.html"
    print(f"Building {html}")
    subprocess.run(
        [
            "pandoc",
            "index.md",
            "-f", "gfm",
            "-t", "html",
            "--standalone",
            "--css=/css/pico.css",
            "--css=/css/margin.css",
            "-o", "index.html",
        ],
        cwd=folder,
        check=True,
    )

status = subprocess.run(
    ["git", "status", "--porcelain"],
    cwd=ROOT,
    capture_output=True,
    text=True,
    check=True,
)

if not status.stdout:
    print("No changes detected. Nothing to commit.")
else:
    subprocess.run(["git", "status"], cwd=ROOT, check=True)

    default_msg = "autoupdated with rebuild_homepage.py"
    msg = input("Github commit message: ") or default_msg

    git_cmds = (
        ["git", "add", "."],
        ["git", "commit", "-m", msg],
        ["git", "push", "origin", "main"],
    )

    for cmd in git_cmds:
        subprocess.run(cmd, cwd=ROOT, check=True)