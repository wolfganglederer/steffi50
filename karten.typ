#set text(font: "Noto Sans")

// Spielerkarten

#let json_player = json("spieler.json")

#for player in json_player {
  box(width: 74mm, height: 105mm, radius: 4mm, stroke: 0.5pt + black, inset: 5mm)[
    #box(width: 64mm, height: 95mm, stroke: 2pt + black, inset: 1pt, clip: true)[
      //#if (player.image != "") { place(bottom + right, dx: 0pt, dy: 3em, image("/img/" + player.image, width: 64mm, height: 95mm, fit: "cover")) }
      #box(
        text(size: 20pt)[#set align(horizon)
          #h(7.5mm + 3mm + 9pt) #text(weight: "bold", fill: rgb(player.textcolor), if player.name
            == "" [#player.original] else [#player.name])
          // #place(right, dy: -8pt, dx: -2pt, circle(
          //   fill: white,
          //   stroke: 2pt + black,
          //   radius: 20pt,
          //   inset: 0pt,
          //   [#set align(center + horizon)
          //     #text(
          //       size: 14pt,
          //       weight: "black",
          //       spacing: -1pt,
          //       [#player.value #emoji.volleyball],
          //     )],
          // ))
          #if (player.position1 != "") {
            place(left, dy: -30pt, dx: 39pt, text(size: 10pt, fill: rgb(player.textcolor), player.position1))
          }
          #if (player.image != "") {
            place(right, dy: 10pt, dx: -8pt, box(
              stroke: 2pt + black,
              width: 70pt,
              height: 70pt,
              radius: 50%,
              clip: true,
              image("/img/" + player.image, fit: "cover", width: 100%, height: 100%),
            ))
          }
        ],
        height: 60pt,
        width: 1fr,
        fill: rgb(player.color),
        stroke: (bottom: 2pt + black),
      )

      #v(45pt)

      #grid(
        columns: (10pt, 2fr, 1fr, 10pt),
        gutter: 10pt,
        rows: auto,
        align: (auto, left, center, auto),
        [], [*SPIELER IM BESITZ*], [*PUNKTE*], [],
        [], [], [], [],
        ..range(player.group.len())
          .map(i => (
            [],
            [#text(spacing: -3pt, size: 16pt, [#for _ in range(i + 1) [#emoji.basketball ]])],
            text(size: 16pt, weight: "bold", [#player.group.at(i).wert#emoji.volleyball]),
            [],
          ))
          .flatten(),
        //[], text(size: 9pt)[Komplette Gruppe], [], [],
      )
      // #if(player.image != "") [#image("/img/" + player.image, fit:  "stretch")]
    ]
    #place(top + left, dy: -3mm, dx: -3mm, circle(
      radius: 7.5mm,
      stroke: black + 2pt,
      fill: white,
      inset: -10pt,
      [
        #align(center + horizon, text(size: 20pt, weight: "bold", spacing: 0pt, [#player.value #emoji.volleyball]))],
    ))
  ]
  h(15pt)
}

// Punktekarten

#let points = (1, 1, 1, 1, 1, 1, 2, 2, 2, 2, 2, 3, 3, 3, 4, 4, 4, 5, 5)

#for points_i in points {
  box(width: 74mm, height: 105mm, radius: 4mm, stroke: 0.5pt + black, inset: 5mm)[
    #box(width: 64mm, height: 95mm, stroke: 2pt + black, inset: 1pt)[
      #place(center + horizon, dy: 0pt, dx: 0pt, circle(
        radius: 28mm,
        stroke: black + 2pt,
        inset: -10pt,
        align(center + horizon, text(size: 70pt, spacing: -3pt, weight: "bold", [#points_i #emoji.volleyball])),
      ))
    ]
    #place(left + top, dy: -3mm, dx: -3mm, circle(
      radius: 7.5mm,
      stroke: black + 2pt,
      fill: white,
      inset: -10pt,
      [
        #align(center + horizon, text(size: 20pt, weight: "bold", spacing: 0pt, [#points_i #emoji.volleyball]))],
    ))
  ]
  h(15pt)
}

#box(width: 74mm, height: 105mm, radius: 4mm, stroke: 0.5pt + black, inset: 5mm)[
  #box(width: 64mm, height: 95mm, stroke: 2pt + black, inset: 1pt)[
    #place(center + horizon, dy: 0pt, dx: 0pt, circle(
      radius: 28mm,
      stroke: black + 2pt,
      inset: -10pt,
      align(center + horizon, text(size: 56pt, spacing: -8pt, [10 #emoji.volleyball])),
    ))
  ]
  #place(left + top, dy: -3mm, dx: -3mm, circle(
    radius: 7.5mm,
    stroke: black + 2pt,
    fill: white,
    inset: -10pt,
    [
      #align(center + horizon, text(size: 16pt, weight: "black", spacing: 0pt, [10 #emoji.volleyball]))],
  ))
]

// Aktionkarten

#let json_action = json("action.json")

#for action in json_action {
  for n in range(action.n) {
    box(width: 74mm, height: 105mm, radius: 4mm, stroke: 0.5pt + black, inset: 5mm)[
      #box(width: 64mm, height: 95mm, stroke: 2pt + black, inset: (x: 10pt))[
        #align(center, text(size: 20pt, weight: "black")[#v(10pt)AKTION])
        #place(center + horizon, dy: -15pt, dx: 0pt, circle(
          radius: 28mm,
          stroke: black + 2pt,
          inset: -0pt,
          align(center + horizon, text(size: 12pt, weight: "bold", eval(action.text_circle, mode: "markup"))),
        ))

        #place(center + top, dy: 73mm, dx: 0pt, eval(action.text_explain, mode: "markup"))

      ]
      #place(left + top, dy: -3mm, dx: -3mm, circle(
        radius: 7.5mm,
        stroke: black + 2pt,
        fill: white,
        inset: -10pt,
        [
          #align(center + horizon, text(size: 20pt, weight: "bold", spacing: 0pt, [ #action.value #emoji.volleyball]))],
      ))
    ]
    h(15pt)
  }
}

// Super-Jokerkarten

#for i in range(2){
box(width: 74mm, height: 105mm, radius: 4mm, stroke: 0.5pt + black, inset: 5mm)[
  #box(width: 64mm, height: 95mm, stroke: 2pt + black, inset: 0pt, clip: true)[
    #box(
      text(weight: "black", stroke: black + 0.5pt, fill: white, size: 30pt)[
        #set align(horizon + center)
        Superjoker
      ],
      height: 60pt,
      width: 1fr,
      fill: gradient.linear(..color.map.rainbow),
      stroke: (bottom: 2pt + black),
    )
    #place(center + horizon, dy: 60pt)[
      #image("img/superjoker.jpg", width: 100%, height: 100%, fit: "cover")
    ]
    #place(center + horizon, dy: 105pt)[
      #align(center + bottom, text(weight: "black", fill: white, stroke: black + 0.3pt, size: 14pt)[#set par(
          leading: 0.3em,
        )
        Verwende diese Karte als Teil einer Belibiegen Farbgruppe
      ])
    ]
  ]
]

h(15pt)
}
