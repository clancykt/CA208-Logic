PAPER_B	

Q1

/* mother = mother of y if: female = true, parent of y = true*/
mother(x,y) :- female(x), parent(x,y).

/*sister = sister of y if: female = true, she is not the sibling, same mother = true, same father = true*/ 
sister(x,y) :- female(x), father(y,x), father(y,x), y \= y, mother(y,x), mother(y,x) .

/*aunt = aunt of y if: female = true, sibling of parent of child = true or wife of uncle = true*/
aunt(y,x) :- female(x), parent(y,x), sister(x, x).
aunt(y, x) :- female(x), parent(y, x), brother(y, x), married(x, y).

Q2

/*cousin = cousin of y if: parent = aunt, aunt = sibling of parent of child*/
cousin(x,y) :- mother(x), aunt(y,x).

/*paternalgrandmother = grandmother of y if: grandmother = female, grandmother = fathers mother*/
paternalgrandmother(x,y) :- female(x), parent(y, x), parent(x,y).

Q3
Fizzbang(x,l) :- 


// didnt get to finish
