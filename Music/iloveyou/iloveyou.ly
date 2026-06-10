\version "2.24.0"

\header {
  title = "I love you"
  subtitle = ""
  composer = "T.Love"
  %instrument = "Czarek Sax"
}

global = {
  \key g \major
  \time 4/4
  \tempo 4 = 80
}

% Structures

introStructure = \repeat volta 2 {
  s1*2
}
themeLongStructure = \repeat volta 4 {
  s1 \alternative {
    \volta 1 { s1 }
    \volta 2 { s1 }
  }
}

structure = {  
  \global
  
  
  \sectionLabel "Intro gitara" \break
  s1*4
  
  \sectionLabel "Intro" \break
  s1*8
  
  \sectionLabel "Zwrotka 1" \break
  s1*8
  
  \sectionLabel "Break" \break
  s1*4
  
  \sectionLabel "Zwrotka 2" \break
  s1*8
  
  \sectionLabel "Refren" \break
  s1*8
  
  \sectionLabel "Intro" \break
  s1*4
  
  \sectionLabel "Zwrotka 3" \break
  s1*8
  
  \sectionLabel "Break" \break
  s1*4
  
  \sectionLabel "Zwrotka 4" \break
  s1*8
  
  \sectionLabel "Refren" \break
  s1*8
  
  \sectionLabel "Special break" \break
  s1*4
  
  \sectionLabel "Zwrotka 5" \break
  s1*8
  
  \sectionLabel "Refren" \break
  s1*16
}



% Harmony

verseChords = \repeat volta 2 {
  g2 d2 | c1 | g2 d2 | c1
}

chordNames = \chordmode {
  \global
  \set chordChanges = ##t
  
  % Intro gitara
  \repeat volta 2 {
    g2~ 8 c8 d4 | c1
  }
  
  % Theme
  \repeat volta 2 {
    g2. d4 | c2. bes4 | g2. d4 | c2. bes4
  }
  
  % Verse 1
  \verseChords
  
  % Break
  \repeat volta 2 {
    g2. d4 | c2. bes4
  }
  
}

chordsPart = \new ChordNames \chordNames



mainLick = \relative c' {
  g16 g' d r e bes g d' r fis d r e bes r8
}

gitNotes = \relative c' {
  \global
  
  % Intro gitara
  R1*4
  
  \repeat unfold 8 { \mainLick }
}





saxPreVerse = \relative c' { r2. r16 b32 32 16 a16 }

saxVerse = \relative c'{ 
  \repeat volta 4 {
    g16 16 16 16 16 16 16 16 g8 a8 a16 a e8
    \alternative{
      \volta 1,2,3 { r2. r16 b'32 32 16 a16 }
      \volta 4 { R1 }
    }
  }
}

saxChorus = \relative c' {
  d2. d4 | c4.~ c16 d16 e4 e16 d16 r8
}

saxNotes = \relative c' {
  \global
  
  % Intro gitara
  R1*4
  
  % Intro wszyscy
  R1*7 | \saxPreVerse 
  
  % Zwrotka 1
  \saxVerse 
  
  % Break
  d,2. a'4 | g1 | d2. a'4 | g2. ~16 b32 32 16 a16 
  
  % Zwrotka 2
  \saxVerse 
  
  % Refren
  \repeat volta 4 { \saxChorus } 
  
  % Intro
  R1*3 | \saxPreVerse 
  
  % Zwrotka 3
  \saxVerse 
  
  % Break
  d,2. a'4 | g1 | d2. a'4 | g2. ~16 b32 32 16 a16 
  
  % Zwrotka 4
  \saxVerse 
  
  % Refren
  \repeat volta 4 { \saxChorus } 
  
  % Special break
  r4 r16 c32 32 c16 16 c16 b g8 g4 | r1
  r4 r16 c32 32 c16 16 c16 b g8 g4 | r2 e'4 d
  
  % Zwrotka 5  
  R1*8
  
  % Refren
  \repeat volta 7 { \saxChorus }
  d2. d4 | c2. r4
}

bassNotes = \relative c, {
  \global
}



gitPart = \new Staff \with {
  instrumentName = "Git"
  midiInstrument = "electric guitar (jazz)"
} { \clef "treble_8" \global \gitNotes }

saxPart = \new Staff \with {
  instrumentName = "Sax"
  midiInstrument = "tenor sax"
} { \clef "treble_8" << \structure \saxNotes >> }

saxPart_trans = \new Staff \with {
  instrumentName = "Sax"
  midiInstrument = "tenor sax"
} { \clef "treble" \transpose bes c'' << \structure \saxNotes >> }

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
    \saxPart_trans
  }
  \layout { }
  }
  
}


\score {
  \transpose e e {
    \unfoldRepeats <<
    %<< 
     %\compressEmptyMeasures
      \chordsPart
      \gitPart
      \saxPart
      %\bassPart
    >>
  }
  \layout { }
  \midi { }
}