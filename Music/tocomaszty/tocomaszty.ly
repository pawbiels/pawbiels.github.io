\version "2.24.0"

\header {
  title = "To co masz Ty"
  composer = "Dawid Podsiadło"
  poet = ""
}

global = {
  \key c \major
  \time 4/4
  \tempo 4 = 120
}

chordsPart = \new ChordNames \chordmode {
  \global
  
  r1
  
  f1 | d1:m | g1 | 1
}




vocPreVerse = \relative c'' {
  r4. fis16 16 16~ 16 e16 16~ 16 d16~ 16 16~
}

vocVerse = \relative c'' {
  
  d8 e8 r2 c16 d e d~
  d8 d8 r4. c8 e4
  e8( g,4.) r2
  
}

vocPreChorus = \relative c'' {
  r4 b b c 
}

vocChorus = \relative c'' {
  d8 d d c~ c4 r4 | d8 d d c~ c g e'4 | e8( d4.) r2
}

vocNotes = {
  
  % Przedtakt
  \vocPreVerse
  
  \sectionLabel "Zwrotka 1"
  % Zwrotka 1
  \vocVerse
  \vocPreVerse
  \vocVerse
  \vocPreChorus
  
  \sectionLabel "Refren"
  % Refren 1
  \repeat volta 2 {
    \vocChorus
    \vocPreChorus
    \vocChorus
    \alternative{
      \volta 1 { \vocPreChorus }
      \volta 2 { \vocPreVerse }
    }
  }
  
  \sectionLabel "Zwrotka 2"
  % Zwrotka 2
  \vocVerse
  \vocPreVerse
  \vocVerse
  \vocPreChorus
  
  \sectionLabel "Refren"
  % Refren 1
  \repeat volta 2 {
    \vocChorus
    \vocPreChorus
    \vocChorus
    \alternative{
      \volta 1 { \vocPreChorus }
      \volta 2 {  }
    }
  }
  
}



saxChorus = \relative c'' {
  
  a2 g | f e | d1 | d2 r
  
}

saxNotes = {
  r1*9
  
  \saxChorus
}



gitNotes = \relative c {
  r1 |
  f8 f8 c'8~ c16 f,16~ f16 f16 f8 c'8 c8 |
  d,8 d8 a'8~ a16 d,16~ d16 d16 a8 a'8 a8 |
  g8 g8 d'8~ d16 g,16~ g16 g16 g8 d'8 d8 |
  g,8 g8 d'8~ d16 g,16~ g16 g16 g8 d'8 d8 |
}



Bass = \relative c {
}



vocPart = \new Staff {
  \global
  \clef treble
  \new Voice = "vocals" {
    \vocNotes
  }
}

gitPart = \new Staff {
  \global
  \clef "treble_8"
  \gitNotes
}

saxPart = \new Staff {
  \global
  \clef "treble_8"
  \saxNotes
}


vocChorus = \lyricmode {
  
  % Refren
  A dla mnie
  \repeat volta 2 {
    li -- czy się to
    Li -- czy się to, co masz Ty
    Nie -- wa -- żne z_prą -- dem czy pod
    Ja pój -- dę, gdzie pój -- dziesz Ty
    \alternative {
      \volta 1 { A dla mnie }
    }
  }
  
}

vocWords = \lyricmode {
  
  % Przedtakt + Zwrotka 1
  Za -- pra -- sza -- my na pre -- mie -- rę
  Szkla -- nych bu -- te -- lek, no -- wy klip
  Tyl -- ko pan czy dać plus je -- den
  Po -- tem af -- te -- rek, ze -- ro zdjęć
  
  \vocChorus
  
  % Zwrotka 2
  Ko -- mu wró -- ży pan kar -- ie -- rę
  A_ko -- mu zwy -- czaj -- ne sza -- re dni
  No i kie -- dy to we -- se -- le
  Pro -- szę po -- wie -- dzieć cho -- ciaż z_kim
  
  % Refren
  A dla mnie
  \repeat volta 2 {
    li -- czy się to
    Li -- czy się to, co masz Ty
    Nie -- wa -- żne z_prą -- dem czy pod
    Ja pój -- dę, gdzie pój -- dziesz Ty
    \alternative {
      \volta 1 { A dla mnie }
    }
  }
  
  \vocChorus

}

lyricsPart = \new Lyrics \lyricsto "vocals" {
  \vocWords
}

\score {
  <<
    \chordsPart
    \vocPart
    \lyricsPart
    %\gitPart
    %\saxPart
  >> 
  \layout { }
  \midi { }
}