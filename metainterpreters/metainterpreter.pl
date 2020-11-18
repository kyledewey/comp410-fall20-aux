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


% Doesn't display anything
interp0(true) :- !.
interp0(','(A, B)) :-
    !,
    interp0(A),
    interp0(B).
interp0(Call) :-
    clause(Call, Body),
    interp0(Body).

% Displays calls
interp1(true) :- !.
interp1(','(A, B)) :-
    !,
    interp1(A),
    interp1(B).
interp1(Call) :-
    writeln(Call),
    clause(Call, Body),
    interp1(Body).



















myAppend([], List,  List) :- true.
myAppend([H|T], List, [H|Rest]) :-
    myAppend(T, List, Rest).

% Displays calls and returns
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


%% HAVE:
%% Call (0): myAppend([1,2],[3,4,5],_26300)
%% Call (0): myAppend([2],[3,4,5],_26586)
%% Call (0): myAppend([],[3,4,5],_26632)
%% Exit (0): myAppend([],[3,4,5],[3,4,5])
%% Exit (0): myAppend([2],[3,4,5],[2,3,4,5])
%% Exit (0): myAppend([1,2],[3,4,5],[1,2,3,4,5])
%% Result = [1, 2, 3, 4, 5].

%% WANT:
%% Call (0): myAppend([1,2],[3,4,5],_26300)
%% Call (1): myAppend([2],[3,4,5],_26586)
%% Call (2): myAppend([],[3,4,5],_26632)
%% Exit (2): myAppend([],[3,4,5],[3,4,5])
%% Exit (1): myAppend([2],[3,4,5],[2,3,4,5])
%% Exit (0): myAppend([1,2],[3,4,5],[1,2,3,4,5])
%% Result = [1, 2, 3, 4, 5].

interp3(Call) :-
    interp3(Call, 0).

% interp3: Call, Depth
interp3(true, _) :- !.
interp3(','(A, B), Depth) :-
    !,
    interp3(A, Depth),
    interp3(B, Depth).
interp3(Call, Depth) :-
    format('Call (~w): ~w~n', [Depth, Call]),
    clause(Call, Body),
    NewDepth is Depth + 1,
    interp3(Body, NewDepth),
    format('Exit (~w): ~w~n', [Depth, Call]).
