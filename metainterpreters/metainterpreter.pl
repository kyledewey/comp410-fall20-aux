% interpreter: program that executes another program
% metainterpreter: program that executes itself (kinda)
%   Prolog interpreter in Prolog

% t is Term
% c is a Clause ::= true |
%                   is(t1, t2) |
%                   =(t1, t2) |
%                   ,(c1, c2) |
%                   ;(c1, c2) |
%                   \+(c) |
%                   t // intended as a call

myLength([], 0).
myLength([_|T], Result) :-
    myLength(T, Rest),
    Result is Rest + 1.

interpret(true) :- !.
interpret(is(T1, T2)) :-
    !,
    T1 is T2.
interpret(=(T1, T2)) :-
    !,
    T1 = T2.
interpret(','(C1, C2)) :-
    !,
    interpret(C1),
    interpret(C2).
interpret(;(C1, C2)) :-
    !,
    (interpret(C1); interpret(C2)).
interpret(\+(C)) :-
    !,
    \+ interpret(C).
interpret(Call) :-
    clause(Call, Body),
    interpret(Body).

%% interpret(Call) :-
%%     ???.
    
%% interpret(,(C1, C2)) :-
%%     !,
%%     interpret(C1),
%%     interpret(C2).
%
% How it gets parsed:
%
% :-(interpret(,(C1, C2)),
%    ,(!,
%      ,(interpret(C1),
%        interpret(C2))))

myAppend([], List, List).
myAppend([H|T], List, [H|Rest]) :-
    myAppend(T, List, Rest).

interp0(true) :- !.
interp0(','(A, B)) :-
    !,
    interp0(A),
    interp0(B).
interp0(Call) :-
    clause(Call, Body),
    interp0(Body).

interp1(true) :- !.
interp1(','(A, B)) :-
    !,
    interp1(A),
    interp1(B).
interp1(Call) :-
    writeln(Call),
    clause(Call, Body),
    interp1(Body).

interp2(true) :- !.
interp2(','(A, B)) :-
    !,
    interp2(A),
    interp2(B).
interp2(Call) :-
    format('Call: ~w~n', [Call]),
    clause(Call, Body),
    interp2(Body),
    format('Return: ~w~n', [Call]).

