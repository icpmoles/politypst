//from here https://www.sascha-frank.com/latex-font-size.html , type "book"
#let tiny =  12pt
#let scriptsize = 6pt
#let footnotesize = 8pt
#let ssmall = 7pt //https://mirrors.mit.edu/CTAN/macros/latex/contrib/moresize/moresize.pdf 11pt
#let small = 11pt
#let normalsize = 12pt
#let large = 14pt
#let Large = 17pt
#let LARGE = 20pt
#let huge = 25pt
#let Huge = 25pt
#let HUGE = 29.86pt //https://mirrors.mit.edu/CTAN/macros/latex/contrib/moresize/moresize.pdf 11pt
#let bluepoli =  cmyk(40%,10%,0%,40%)

// import individual section
#import "aside/abstract_eng.typ": abstract_eng
#import "aside/abstract_ita.typ": abstract_ita
#import "aside/acknowledgements.typ": acknowledgements
#import "aside/appendix_A.typ": app_A
#import "aside/appendix_B.typ": app_B
#import "aside/symbols.typ": symbols
// libraries
#import "@preview/hydra:0.5.0": hydra

#let my-thm-style(
  thm-type, name, number, body
) = [  #text(fill: bluepoli, [#thm-type #number.]) #emph(name)  #emph(body)]
#let my-proof-style(
  thm-type, name, number, body
) = [  #emph( [#thm-type #number.]) #emph(name)  #body]

#let my-styling = (
  thm-styling: my-thm-style,
  proof-styling: my-proof-style
)


// variables etc
#let raggio_ur = move( dx: 200pt, dy: -330pt,figure(
  placement: top,
  image("Images/raggiera_polimi.svg",width: 70%,fit: "contain") 
))// raggio upper right , only first page
#let raggio = move( dx: -150pt, dy: 220pt,figure(
  placement: top,
  image("Images/raggiera_polimi.svg",width: 85%,fit: "contain") 
))
#let logopoli = move( dx: -1.2cm,image(width: 70%,"Images/02_ING_IND_INFORMAZIONE_COL_POSITIVO.svg"))
#let separator = text(fill: bluepoli,"|")

#let emptypage = raggio

#let politesi(
  title: none,
  name: none,
  ID:none,
  keyword:[],
  parole_chiave:[],
  course: none,
  advisor: none,
  coadvisor: [],
  academicyear: none,
  doc
) = {

set math.equation(numbering: "(1.1)")
//show math.equation: set block(spacing: 0.65em)

set page(
  numbering: "1",
  number-align: right + top,
  header-ascent: 0.6cm,
  header: context {
  let pg = counter(page).at(here()).at(0)
  
  if calc.even(here().page()) [ #pg #h(1fr) #context hydra(1) ]
  else [ #context hydra(1) #h(1fr) #pg ]
}
) 

/*
show heading: it => [
//  #set align(center)
  #set text(fill:bluepoli)
  #counter(heading).display("1.1.1.") #h(2mm)
  #it.body
  #v(1cm)   
]*/

show heading: it => [
  #set text(fill:bluepoli, size:1em)
  #let hasnumber = it.numbering
  #let cont = it.body
  //#v(1cm)
  #if cont == [] [
  ] else if it.level == 1 [ //chapter   
    #v(3cm)  
    #set text(size:50pt)
    #h(2mm)
    #if hasnumber != none [#counter(heading).display("1 |   ") ] else []
    #set text(size:20pt)
    #strong(it.body)
  ] else if it.level == 2 [ // section // \titlespacing{\section}{0pt}{3.3ex}{2ex}  
    #v(1.2em) // to do tune this from ex to em
    #set text(Large)
    #counter(heading).display("1.1.1.") #h(2mm)
    #it.body
    #v(0.7em) 
  ]  else if it.level == 3 [ // sub section 
    #v(1.2em) 
    #set text(large)
    #counter(heading).display("1.1.1.") #h(2mm)
    #it.body
    #v(0.4em)  
  ] else if it.level == 4 [ // sub subs ection
    #v(1.2em) 
    #set text(large)
    #counter(heading).display("1.1.1.") #h(2mm)
    #it.body
    #v(0.6em)  
  ]
  
]



set text(
  font: "New Computer Modern Book",
  size: 12pt,
  kerning: false,
  spacing: 150%,
)
set align(left)

/* 1111111111111111111111111111111111111111111111111111111111111111
FIRST page: 
logo
title
school
author
id advisor year coadvisor
*/
page(
  header: "",
  background: raggio_ur, 
  margin: (inside: 3cm, outside: 2cm,  top: 2.5cm, bottom: 2.5cm),
)[
    
  #logopoli
  #v(2.5cm)
  // TITLE and description
  #text(Huge,  weight: "extrabold", fill: bluepoli, par(title))
  
  #v(1.5cm)
  #text(large,  weight: "extrabold", fill: bluepoli, 
  smallcaps(par([Tesi di Laurea Magistrale in ] + par(course) )))
  #v(1.5cm)
  // STUDENT 
  
  #text(Large, par([Author: ] + text(weight: "bold",name) ) )
  
  // BOTTOM
  #v(1fr)
  #text( par([Student ID: ] + text(ID) ) )
  #text( par([Advisor: ] + text(advisor) ) )
  #text( par([Co-Advisors: ] + text(coadvisor.join(", ")) ) )
  #text( par([Academic Year: ] + text(academicyear) ) )

]


/* 2222222222222222222222222222222222222222222222222222222222222222
SECOND page: 
empty, just the ray logo
*/

page(header: "",
background: raggio )[#counter(page).update(0)]

/* 333333333333333333333333333333333333333333333333333333333333333
THIRD page: 
abstract EN
keywords
*/  

counter(page).update(0)

page(
  header: none,
  numbering: "i",
)[
  #par(justify: false)[
  #abstract_eng
]
]

counter(page).update(0)




/* 4444444444444444444444444444444444444444444444444444444444444444
4TH page: 
empty, just the ray logo
*/  
page(header: "",
background: raggio )[]

/* 5555555555555555555555555555555555555555555555555555555555555555
5th page: 
abstract IT
keywords
*/  
page(
  header: none,
  numbering: "i",
)[
  #par(justify: false)[
  #abstract_ita
]
]

/* 6666666666666666666666666666666666666666666666666666666666666666
6thth page : 
empty, just the ray logo
*/ 
page(header: "",
background: raggio )[]


/* 7878787878787878787878787878787878787878787878787878787878787878
7th 8th page
Table Of Contnt
*/
/*
show outline.entry.where(level: 1): it => {
  v(14pt, weak: true)
  strong(it)
}*/

show outline.entry: it => {
  let bigspace = 1.5em
  let space = 0mm
  let level = it.level
  let try = it.element
  let number = it.element.numbering
  let entry = it.element.body
  let numb = it.element.numbering
  set text(fill:black,spacing: 200%,top-edge: "ascender",size: 14pt)
  if it.level == 1 [
    #if entry == [Introduction] or entry == [Bibliography] [#v(2em)] else  [#v(1em)]
    #strong(it.body) #h(1fr) #strong(it.page)
  ] else if it.level == 2 [
     #h(bigspace) #it.body #box(width: 1fr, repeat[#sym.space;.]) #it.page 
  ]  else if it.level == 3 [
      #h(2.4*bigspace)  #it.body #box(width: 1fr,  repeat[#sym.space;.]) #it.page 
  ] //up to level 3  
}


page(header: "",
  footer: "",
  numbering: "i",)[ 

#par(justify: false)[
  #heading(numbering: none,supplement: [Aside])[Contents]
  #outline(
    title: none,
   // fill:repeat(" ."),
    depth: 3,
   // indent: 2em,
  )

]
]
counter(page).update(1)
pagebreak(to: "odd")

set heading(numbering: "1.1.1.")

/*
set page(
  numbering: "1",
  number-align: top,
  header: none
)
*/
counter(page).update(0)
/* ==================================================================
Start of thesys
*/



doc

pagebreak(to: "odd")

bibliography("Thesis_bibliography.bib")


/* ==================================================================
Appendix A
*/

page(header: "",
background: raggio )[]

page(
  header: none,
 
)[
  #par(justify: false)[
  #app_A
]
 
 
]

/* ==================================================================
Appendix B
*/

page(header: "",
background: raggio )[]

page(
  header: none,
 
)[
  #par(justify: false)[
  
  #app_B
]
 
 
]

/* ==================================================================
Figures
*/

page(header: "",
background: raggio )[]

page(
  header: none,
 
)[
  #par(justify: false)[
  #heading(numbering: none)[List of Figures]
  #outline(
    title: [],
    target: figure.where(kind: image),
    fill:repeat(" .")
  )
]
] 


/* ==================================================================
Tables
*/

page(header: "",
background: raggio )[]

page(
  header: none,
 
)[
  #par(justify: false)[
  #heading(numbering: none)[List of Tables]
  #outline(
    title: [],
    target: figure.where(kind: table),
    fill:repeat(" .")
  )
]
] 


/* ==================================================================
Symbols
*/

page(header: "",
background: raggio )[]

page(
  header: none,
)[
  #par(justify: false)[
  #symbols
]
] 
 
/* ==================================================================
Acknowledgements
*/

page(header: "",
background: raggio )[]

page(
  header: none,
 
)[
  #par(justify: false)[
  #acknowledgements
]
 
 
]
page(header: "",
background: raggio )[]

////////////////////// Final Pages
/*
= List of Figures

= List of Tables

= List of Symbols

= Acknowledgements
*/

/*
par(justify: false)[

  #outline(
    title: [List of Figures],
    target: figure.where(kind: image),
    fill:repeat(" .")
  )

]

pagebreak(to: "odd")

par(justify: false)[
  *List of Symbols* \
  #terms 

]

pagebreak(to: "odd")

par(justify: false)[ 
  #outline(
    title: [List of Tables],
    target: figure.where(kind: table),
    fill:repeat(" .")
  )

]

*/


}