#import "local-conf.typ": *

// Fonts
#let fonts = (
  libertinus-serif: (
    font: "Libertinus Serif"
  ),
  newcm: (
    font: "New Computer Modern"
  ),
  dejavu-sans-mono: (
    font: "DejaVu Sans Mono"
  )
)

#let math-fonts = (
  newcm-math: (
    font: "New Computer Modern Math",
    features: (
      // Round emptyset
      cv01: 1,
      // Blackboard bold from Computer Modern with smallcaps
      ss03: 1,
      ss05: 1,
    )
  ),
)

#let set-text-font(font: fonts.libertinus-serif, doc) = {
  set text(..font)
  doc
}

#let set-mono-font(font: fonts.dejavu-sans-mono, doc) = {
  show raw: set text(..font)
  doc
}

#let set-math-font(font: math-fonts.newcm-math, doc) = {
  show math.equation: set text(..font)
  doc
}

// Equivalent of LaTeX \mathscr
// FIXME: Only works on newcm-math
#let scr(it) = text(
  features: ("ss01",),
  box($cal(it)$),
)

// Theorem environments
#import "@preview/ctheorems:1.1.3": *

#let theorem = thmbox(
  "maincounter",
  "Theorem",
  fill: rgb("#e8e8f8")
)

#let axiom = thmbox(
  "maincounter",
  "Axiom",
  // base: "theorem",
  fill: rgb("#e8e8f8")
)

#let lemma = thmbox(
  "maincounter",
  "Lemma",
  // base: "theorem",
  fill: rgb("#e8e8f8")
)

#let corollary = thmbox(
  "maincounter",
  "Corollary",
  // base: "theorem",
  fill: rgb("#f8f3e8")
)

#let warning = thmbox(
  "maincounter",
  "Warning",
  // base: "theorem", // use the theorem counter
  fill: rgb("#f8e8e8")
)

#let definition = thmbox(
  "maincounter",
  "Definition",
  // base: "theorem",
  fill: rgb("#eeffee")
)

#let proof = thmproof("proof", "Proof")

#let example = thmplain("example", "Example").with(numbering: none)

#let defname(name) = [_*#name*_]

// Units
#import "@preview/zero:0.5.0": zi

// Chemical formulas

// It looks like Typsium has better architecture, but whalogen is better for now
// eventually there will be feature parity
#import "@preview/whalogen:0.2.0": ce

// Math
#import "@preview/physica:0.9.5": *

#let to = sym.arrow
#let implies = sym.arrow.r.double
#let iff = sym.arrow.l.r.double
#let setminus = sym.backslash

#let Reals = sym.RR
#let Naturals = sym.NN
#let Integers = sym.ZZ
#let Complex = sym.CC
#let Rationals = sym.QQ

// Style for the document

#let ekactl-style(
  section-number: 1,
  title: "Hello",
  doc
) = [
  // Page setup
  #set page(
    width: preview-width,
    height: auto,
    margin: 1em,
    columns: 1,
  ) if is-previewing
  #set page(
    paper: "us-letter",
    columns: 3,
    flipped: true,
    margin: 20pt,
  ) if not is-previewing

  #show: thmrules.with(qed-symbol: $square$)

  // Font
  #show: set-text-font.with(font: fonts.libertinus-serif)
  #show: set-mono-font.with(font: fonts.dejavu-sans-mono)
  #show: set-math-font.with(font: math-fonts.newcm-math)

  // Heading numbering
  #set heading(numbering: "1.1.")

  // Title
  #set document(title: [#title])

  #text(
    weight: "semibold",
    size: 10pt
  )[EKACTL, section #section-number] \
  #text(
    weight: "black",
    size: 24pt
  )[#title]

  #doc

  #if is-previewing [#v(10cm)]
]

#let ethan-standard-style(
  doc
) = [
  // Page setup
  #set page(
    width: preview-width,
    height: auto,
    margin: 1em,
    columns: 1,
  ) if is-previewing
  #set page(
    paper: "us-letter",
    columns: 3,
    flipped: true,
    margin: 20pt,
  ) if not is-previewing

  #show: thmrules.with(qed-symbol: $square$)

  // Font
  #show: set-text-font.with(font: fonts.libertinus-serif)
  #show: set-mono-font.with(font: fonts.dejavu-sans-mono)
  #show: set-math-font.with(font: math-fonts.newcm-math)

  #doc

  #if is-previewing [#v(10cm)]
]


