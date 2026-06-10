\version "2.24.0"

\header {
  title = "Ale wkoło jest wesoło"
  composer = "Perfect"
  poet = ""
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% GLOBAL SETTINGS
%%%%%%%%%%%%%%%%%%%%%%%%%%%%

global = {
  \clef "treble_8"
  \key b \minor
  \time 4/4
  \tempo "Presto" 4 = 180
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% MELODY
%%%%%%%%%%%%%%%%%%%%%%%%%%%%	

Intro = \relative c {
  \global
  \repeat unfold 3 {
  <b e a cis fis>8 <b fis' a d fis> 8 8 8 r8 8 r4 |
  <a e' a cis fis>8 r4 <g d' g b d g>4 8 r4 |
  }
  <b e a cis fis>8 <b fis' a d fis> 8 8 8 r8 8 r4 | r1 |
}

% LyricsOne = \lyricmode {
%   O nie -- ba płyn -- nych po -- gód,
%   o pta -- ki, o na -- tchnie -- nia.
%   Nie wy -- dep -- ta -- na zie -- mia,
%   nie -- wy -- śpie -- wa -- ne Bo -- gu
%   te drze -- wa, te kas -- ka -- dy
%   is -- kier, ten od -- dech nie -- ba
%   "w ra" -- mio -- nach jak "w ko" -- le -- bach
%   zam -- knię -- ty. O
% }

%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% CHORD SYMBOLS
%%%%%%%%%%%%%%%%%%%%%%%%%%%%

Chords = \chordmode {
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% BASS NOTES (TREBLE CLEF)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%

Bass = \relative c' {
  \global
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% LYRICS
%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% LyricsTwo = \lyricmode {  
%   Jak co -- ko -- ły
%   drze -- wa "z szu" -- mem na -- po -- ły.
%   Ser -- ca jak dzba -- ny łas -- ki,
%   ta -- kie ser -- ca jak gwiaz -- dki,
%   ta -- kie o -- czu o -- bło -- ki,
%   ta -- ki lot za wy -- so -- ki.
% }

%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% SCORE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\score {
  <<
    % Chords
    \new ChordNames {
      \Chords
    }

    % Verse 1
    \new Staff = "StaffOne" <<
      \clef treble
      \new Voice = "VoiceOne" {
        \Intro
      }
    >>

    % Lyrics
    % \new Lyrics \lyricsto "VoiceOne" {
    %   \LyricsOne
    % }

    % Second staff (bass notes)
    %\ new Staff {
    %   \clef bass
    %   \Bass
    % }
  >>
  
  \layout { }
  \midi { }
}