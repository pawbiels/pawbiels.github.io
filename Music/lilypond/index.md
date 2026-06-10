# Lilypond
[**Return**](../)

## Instalacja

W zasadzie wszystko jest [tutaj](https://www.frescobaldi.org/).

## Tips n Tricks

### Transponuj partię na saksofon

These instruments are in B♭, meaning a written C sounds as a B♭. To convert a C score to Tenor, transpose up a major ninth (from C to d') or a whole step down from concert (see below).

```lilypond
\transpose c d' {
  \relative c' {
    \key c \major
    c4 d e f
  }
}
```

### Puste takty z komentarzem

```lilypond
\relative c'' {
  \key c \major
  \time 4/4
  
  % Section 1
  c4 d e f | g f e d |
  
  % Section 2: The 16-bar gap
  \mark \default
  R1*16^\markup { \italic "empty 16 bars, chorus" }
  
  % Section 3
  \mark \default
  e4 d c2 |
}
```

To keep the rehearsal mark highly visible for the player, force your text comment below the staff using _ instead of ^. This separates the structural landmark from the note to the performer.

```lilypond
\mark \default 
R1*16_\markup { \bold "empty 16 bars, chorus" }
```

### Eksportuj kilka plików PDF z pojedynczymi partiami

Save the code below into a single file (e.g., `jazz_tune.ly`). When compiled, LilyPond will automatically output three separate files: `jazz_tune-sax.pdf`, `jazz_tune-bass.pdf`, and a complete `jazz_tune-score.pdf`.

Essential Rules for This Workflow:

- `\bookOutputSuffix` Placements: This property must sit right at the top inside your `\book` wrapper before any headers or scores. Do not include the .pdf extension in the string name.
- Variable Extraction: Define your music elements outside the `\book` loops. This permits effortless code reuse and isolates structural editing from note entry.
- Unique Headers: Each independent book gets its own local `\header` block. LilyPond applies these exclusively to that specific piece's print output.

If you want to fully customize file names beyond basic suffixes, replace `\bookOutputSuffix "label"` with `\bookOutputName "Complete_Custom_Name"` to completely change the output layout.

```lilypond
\version "2.24.0"

% ==========================================
% 1. DEFINE THE CONCERT PITCH MUSIC
% ==========================================

global = {
  \key c \major
  \time 4/4
}

saxNotes = \relative c'' {
  \global
  % Music written in concert pitch (C)
  e4 d c g |
  a2 c |
}

bassNotes = \relative c {
  \global
  \clef bass
  c4 b a g |
  f2 e |
}

% ==========================================
% 2. GENERATE THE SAXOPHONE PDF
% ==========================================
\book {
  \bookOutputSuffix "sax"   % Generates: filename-sax.pdf
  
  \header {
    title = "My Jazz Tune"
    instrument = "Alto Saxophone"
  }
  
  \score {
    \new Staff {
      % Transpose the concert music up for Alto Sax (E-flat)
      \transpose c ees \saxNotes
    }
  }
}

% ==========================================
% 3. GENERATE THE BASS PDF
% ==========================================
\book {
  \bookOutputSuffix "bass"  % Generates: filename-bass.pdf
  
  \header {
    title = "My Jazz Tune"
    instrument = "Double Bass"
  }
  
  \score {
    \new Staff {
      \bassNotes
    }
  }
}

% ==========================================
% 4. GENERATE THE FULL SCORE PDF
% ==========================================
\book {
  \bookOutputSuffix "score" % Generates: filename-score.pdf
  
  \header {
    title = "My Jazz Tune"
    instrument = "Full Score (Concert Pitch)"
  }
  
  \score {
    <<
      \new Staff \with { instrumentName = "Sax" } { \saxNotes }
      \new Staff \with { instrumentName = "Bass" } { \bassNotes }
    >>
    \layout { }
  }
}
```