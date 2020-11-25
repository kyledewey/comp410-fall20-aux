decBound(In, Out) :-
    In > 0,
    Out is In - 1.

gen(_, leaf(0)).
gen(Bound, internalNode(Left, 0, Right)) :-
    decBound(Bound, NewBound),
    gen(NewBound, Left),
    gen(NewBound, Right).
