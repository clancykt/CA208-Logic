book(harrypotterandthehalfbloodprince,rowling,fiction,607).
book(thebeautifulanddamned,fitzgerald,drama,416).
book(athousandsplendidsuns,hosseini,drama,384).
book(thealchemist,coelho,reference,163).
book(harrypotterandthephilosophersstone,rowling,fiction,223).

build_library(Lib) :- findall(book(Title, Author, Genre, Size), book(Title, Author, Genre, Size), Lib).

holiday_book(book(_,_,Genre,Size)) :- Size < 400, Genre \== drama, Genre \== reference.
holiday(_,[]).
holiday(B,[B|Lib]) :- holiday_book(B), holiday(B,Lib).
holiday(B,[_|XS]) :- holiday(B,XS).

revision_book(book(_,_,Genre,Size)) :- Genre == study, Size > 300.
revision_book(book(_,_,Genre,Size)) :- Genre == reference, Size > 300.
revision(_,[]).
revision(B,B|Lib) :- revision_book(B), revision(B,Lib).
revision(B,[_|XS]) :- revision(B,XS).

literary_book(book(_,_,Genre,Size)) :- Genre == drama.
literary(_,[]).
literary(B,B|Lib) :- literary_book(B), literary(B,Lib).
literary(B,[_|XS]) :- literary(B,XS).

leisure_book(book(_,_,comedy,_)).
leisure_book(book(_,_,fiction,_)).
leisure(_,[]).
leisure(B,B|Lib) :- lesiure_book(B), leisure(B,Lib).
leisure(B,[_|XS]) :- lesiure(B,XS).
