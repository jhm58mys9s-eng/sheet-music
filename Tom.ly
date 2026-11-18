\version "2.26.0"

\header {
  title = "Untitled"
  composer = "Composer"
}

\score {
  \relative c' {
    c4
  }

  \layout {}
  \midi {}
}\version "2.24.0"

\header {
  title = "Tom Traubert's Blues"
  subtitle = "(Four Sheets to the Wind in Copenhagen)"
  composer = "Tom Waits"
  arranger = "Arr. für Violine Duo (1. Lage)"
  tagline = ##f
}

\paper {
  #(set-paper-size "a4")
  top-margin = 15\mm
  bottom-margin = 15\mm
  left-margin = 15\mm
  right-margin = 15\mm
}

global = {
  \key f \major
  \time 4/4
  \tempo "Slow Ballad" 4 = 68
}

akkorde = \chordmode {
  % Intro
  f1 | bes1 | f1 | c1 | \break
  % Strophe
  f1 | bes1 | f1 | c1 | \break
  f1 | bes1 | f2 c2 | f1 | \break
  % Refrain
  f1 | c1 | d1:m | bes1 | \break
  f1 | bes1 | f2 c2 | f1 | \break
  % Outro
  bes1 | f1 | c1 | f1 |
}

violineEins = \relative c' {
  \global
  \set Staff.instrumentName = "Violine 1"
  \set Staff.shortInstrumentName = "Vl. 1"

  % Intro
  \mark \markup { \box "Intro" }
  r2\p a'4( c) | d2( f,2) | a2( g4 f) | g1 |

  % Strophe
  \bar "||"
  \mark \markup { \box "Strophe" }
  a4\mp a c a | f d f2 | a4 a c a | g1 |
  a4 a c a | f d f d | c f g e | f1 |

  % Refrain
  \bar "||"
  \mark \markup { \box "Refrain" }
  c'4\mf c c a | d c a g | f f g a | f d c2 |
  a'4\mp a c a | f d f d | c f g e | f1 |

  % Outro
  \bar "||"
  \mark \markup { \box "Outro" }
  f4\p d f d | c2( f2) | g2\dim e2 | f1\pp\fermata |
  \bar "|."
}

violineZwei = \relative c' {
  \global
  \set Staff.instrumentName = "Violine 2"
  \set Staff.shortInstrumentName = "Vl. 2"

  % Intro
  f4^\markup { \italic "pizz. oder weich arco" }\p c f c | d bes d bes | f' c f c | e c g2 |

  % Strophe
  f'4^\markup { \italic "arco" }\mp f a f | d bes d2 | f4 f a f | e1 |
  f4 f a f | d bes d bes | a d e c | c1 |

  % Refrain
  a'4\mf a a f | bes a f e | d d e f | d bes a2 |
  f'4\mp f a f | d bes d bes | a d e c | c1 |

  % Outro
  d4\p bes d bes | a2( c2) | c2\dim bes2 | a1\pp\fermata |
}

\score {
  <<
    \new ChordNames {
      \set chordChanges = ##t
      \akkorde
    }
    \new StaffGroup <<
      \new Staff { \violineEins }
      \new Staff { \violineZwei }
    >>
  >>
  \layout {
    \context {
      \Score
      \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/8)
    }
  }
  \midi { }
}