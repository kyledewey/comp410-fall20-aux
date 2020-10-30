% kind of like if/else
% wanted: mutual exclusion

% Way one: explicit checks that something isn't the input data we want
% starts growing bigger as we get more clauses
foo1(1, 2).
foo1(2, 5).
foo1(X, 3) :-
    X \= 1,
    X \= 2.

% Way two: uses implication for mutual exclusion; gets ugly
foo2(Input, Output) :-
    (Input = 1) ->
        Output = 2;
        ((Input = 2) ->
             Output = 5;
             Output = 3).

% Way three: use cut (!)
foo3(1, 2) :- !.
foo3(2, 5) :- !.
foo3(_, 3).

fooFirstInstantiated(...).
fooNoneInstantiated(...).

foo(X, Y) :-
    (var(X), nonvar(Y)) ->
        fooFirstInstantiated(X, Y);
        fooNoneInstantiated(X, Y).

