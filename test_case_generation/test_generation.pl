% System under test: calculator
%
% expression ::= integer | expression `+` expression | `-` expression
%
% expression ::= integer(INT) | plus(expression, expression) | negate(expression)
%
%                integer(5)   | plus(integer(2), integer(3)) | negate(integer(4))
%
% statement ::= `if` `(`expression`)` `{` statement `}` `else` `{` statement `}` |
%               `while` `(` expression `)` `{` statement `}`

% 0 + (0 + 0)
% 0 + (0 + (0 + 0))
expression(integer(0)).
expression(integer(1)).
expression(plus(E1, E2)) :-
    expression(E1),
    expression(E2).
expression(negate(E)) :-
    expression(E).

decBound(Bound, NewBound) :-
    Bound > 0,
    NewBound is Bound - 1.

% For something recursive, Bound > 0
% When we make recursive calls, decrement Bound
% expressionBounded: Bound, Expression
expressionBounded(_, integer(0)).
expressionBounded(_, integer(1)).
expressionBounded(Bound, plus(E1, E2)) :-
    decBound(Bound, NewBound),
    expressionBounded(NewBound, E1),
    expressionBounded(NewBound, E2).
expressionBounded(Bound, negate(E)) :-
    decBound(Bound, NewBound),
    expressionBounded(NewBound, E).

exp(_, true).
exp(_, false).
exp(Bound, if(E1, E2, E3)) :-
    decBound(Bound, NewBound),
    exp(NewBound, E1),
    exp(NewBound, E2),
    exp(NewBound, E3).
