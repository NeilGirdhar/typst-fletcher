#set page(width: auto, height: auto, margin: 1em)
#import "/src/exports.typ" as fletcher: cetz, diagram, edge, node

#diagram(
  node-fill: orange,
  node((0, 0), $A$),
  edge("->", shift: +2pt),
  edge("<-", shift: -2pt),
  node((1, 0), $B$),
)


#diagram(
  node-fill: teal,
  node((0, 0), $A$),
  edge("-|>", bend: 40deg, shift: -2pt),
  edge("<|-", bend: 40deg, shift: +2pt),
  node((1, 0), $B$),
)


// Pairs shift each end independently.
#diagram(
  node-stroke: 0.5pt,
  node((0, 0), $A$, name: <a>),
  node((2, 0), $B$, name: <b>),
  node((2, 1), $C$, name: <c>),
  edge(<a>, <b>, "->", shift: (0pt, +6pt)),
  edge(<a>, <b>, "->", shift: (0pt, -6pt)),
  edge(<a>, "d", <c>, "->", shift: (6pt, 0pt)),
  edge(<a>, "d", <c>, "->", shift: (0pt, 6pt)),
)

// A single shift moves the ends before snapping, so they meet the node outlines.
#let fan(..args) = diagram(
  node-stroke: 0.5pt,
  node-shape: circle,
  node((0, 0), $A$, name: <a>),
  node((2, 1), $B$, name: <b>),
  edge(<a>, ..args, <b>, stroke: gray),
  edge(<a>, ..args, <b>, "->", shift: +6pt),
  edge(<a>, ..args, <b>, "->", shift: -6pt),
)
#fan()
#fan(bend: 40deg)
#fan(corner: "-|")
#fan("r,d")
#fan((rel: (1.5, 0.3)))

// Polylines shift only their first and last legs; the legs between stay on the grid.
#diagram(
  debug: "grid.lines",
  node-stroke: 1pt,
  node-shape: "circle",
  node((0, 0), `A`, inset: 5pt),
  edge("r,d", "->", shift: 0, stroke: black),
  edge("r,d", "->", shift: 5pt, stroke: green),
  edge("d,r", "->", shift: (0, 5pt), stroke: orange),
  edge("d,r", "->", shift: (5pt, 0), stroke: blue),
  edge("rr,dd,l,u", "->", shift: (-5pt, 0pt), stroke: fuchsia),
  node((1, 1), `B`, inset: 5pt),
  node((2, 2)),
)
