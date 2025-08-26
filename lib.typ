#import "local-conf.typ": *
// Theorem environments
#import "@preview/ctheorems:1.1.3": *

#let theorem = thmbox(
  "theorem",
  "Theorem",
  fill: rgb("#e8e8f8")
)

#let axiom = thmbox(
  "axiom",
  "Axiom",
  // base: "theorem",
  fill: rgb("#e8e8f8")
)

#let lemma = thmbox(
  "lemma",
  "Lemma",
  // base: "theorem",
  fill: rgb("#e8e8f8")
)

#let corollary = thmbox(
  "corollary",
  "Corollary",
  // base: "theorem", // use the theorem counter
  fill: rgb("#f8e8e8")
)

#let definition = thmbox(
  "definition",
  "Definition",
  // base: "theorem",
  fill: rgb("#eeffee")
)

#let proof = thmproof("proof", "Proof")

#let example = thmplain("example", "Example").with(numbering: none)

#let defname(name) = [#highlight[_ #name _]]

// Units
#import "@preview/zero:0.5.0": zi

// Chemical formulas

// It looks like Typsium has better architecture, but whalogen is better for now
// eventually there will be feature parity
#import "@preview/whalogen:0.2.0": ce

// Math

#let to = $arrow$

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

  // // Numbering
  // #counter(heading).update(section-number - 1)
  // #set heading(numbering: "1.1.")

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

  // // Numbering
  // #counter(heading).update(section-number - 1)
  // #set heading(numbering: "1.1.")

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


