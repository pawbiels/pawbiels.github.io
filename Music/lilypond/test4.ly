\version "2.24.4"

global = {
  \key c \major
  \time 4/4
  
  % Oznaczenie tempa na samym początku
  \tempo "Allegro" 4 = 120
  
  \repeat volta 2 {
    s1 * 4
  }
  \alternative {
    \volta 1 {
      s1 * 2
      % Wymuszamy przejście do nowej linii na końcu pierwszej volty
      \break 
    }
    \volta 2 {
      s1 * 2
    }
  }
  
  % Automatyczna litera próby (w tym przypadku pojawi się "A")
  \mark \default
  \tempo "Andante" 4 = 80
  s1 * 2
}

violinNotes = \relative c'' {
  % Główna sekcja z powtórzeniem (używamy uproszczonego \repeat unfold)
  \repeat unfold 2 {
    c4 d e f | g a b c | c b a g | f e d c |
  }
  % Volta 1
  e1 | d | 
  
  % Volta 2
  g1 | c, | 
  
  % Nowa sekcja (Litera A)
  e2 g | c1 |
}

celloNotes = \relative c {
  \clef bass
  % Główna sekcja z powtórzeniem
  \repeat unfold 2 {
    c1 | e | g | c |
  }
  % Volta 1
  c,1 | g' | 
  
  % Volta 2
  b1 | c | 
  
  % Nowa sekcja (Litera A)
  c,1 | c'1 |
}

myMusic = \new StaffGroup <<
  \new Staff << \global \violinNotes >>
  \new Staff << \global \celloNotes >>
>>

% 1. Generator PDF (Z zachowaniem układu graficznego i podziałów linii)
\score {
  \myMusic
  \layout { }
}

% 2. Generator MIDI (Z pełnym rozwinięciem powtórzeń i zmian tempa)
\score {
  \unfoldRepeats \myMusic
  \midi { }
}
