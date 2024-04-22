sits_right_of(katie, natalie).
sits_right_of(natalie, ron),
sits_right_of(ron, hermoine).
sits_right_of(hermoine, harry).
sits_right_of(harry, colin).
sits_right_of(colin, seamus).
sits_right_of(seamus, angelina).
sits_right_of(angelina, ginny).
sits_right_of(ginny, dean).
sits_right_of(dean, dennis).
sits_right_of(dennis, lee).
sits_right_of(lee, george).
sits_right_of(george, fred).
sits_right_of(fred, alicia).
sits_right_of(alicia, neville).
sits_right_of(neville, lavender).
sits_right_of(lavender, parvati).
sits_right_of(parvati, katie).

sits_left_of(X, Y) :-
sits_right_of()