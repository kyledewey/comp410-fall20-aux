% expression ::= number(INT) |
%                plus(expression, expression) |
%                minus(expression, expression) |
%                multiply(expression, expression) |
%                negate(expression)
%
% eval_expr: ArithmeticExpression, Integer
eval_expr(number(Integer), Integer).
eval_expr(plus(E1, E2), Result) :-
    eval_expr(E1, E1Result),
    eval_expr(E2, E2Result),
    Result is E1Result + E2Result.
eval_expr(minus(E1, E2), Result) :-
    eval_expr(E1, E1Result),
    eval_expr(E2, E2Result),
    Result is E1Result - E2Result.
eval_expr(multiply(E1, E2), Result) :-
    eval_expr(E1, E1Result),
    eval_expr(E2, E2Result),
    Result is E1Result * E2Result.
eval_expr(negate(E), Result) :-
    eval_expr(E, EResult),
    Result is -EResult.
