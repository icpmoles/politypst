#import "template.typ": politesi,raggio,my-styling
#import "@preview/equate:0.2.0": equate
#import "@preview/lovelace:0.3.0": *

#import "@preview/lemmify:0.1.5": *


#let (
  theorem, lemma, corollary,
  remark, proposition, example,
  proof, rules: thm-rules
) = default-theorems(
  "thm-group", 
  lang: "en",
  thm-numbering: thm-numbering-heading.with(max-heading-level: 1),
  ..my-styling
)

#show: thm-rules

#show: doc => politesi(
  title: [
    Title
  ],
  name: "Name Surname",
  ID: "0000000",
  course: "Xxxxxxx Engineering - Ingegneria Xxxxxxx",
//  abstract_en: abstract_eng,
  keyword: [here, the keywords, of your thesis],
  parole_chiave: [qui, vanno, le parole chiave, della tesi],
  advisor: [NameA SurnameA],
  coadvisor: ( [Name1C Surname1C],[Name2C Surname2C]),
  academicyear: [20XX-XX],
  doc,
)

#heading(numbering: none)[Introduction]
//= Introduction
This document is intended to be both an example of the Polimi Typst template for Master Theses, as well as a short introduction to its use. It is not intended to be a general introduction to Typst itself, and the reader is assumed to be familiar with the basics of creating and compiling Typst documents (see @article @booklet ).
The cover page of the thesis must contain all the relevant information: title of the thesis, name of the Study Programme and School, name of the author, student ID number,
name of the supervisor, name(s) of the co-supervisor(s) (if any), academic year. The above information are provided by filling all the entries in the command \puttitle{} in the title page section of this template.
Be sure to select a title that is meaningful. It should contain important keywords to be identified by indexer. Keep the title as concise as possible and comprehensible even to people who are not experts in your field. The title has to be chosen at the end of your work so that it accurately captures the main subject of the manuscript.
Since a thesis might be a substantial document, it is convenient to break it into chapters. You can create a new chapter as done in this template by simply using the following command
#lorem(1000)
// #context counter(heading).update(0)

#pagebreak()

= Chapter one

In this chapter additional useful information are reported.

== Sections and subsections
Chapters are typically subdivided into sections and subsections, and, optionally, subsubsections, paragraphs and subparagraphs.
All can have a title, but only sections and subsections are numbered.
A new section is created by the command
A new subsection is created by the command

== Equations 

This section gives some examples of writing mathematical equations in your thesis.


Maxwell’s equations read: 


#equate(sub-numbering: true, $
  #place(right,dx:-3em, $lr(size: #8em, \{)$) 
  nabla dot D &= rho, \
  nabla times E + ( partial B) / ( partial t) &= 0, \
  nabla dot B &= 0, \
  nabla times H - ( partial D)/ ( partial t) &= J.
$)
== Figures, Tables and Algorithms 
Figures, Tables and Algorithms have to contain a Caption that describe their content, and have to be properly referred in the text.

=== Figures

#figure(
  image("Images/logo_polimi_scritta.svg"),
  caption: [Caption of the Figure to appear in the List of Figures.]
)

#figure(
  box(height: 200pt,
  inset: 9pt,
  columns(2, gutter: 11pt)[
   #figure(
      image("Images/logo_polimi_scritta.svg"),
      caption: [Pure Triphase power supply]
    ) 
   #figure(
     image("Images/logo_polimi_scritta2.svg"),
     caption: [Incremental load applied on the rotor shaft]
   )]
  ),
 caption: [ This is a very long caption you don’t want to appear in the List of Figures.]
)
=== Tables
//#align(center,text("Title of Table (optional)"))

#figure(
  table(
  columns: 4,
  table.cell(colspan: 4)[Title of Table (optional)],
  
  [], [column 1],[column 2],[column 3],
  [row 1],[1], [2], [3],
  [row 2],[$alpha$], [$beta$], [$gamma$],
  [row 3],[alpha], [beta], [gamma],
),
 caption: [Caption of the Table to appear in the List of Tables.],
)

#figure(
  table(
  columns: 4,
 // table.cell(colspan: 4)[Title of Table (optional)],
  [], [column 1],[column 2],[column 3],
  [row 1],[1], [2], [3],
  [row 2],[$alpha$], [$beta$], [$gamma$],
  [row 3],[alpha], [beta], [gamma],
),
 caption: [Highlighting the columns],
)

#figure(
  table(
  columns: 4,
//  table.cell(colspan: 4)[Title of Table (optional)],
  [], [column 1],[column 2],[column 3],
  [row 1],[1], [2], [3],
  [row 2],[$alpha$], [$beta$], [$gamma$],
  [row 3],[alpha], [beta], [gamma],
),
 caption: [Highlighting the rows],
)

=== Algorithms


#figure(
  kind: "algorithm",
  supplement: [Algorithm],
 // placement:  horizon,
 // caption: [Name of the Algorithm],
pseudocode-list(
  stroke: none,
  booktabs: true,
  booktabs-stroke: 1pt + black,
  numbered-title: [Name of the Algorithm]
)[
  +  Initial instructions
  + *for* _for − condition_ *do*
    + Some instructions
    + *if* _if − condition_ *then*
     + Some other instructions
    + *end if*
  + *end for*
  + *while* _while − condition_ *do*
    + Some further instructions
  + *end while*
  + Final instructions
]
)

== Theorems, propositions and lists

=== Theorems

Theorems have to be formatted as:

#theorem(
)[
  Write here your theorem.
]<thm>


#theorem(
 name: "Optional name"
)[
  Write here your theorem2.
]<thm2>

#proof[
  If useful you can report here the proof.
]<proof>


=== Propositions

Propositions have to be formatted as:


#proposition(
  //  name: "Optional name"
)[
   Write here your proposition.
]<thm>
=== Lists
How to insert itemized lists:

- first item;
- second item

How to insert numbered lists:

+ first item;
+ second item;
 

== Use of copyrighted material

Each student is responsible for obtaining copyright permissions, if necessary, to include
published material in the thesis. This applies typically to third-party material published
by someone else.
== Plagiarism

You have to be sure to respect the rules on Copyright and avoid an involuntary plagia-
rism. It is allowed to take other persons’ ideas only if the author and his original work
are clearly mentioned. As stated in the Code of Ethics and Conduct, Politecnico di Mi-
lano promotes the integrity of research, condemns manipulation and the infringement of intellectual property, and gives opportunity to all those who carry out research activities
to have an adequate training on ethical conduct and integrity while doing research. To be
sure to respect the copyright rules, read the guides on Copyright legislation and citation
styles available at:
```
https://www.biblio.polimi.it/en/tools/courses-and-tutorials
```
You can also attend the courses which are periodically organized on "Bibliographic cita-
tions and bibliography management"


== Bibliography and citations

Your thesis must contain a suitable Bibliography which lists all the sources consulted on
developing the work. The list of references is placed at the end of the manuscript after the
chapter containing the conclusions. We suggest to use the BibTeX package and save the
bibliographic references in the file Thesis_bibliography.bib. This is indeed a database
containing all the information about the references. To cite in your manuscript, use the
 command as follows: 

Here is how you cite bibliography entries: @knuth92, or multiple ones at once: @lamport94 @book.
The bibliography and list of references are generated automatically by running BibTeX
@knuth74.


#pagebreak(to:"odd")

= Conclusions and future developments
A final chapter containing the main conclusions of your research/study and possible future
developments of your work have to be inserted in this chapter.


#context counter(heading).update(0)

//#bibliography("Thesis_bibliography.bib")







