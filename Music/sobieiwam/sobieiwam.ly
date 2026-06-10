\version "2.24.0"



\header {
  title = "Sobie i Wam"
  subtitle = "Męskie Granie"
  composer = "Katarzyna Nosowska, Marcin Macuk (2019)"
}



global = {
  \key b \minor
  \time 4/4
  \tempo 4 = 114
}



saxNotes = \relative c' {
  \global
  
   R1*15
  \textMark "Zwrotka 2" R1*16 \break

  \textMark "Refren 1"
  \repeat volta 2 {
    b2~ b8 cis4 d8~ | d2~ d8 a'4 fis8~ \alternative {
      \volta 1 { fis2~ fis8 e4 a8~ | a1 \break }
      \volta 2 { fis1 | r1 }
    }
  }
  
  % \break
  \textMark "Zwrotka 1" R1*15 \break
  
  \textMark "Refren 2"
  \repeat volta 4 {
    \break
    | b,8 cis4 d4 e4 b8~| b8 cis4 d4 e4~ e8 |
    \alternative{
      \volta 1,3 { b8 cis4 d e fis8~ | fis8 d4 e4 a,8~ a4 | }
      \volta 2 { b2~b4. a8~ | a4. d8~ d2 | }
      \volta 4 { e1 | r1 | }
    }
  }
  
  \textMark "Refren 3 (Sax Piano Voc)"
  \break
  | b2~ b8 cis4 d8~ | d2~ d8 a'4 fis8~ | fis2~ fis8 e4 a8~ | a1 |
  \break
  | b,2~ b8 cis4 d8~ | d2~ d8 a'4 fis8~ | fis1 | r1 |
  
  %{
  \unfoldRepeats{
    \repeat volta 2 {
      \break
      | b8 cis4 d4 e4 b8~| b8 cis4 d4 e4 b8~ |
      \alternative{
        \volta 1 { b8 cis4 d e fis8~ | fis8 d4 e4 a,8~ a4 | }
        \volta 2 { b1 | r1 | }
      }
    }
  }
  %}
  
  \textMark "Refren 4 (full band)"

  \repeat volta 3 {
    \break
    | b,8 cis4 d4 e4 b8~| b8 cis4 d4 e4 b8~ |
    \alternative{
      \volta 1,3 { b8 cis4 d e fis8~ | fis8 d4 e4 a,8~ a4 | }
      \volta 2 { b2~ b4. a8~ | a2. r4 | }
    }
  }
 
  \break
  | b8 cis4 d4 e4 b8~| b8 cis4 d4 e4.~ | e1~ | e2. r4 | \fine
}



chordNames = \chordmode {

  \set chordChanges = ##t
  
  % Zwrotka 1
  b1*4:m
  b1*4:m
  d1 e1:m b1*2:m
  d1 e1:m b1:m
  
  % Zwrotka 2
  b1*4:m
  b1*4:m
  d1 e1:m b1*2:m
  d1 e1:m b1*2:m
  
  % Refren 1
  \repeat volta 2 {
    e2:m~ 8 e4:m/fis g8~ | 2~ 8 a4 b8:m~ \alternative {
      \volta 1 { b2:m~ 8 cis4:m d8~ | 2~ 8 e4.:m }
      \volta 2 { b1*2:m }
    }
  }
  
}



saxPart = \new Staff \with {
  instrumentName = "Sax"
  midiInstrument = "tenor sax"
} { \clef "treble_8" \saxNotes }



chordsPart = \new ChordNames \with{
  midiInstrument = "pad 2 (warm)"
} \chordNames


 
  
\book {
  \bookOutputSuffix "sax"   % Generates: filename-sax.pdf
  
  \header {
    instrument = "Czarek Sax"
  }
  
  \transpose c d {
    \compressEmptyMeasures
    \unfoldRepeats{\saxPart}
  }
}



\score {
  \unfoldRepeats {
    <<
      \chordsPart
      \saxPart
    >>
  }
  \layout { }
  \midi { }
}