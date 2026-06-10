\version "2.24.4"

global = {
  \key c \major
  \time 4/4
}

jazzGuitar = \relative c' {
  \global
  c1 | a2 b2 | c2 g2
}

acousticBass = \relative c, {
  \global
  g1 | c1 | d4 e f g 
}

chordNames = \chordmode {
  \global
  c1:maj7 | a2:m a:m7 | <c e g d'>1
}

guitarPart = \new Staff \with {
  midiInstrument = "electric guitar (jazz)"
  instrumentName = "Guitar"
} { \clef "treble_8" \jazzGuitar }

bassPart = \new Staff \with {
  midiInstrument = "Acoustic bass"
  instrumentName = "Bass"
} { \clef "bass_8" \acousticBass }

chordsPart = \new ChordNames \chordNames

\score {
  <<
    \guitarPart
    \chordsPart
    \bassPart
  >>
  \layout { }
  \midi {
    \tempo 4=100
  }
}
