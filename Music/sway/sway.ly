\version "2.24.0"


\header {
  title = "Sway"
  subtitle = "a-moll"
  composer = "Peter Cincotti"
}


global = {
  \key e \minor
  \time 4/4
  \tempo 4 = 100
}


chordsA = \chordmode {
  \repeat volta 2 {
    fis1:m7.5- | b1:7.9- | e1:m7 | 1
    fis1:m7.5- | b1:7.9- | e1:m7 \alternative {
      \volta 1 { 1 }
      \volta 2 { 1 }
    }
  }
}


chordsPart = \new ChordNames \transpose e a, \chordmode {
  \global
  
  \set chordChanges = ##t
  
  s1
  
  \chordsA
  
  d1:7 | 1 | g1:maj7 | 1
  b1:7 | 1 | e:m7 | 1

  \chordsA
}


verseBody = \relative c'' {
  c4 b8 a r2 | c4 b8 a r2 | b4 a8 g r2 | r4 g8 e g e g g
  a4 g8 fis r2 | a4 g8 fis r2 | g4 b,8 e r2
}
  

melodyNotes = \transpose e a \relative c'' {
  \global
  
  r4 b8 g b g b b
  
  \sectionLabel "Verse"
  \repeat volta 2 {
     \verseBody \alternative {
      \volta 1 { r4 b8 g b g b b }
      \volta 2 { r4 e,8 fis \tuplet 3/2 { g4 fis e } }
    }
  }
  
  \break
  
  \sectionLabel "Chorus"
  \tuplet 3/2 { fis4 fis g } a2 | r4 fis8 g \tuplet 3/2 { a4 b c }
  \tuplet 3/2 { d4 d b } d2 | r4 b8 c \tuplet 3/2 { d4 c b }
  \tuplet 3/2 { dis4 dis b } dis2 | r4 b8 cis \tuplet 3/2 { dis4 cis b }
  e4 r2. | r4 b8 g b g b b
  
  \break
  
  \sectionLabel "Verse"
  \repeat volta 2 {
    \verseBody \alternative {
      \volta 1 { r4 b8 g b g b b }
      \volta 2 { r1 }
    }
  }
  \fine
}


melodyPart = \new Staff \with {
  instrumentName = ""
} { \clef "treble" \melodyNotes }


\score {
  \transpose e e {
    \compressEmptyMeasures
    %\unfoldRepeats
    <<
      \chordsPart
      \melodyPart
      %\bassPart
    >>
  }
  \layout { }
  \midi { }
}


\book {
  \bookOutputSuffix "sax"
  
  \header {
    subtitle = "h-moll (tenor sax)"
  }
  
  \transpose bes c' {
    \compressEmptyMeasures
    %\unfoldRepeats
    <<
      \chordsPart
      \melodyPart
      %\bassPart
    >>
  }
}