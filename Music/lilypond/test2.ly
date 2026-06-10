\version "2.24.4"

structure = {
  \sectionLabel "Elo"
  \repeat volta 2 { s1 * 2 }
  \alternative {
    \volta 1 { s1 }
    \volta 2 { s1 }
  }
}

flute = \relative c'' { g4 f e d | c d e f | g1 | c1 | }
oboe  = \relative c'' { e4 d c b | a b c d | e1 | e1 | }

\score {
  <<
    % This keeps track of time without printing anything extra
    \new Devnull \structure 
    
    \new StaffGroup <<
      \new Staff \flute
      \new Staff \oboe
    >>
  >>
  \layout { }
}
