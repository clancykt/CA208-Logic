# binary tree insert and display 

# tree predicates
check_tree(nil).
check_tree(tree(_, LeftN, RightN)) :- check_tree(leftN), check_tree(RightN).
empty = nil.
bt(tree(_, nil, nil)).
bt(tree(N, LeftN, nil)) :- LeftN <= N.
bt(tree(N, nil, RightN)) :- N < RightN.
bt(tree(_, LeftN, RightN)) :- bt(LeftN), bt(rightN).
bt(tree(N, LeftN, RightN)) :- LeftN <= N, N < RightN.

# insert predicates
insert(I, empty, bt(I, empty, empty)).
insert(I, bt(I, T1, T2), bt(I, T1, T2)) :- !.
insert(I, bt(N, T1, T2), bt(N, LeftN, T2)) :- I < N, !, insert(I, T1, LeftN).
insert(I, bt(N, T1, T2), bt(N, L, RightN)) :- insert(I, T2, RightN).

# checking height for balance
high(A, B, A) :- A > B, !.
high(_, B, B).
height(empty, 0).
height(bt(N, empty, empty), 1).
height(bt(_, T1, T2),Ht):- height(T1, HT1), height(T2, HT2), high(HT1, HT2, HT3), Ht is HT3 + 1.

# if unbalanced
# rotate N places to Left
rotate(T1, N, T2) :- N >= 0, length(T1, NT1), N1 is N mod NT1, rotate_to_left(T1, N, T2).
rotate(T1, N, T2) :- N < 0, length(T1, NT1), N1 is NT1 + (N mod NT1), rotate_to_left(T1, N1, T2).
rotate_to_left(T, 0, T).
rotate_to_left(T1, N, T2) :- N > 0, spl(T1, N, S1, S2), append(S2, S1, T2).

# rotate N places to Right
rotate(T1, N, T2) :- N >= 0, length(T2, NT2), N2 is N mod NT2, rotate_to_right(N, T1, T2).
rotate(T1, N, T2) :- N < 0, length(T2, NT2), N2 is NT2 + (N mod NT2), rotate_to_right(N1, T1, T2).
rotate_to_right(T, 0, T).
rotate_to_right(N, T1, T2) :- N > 0, spl(T2, N, S2, S1), append(S1, S2, T1).

# print the tree
display(tree) :- displays(tree, 0).
displays(nil / 0, _).
displays(bt(LeftN, I, RightN) /_, Indent) :- Indnt is Indent + 2, displays(RightN, Indnt), tab(Indent), write(I), nl, displays(LeftN, Indnt).
