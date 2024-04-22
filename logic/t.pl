/* Facts */

book(illiad,homer,study,500).
book(c,richie,study, 150).
book(ntbible,sams,reference,480).
book(ntfordummies,bob, reference,200).
book(montypython,cleese,comedy,300).
book(pythonalgorithms,david,study, 225).
book(lilacbus,binchey,fiction,200).
book(hamlet,shakespere,drama,450).


/* Rules */

/* The findall predicate has 3 arguments, generating template, a matching predicate and a list of generated predicates.
   Whenever the matching predicate is true, it adds a predicate into the list using the generating template.
   In the following line it will generate a list of all the books in a list called Lib.
*/

build_library(Lib) :- findall(book(Title, Author, Genre, Size), book(Title, Author, Genre, Size), Lib).


/* To find the leisure books in the library first build the library from the
   facts below and then query the library e.g.

   build_library(Lib),leisure(B,Lib).
*/


holiday_book(book(_,_,Genre,Size)) :- Size < 400, Genre \== drama, Genre \== reference.

holiday(_,[]).

holiday(B,[B|Lib]) :- holiday_book(B), holiday(B,Lib).

holiday(B,[_|XS]) :- holiday(B,XS).


literary_book(book(_,_,Genre,_)) :- Genre == drama.

literary(_,[]).

literary(B,[B|Lib]) :- literary_book(B), literary(B,Lib).

literary(B,[_|XS]) :- literary(B,XS).


revision_book(book(_,_,Genre,Size)) :- Genre == study, Size > 300.

revision_book(book(_,_,Genre,Size)) :- Genre == reference, Size > 300.

revision(_,[]).

revision(B,[B|Lib]) :- revision_book(B), revision(B,Lib).

revision(B,[_|XS]) :- revision(B,XS).


/* just another way of testing the genre */

leisure_book(book(_,_,comedy,_)).

leisure_book(book(_,_,fiction,_)).

leisure(_,[]).

leisure(B,[B|Lib]) :- leisure_book(B), leisure(B,Lib).

leisure(B,[_|XS]) :- leisure(B,XS).

