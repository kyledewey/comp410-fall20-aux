isPrime(Number) :-
    isPrimeHelper(2, Number).

% isPrimeHelper: Divisor, Number
% Divisor: the current value we try to divide the number by
% Number: the candidate prime number
isPrimeHelper(Divisor, Number) :-
    Divisor >= Number.
isPrimeHelper(Divisor, Number) :-
    Divisor < Number,
    Result is mod(Number, Divisor),
    Result \== 0,
    NewDivisor is Divisor + 1,
    isPrimeHelper(NewDivisor, Number).

% isPrime(9)
% 
