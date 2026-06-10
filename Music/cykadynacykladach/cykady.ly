\version "2.24.0"

\header {
  title = "Cykady na cykladach"
  composer = "Manaam"
  poet = ""
}

global = {
  \key fis \minor
  \time 4/4
  \tempo "Presto" 4 = 180
}

Intro = \relative c'' {
  \tuplet 3/2 { r4 fis4 4 } \tuplet 3/2 { fis4 4 4 } | fis1 |
  \tuplet 3/2 { r4 cis4 4 } \tuplet 3/2 { cis4 fis,4 4 } | fis1 |
  \tuplet 3/2 { r4 fis'4 4 } \tuplet 3/2 { fis4 cis4 4 } | cis1 |
  \tuplet 3/2 { r4 fis,4 4 } \tuplet 3/2 { fis4 4 4 } | fis1 |

}

Chords = \chordmode {
}

MelodyA = \relative c'' {
  % Zwrotka
  r8 a8 8 8 8 8 8 8 |
  \mark \default
  \repeat volta 2 {
    fis8 8 r2. | r8 fis8 8 8 8 8 8 cis |
    e8 8 r2. | r8 e8 8 8 8 8 8 8 |
    fis4 r2. | r8 fis8 8 8 a8 fis8 8 e |
    fis4 r2. |
    \alternative {
      \volta 1 { r8 a8 8 8 8 8 8 8 | }
      \volta 2 { r1 | }
    }
  }
}

BassA = \relative c {
  r1 |
  % Zwrotka
  \repeat unfold 2 { fis4 a8 fis a4 b8 cis | }
  \repeat unfold 2 { e,4 gis8 e gis4 a8 b | }
  \repeat unfold 2 { b,4 d8 b d4 e8 fis | }
  fis4 a8 fis a4 b8 cis | fis8 r r2. |
  \volta 2 { fis8 r r2. }
}

MelodyB = \relative c'' {
  \mark \default
  r2 \tuplet 3/2 { a4 4 4 } | a2. d,4 |
  \tuplet 3/2 { e2 4 } r2 | r1 |
  r2 \tuplet 3/2 { a4 4 4 } | a2. a4 |
  \tuplet 3/2 { a4( b4) 4 } r2 | r1 |
  r2 \tuplet 3/2 { a4 4 4 } | a2( \tuplet 3/2 { a4) fis4 d } |
  \tuplet 3/2 { e2 4 } r2 | r1 |
  r2 \tuplet 3/2 { cis'4 4 4 } | d2. cis4 |
  b2. a4 | gis4 r2. |
}

BassB = \relative c {
  \repeat unfold 3 {
    a8 8 cis e r8 a,8 cis e | d8 8 fis a r8 d,8 fis a |
    e8 8 gis b r8 e,8 gis b | e,8 8 d8 8 cis8 8 b8 8 |
  }
}

\score {
  {
    \new Staff {
      \global
      \Intro
  }

  \new StaffGroup <<
    \new Staff { %Melody
      \clef treble
      \global
      \MelodyA
      \MelodyB
    }

    \new Staff { %Bass
      \clef bass
      \global
      \BassA
      \BassB
    }
  
  >>
  }
  \layout { }
  \midi { }
}