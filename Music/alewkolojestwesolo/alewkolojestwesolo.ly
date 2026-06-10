\version "2.24.0"

\header {
  title = "Ale wkoło jest wesoło"
  subtitle = "Perfect"
  composer = "Zbigniew Hołdys"
}


global = {
  \clef "treble_8"
  \key b \minor
  \time 4/4
  \tempo "Presto" 4 = 180
}


Intro = \relative c {
  \global
  \repeat unfold 3 {
  <b e a cis fis>8 <b fis' a d fis> 8 8 8 r8 8 r4 |
  <a e' a cis fis>8 r4 <g d' g b d g>4 8 r4 |
  }
  <b e a cis fis>8 <b fis' a d fis> 8 8 8 r8 8 r4 | r1 |
}


\score {
  <<
    % Chords
    \new ChordNames {
      \Chords
    }

    % Verse 1
    \new Staff = "StaffOne" <<
      \clef treble
      \new Voice = "VoiceOne" {
        \Intro
      }
    >>
  >>
  
  \layout { }
  \midi { }
}