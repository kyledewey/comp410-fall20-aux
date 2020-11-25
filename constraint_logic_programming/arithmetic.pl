% n is a Natural Number (integers >= 0)
% Peano axioms
%
% n ::= zero | successor(n)
%
% 0: zero
% 1: successor(zero)
% 2: successor(successor(zero))

%% add(M, zero,M).
%% add(zero, N, N).
%% add(succ(M), succ(N), R) :-
%%     add(M, N, R1),
%%     R = succ(succ(R1)).

% 0 + n = n
add(zero, N, N).
% succ(n) + m = succ(n + m)
% (n + 1) + m = 1 + (n + m)
add(succ(N), M, succ(Result)) :-
    add(N, M, Result).

lt(zero, succ(_)).
lt(succ(X), succ(Y)):-
    lt(X,Y).

lte(zero, _).
lte(succ(X), succ(Y)):-
    lte(X,Y).

% 0 * N = 0
% N * 0 = 0
% N * 1 = N
% 1 * N = N
% M * N (for M, N > 1) = N + ((M - 1) * N)
multiply(zero, _, zero) :- !.
multiply(_, zero, zero) :- !.
multiply(succ(zero), N, N) :- !.
multiply(N, succ(zero), N) :- !.
multiply(succ(N), M, Result) :-
    multiply(N, M, Rest),
    add(M, Rest, Result).

%% multiply(zero, N, zero).
%% multiply(N, zero, zero).
%% multiply(N, succ(zero), N).
%% multiply(succ(zero), N, N).

