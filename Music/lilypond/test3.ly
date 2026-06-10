\version "2.24.4"

global = {
  \time 4/4
  \key c \major
  \repeat volta 2 {
    s1 * 4 % 4 measures of space
  }
  \alternative {
    \volta 1 { s1 * 2 }
    \volta 2 { s1 * 2 }
  }
}

violinNotes = \relative c'' {
  % Repeat Section
  c4 d e f | g a b c | c b a g | f e d c |
  % Volta 1
  e1 | d |
  % Volta 2
  g1 | c, |
}

celloNotes = \relative c {
  \clef bass
  % Repeat Section
  c1 | e | g | c |
  % Volta 1
  c, | g' |
  % Volta 2
  b | c |
}

% \score {
%   \new StaffGroup <<
%     \new Staff << \global \violinNotes >>
%     \new Staff << \global \celloNotes >>
%   >>
%   \layout { }
% }

% Save only the MUSIC expression into the variable, NOT the \score block itself
myMusic = \new StaffGroup <<
  \new Staff << \global \violinNotes >>
  \new Staff << \global \celloNotes >>
>>

% 1. This block prints the standard sheet music with brackets
\score {
  \myMusic
  \layout { }
}

% 2. This block generates a perfectly unrolled audio track
\score {
  \unfoldRepeats \myMusic
  \midi { }
}