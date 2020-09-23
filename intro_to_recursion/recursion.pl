% fibonacci sequence
% fib: InputNumber, OutputNumber
%      Position in Sequence, Number in Sequence
% F0 = 0
% F1 = 1
% FN = F(N - 1) + F(N - 2)
%
% fib(N - 1) + fib(N - 2)
%% NMinusOne = N - 1: NMinusOne is N - 1,
%% NMinusTwo = N - 2: NMinusTwo is N - 2,
%
fib(0, 0).
fib(1, 1).
fib(N, Output) :-
    N >= 2,
    NMinusOne is N - 1,
    NMinusTwo is N - 2,
    fib(NMinusOne, NMinusOneResult),
    fib(NMinusTwo, NMinusTwoResult),
    Output is NMinusOneResult + NMinusTwoResult.
