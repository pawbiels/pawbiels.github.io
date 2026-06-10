\version "2.24.0"

\header {
  title = "To co masz Ty"
  composer = "Dawid Podsiadło"
  poet = ""
}

global = {
  \key c \major
  \time 4/4
  \tempo "Allegro" 4 = 60
}

Chords = \chordmode {
}

Melody = \relative c'' {
  r4. fis16 16 16( e16) e16 8 d8 d16~ | d8 e8 r2 c16 d e d~ |
  d8 d8 r4. c8 e4 | e8( g,8 g4) r2 |
  r4. fis'16 16 8( e16) 8 d8 d16 |
}

Guitar = \relative c {
  r1 |
  f8 f8 c'8~ c16 f,16~ f16 f16 f8 c'8 c8 |
  d,8 d8 a'8~ a16 d,16~ d16 d16 a8 a'8 a8 |
  g8 g8 d'8~ d16 g,16~ g16 g16 g8 d'8 d8 |
  g,8 g8 d'8~ d16 g,16~ g16 g16 g8 d'8 d8 |
}

Bass = \relative c {
}

\score {
  \new StaffGroup <<
    \new Staff {
      \clef treble
      \global
      \Melody
    }
    \new Staff {
      \clef "treble_8"
      \global
      \Guitar
    }
    % \new Staff {
    %   \clef bass
    %   \global
    %   \Bass
    % }  
  >>
  \layout { }
  \midi { }
}