% this is a comment

% closed-world hypothesis: the database defines what truth is.
% all truth is in the database.

% all procedures collectively form a database

% grouping of facts: procedure
% three individual facts
% isInteger procedure
isInteger(0).
isInteger(1).
isInteger(2).


% two individual facts
% isName procedure
isName(alice).
isName(bob).

% query: questions we ask of the facts
% effectively program entry point

% types of data:
% -Numbers (0, 1, 2)
% -Atoms (alice, bob)
%   - Start with a lowercase letter
%   - Effectively strings
% -Structure (later)

lessThan(0, 1).
lessThan(1, 2).
lessThan(2, 3).

% starts with uppercase letter: variable
areEqual(X, X).

tripleEqual(A, A, A).

% Prolog: unification and nondeterminism (nondeterministic execution)

% how variables get values: unification
% "splitting the world": nondeterministic execution

isFoo(foo).

% rule
% head (everything before :-): isBetween(Min, Max, Value)
% body (everything after :-):     Value >= Min, Value =< Max.
% conjunction: ,
isBetween(Min, Max, Value) :-
    Value >= Min,
    Value =< Max.

%% isEven(2).
%% isEven(X) :-
%%     X = 4; X = 6.
%% isEven(X) :-
%%     X = 8.
%% isEven(10).

isEven(Y) :-
    0 is mod(Y, 2).
