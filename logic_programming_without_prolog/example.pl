foo(1).
foo(2).
foo(3).

decBound(In, Out) :-
    In > 0,
    Out is In - 1.

gen(_, leaf(0)).
gen(Bound, internalNode(Left, 0, Right)) :-
    decBound(Bound, NewBound),
    gen(NewBound, Left),
    gen(NewBound, Right).

oneThroughThree(1).
oneThroughThree(2).
oneThroughThree(3).

genPair(pair(X, Y)) :-
    oneThroughThree(X),
    oneThroughThree(Y).
