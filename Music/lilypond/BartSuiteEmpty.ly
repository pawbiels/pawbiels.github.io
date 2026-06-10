\version "2.24.4"

{
  \repeat unfold 33
    \repeat unfold 12
    {
      s1
      \break
    }
}

\layout {
  \context {
    \Score
    \remove "Bar_number_engraver"
  }
  \context {
    \Staff
    \remove "Clef_engraver"
    \remove "Time_signature_engraver"
    \remove "Bar_engraver"
  }
}

\paper {
  indent = 0
  ragged-last-bottom = ##f
  top-system-spacing = #'((minimum-distance . 10))
  last-bottom-spacing = #'((minimum-distance . 10))
}

\header {
  title = "Good luck, Bart!"
  piece = "Zero Distractions 31-Page Suite"
  composer = "Gary Burton"
  tagline = "Hope that helps, Bart!"
}

