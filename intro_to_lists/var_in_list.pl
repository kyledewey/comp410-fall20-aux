% checking if a variable is in a list
% [1, 2, X, 7, Y]
%
% listContainsVariable: List, Variable
% succeeds if the list contains Variable, else fails
listContainsVariable([A|_], Probe) :-
    var(A),
    var(Probe),
    A == Probe.
listContainsVariable([_|Tail], A) :-
    listContainsVariable(Tail, A).

isList(Empty) :-
    nonvar(Empty),
    Empty = [].
isList(NonEmpty) :-
    nonvar(NonEmpty),
    NonEmpty = [_|_].
