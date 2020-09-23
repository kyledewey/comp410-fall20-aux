factorial(0, 1).
factorial(Input, Output) :-
    Input >= 1,
    InputMinusOne is Input - 1,
    factorial(InputMinusOne, MinusOneOutput),
    Output is Input * MinusOneOutput.

%% factorial(N, Value):-
%% 	N>0,
%% 	NextValue is Value * N,
%% 	NextN is N -1,
%% 	factorial(NextN, NextValue).
