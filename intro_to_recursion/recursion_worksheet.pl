% arity: the number of arguments a procedure takes
% factorial procedure
% factorial/2 procedure
% fact or rule: clause
factorial(0, 1).            % fact
factorial(Input, Output) :- % rule
    % starting point: factorial(Input, Output)
    % starting point == "head"
    Input >= 1,
    InputMinusOne is Input - 1,
    factorial(InputMinusOne, MinusOneOutput),
    Output is Input * MinusOneOutput.

% factorial/1 procedure
factorial(3).

foo(1).
foo(2).
foo(X) :-
    (X = 3; X = 4).

% myBetween(2, 4, X)
% [2, 3, 4]
% X = 2
% 


% myBetween(3, 3, X)
% X = 4
% myBetween: Low, High, ValueInRange

%% myBetween(Low, High, ValueInRange) :-
%%     Low =< High,
%%     ValueInRange = Low.

myBetween(Low, High, Low) :-
    Low =< High.
myBetween(Low, High, ValueInRange) :-
    Low < High,
    NewLow is Low + 1,
    myBetween(NewLow, High, ValueInRange).
