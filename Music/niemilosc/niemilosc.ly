\version "2.24.0"

\header {
  title = "Niemiłość"
  subtitle = "Tonacja E (sax Gb)"
  composer = "Organek (2019)"
}

global = {
  \key g \major
  \time 4/4
  \tempo 4 = 108
}

czarekLick = \relative c' {
  \repeat volta 2 {
    r4 a16 b d b e8 d b fis~ | 4. e4. d4
    r4 fis r8 fis r g~ | 1
  }
}

melodyNotes = \transpose g g \relative c' {
  \global
  
  \textMark "Intro"
  R1*16
  
  \textMark "Zwrotka 1"
  R1*8 \break
  R1*3^\markup{"Patrz ptaki już wracają..."} | r2 r8 a4.
  fis1\> | r2\! r8 a4. | g1\> | r1\! \break
  
  \textMark "Refren"
  \repeat volta 2 { a1~ | 2 r2 }
  \repeat volta 4 { a4. 4. 4 } \break
  
  \textMark "Intro"
  R1*8
  \repeat percent 7 { d1~ } 1
  
  \textMark "Zwrotka 2"
  R1*8 \break
  R1*3^\markup{"A słońce w prześwitach..."} | r2 r8 a4.
  fis1 | r2 r8 a4. | g1 | r1 \break
  
  \textMark "Refren"
  \repeat volta 2 { a1~ | 2 r2 }
  \repeat volta 4 { a4. 4. 4 } \break
  
  \textMark "Ona nie szuka..."
  R1*7 | r2 r4. g8-"ją!"
  
  \repeat volta 2 {
    g1~ | 2.~ 8 d'~ | 2.~ 8 e~ | \alternative {
      \volta 1 { 2.~ 8 g,~ }
      \volta 2 { e'1 }
    }
  } \break
  
  \czarekLick \break
  
  \repeat percent 7 { d8 d b d d b d b } d8 d b d d b d4 \break
  
  \czarekLick r1\fermata | r1\fermata \fine
}

bassNotes = \relative c {
  \global
  
  \partial 8 { g8 }
  
  \repeat volta 2 {
    g8 8 fis8 8 e8 8 8 d8 | 8 8 c8 8 b8 8 8 8 |
    8 8 8 8 8 8 8 c8 | \alternative{
      \volta 1 { 8 8 8 8 8 8 8 g' }
      \volta 2 { c,8 8 8 8 8 8 8 8 }
    }
  }
  
  \repeat volta 2 {
    g2.~ 8 8~ | 1 | b2~ 8 4 c8~ | c1
  }
  
  \repeat volta 2 {
    \repeat percent 2 { d4. 4 4. } e4. 4 4. | fis4. g4 4.
  }
  
  \repeat volta 2 {
    g,2.~ 8 8~ | 1 | b2~ 8 4 c8~ \alternative {
      \volta 1 c1
      \volta 2 c1~
    }
  }
  c1\fermata | r1\fermata
}

melodyPart = \new Staff \with {
  instrumentName = "Sax"
  midiInstrument = "tenor sax"
} { \clef "treble_8" \melodyNotes }

melodyPart_trans = \new Staff \with {
  instrumentName = "Sax"
  midiInstrument = "tenor sax"
} { \clef "treble" \transpose bes c'' \melodyNotes }

bassPart = \new Staff \with {
  instrumentName = "Bass"
  midiInstrument = "electric bass (pick)"
} { \clef "bass_8" \bassNotes }



\book {
  \bookOutputSuffix "sax"   % Generates: filename-sax.pdf
  
  \header {
    instrument = "Czarek Sax"
  }
  
  \score {
    \unfoldRepeats {
      \compressEmptyMeasures
      \melodyPart_trans
    }
  \layout { 
    \context {
      \RemoveAllEmptyStaves
    }
  }
  \midi { }
  }
}


\score {
    \unfoldRepeats <<
      \compressEmptyMeasures
      \melodyPart
      %\bassPart
    >>
  \layout { 
    \context {
      \RemoveAllEmptyStaves
    }
  }
  \midi { }
}