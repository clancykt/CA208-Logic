%first check to see if the knights move is valid; it follows the rule of 1 horizontal 2 vertical or 1 vertical 2 horizontal%
check_move(X1/Y1,X2/Y2) :- correct_move(X1),correct_move(X2),correct_move(Y1),correct_move(Y2),
                            (X2 is X1 - 1, Y2 is Y1 + 2; X2 is X1 - 1, Y2 is Y1 - 2;
                            	X2 is X1 + 1, Y2 is Y1 + 2; X2 is X1 + 1, Y2 is Y1 - 2;
		                        X2 is X1 - 2, Y2 is Y1 + 1; X2 is X1 - 2, Y2 is Y1 - 1;
		                        X2 is X1 + 2, Y2 is Y1 + 1; X2 is X1 + 2, Y2 is Y1 - 1).

%then make sure move keeps knight on the chessboard%
correct_move(Squares) :- between(1, 8, Squares).

%reads in list of squares and checks moves in check_move%
knightpath([X1/Y1|[X2/Y2|[]]]) :- check_move(X1/Y1,X2/Y2).
knightpath([X1/Y1|[X2/Y2|Bottom]]) :- check_move(X1/Y1,X2/Y2),
                                   knightpath([X2/Y2|Bottom]).

%checking the starting square correlates with list%
first_square(X/Y,[X/Y|_]).

%checking ending square correlates with list%
last_square(X/Y,[X/Y]).
last_square(X/Y,[_|Z]) :- last_square(X/Y,Z).

%checks all elements of knights journey, returns true is all valid, correlates with list 'Path'%
knightjourney(Start,End,L,Path) :- first_square(Start,Path),
                                   last_square(End,Path),
                                   length(Path,L), !,
                                   knightpath(Path).

%checking nth element correlates with list%
nth_check([Top|_],Top,1).
nth_check([_|Bottom],Sqr1, N1) :- N1 > 1, Num is N1 -1, nth_check(Bottom,Sqr1,Num).

%checking what squares the knight passes through by checking the list, valid if the nth_check must present the new square as the nth element of 'Path'%
knightpassthru(Path,Sqr,N) :- nth_check(Path,Sqr,N).
