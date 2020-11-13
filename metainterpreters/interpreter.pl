% e is an Expression ::= integer(INT) |
%                        boolean(true | false) |
%                        lessThan(e1, e2) |
%                        and(e1, e2) |
%                        if(e1, e2, e3) |
%                        print(e)

% doLessThan: LeftSide(Int), RightSide(Int), Result(Bool)
doLessThan(E1, E2, true) :-
    E1 < E2.
doLessThan(E1, E2, false) :-
    E1 >= E2.

% doAnd: LeftSide(Bool), RightSide(Bool), Result(Bool)
doAnd(true, true, true).
doAnd(false, _, false).
doAnd(_, false, false).

% ifHelper: Condition(Bool), IfTrue(AST), IfFalse(AST), Result(Bool/Int)
ifHelper(true, IfTrue, _, Result) :-
    interpret(IfTrue, Result).
ifHelper(false, _, IfFalse, Result) :-
    interpret(IfFalse, Result).

% interpret: Expression, Result
interpret(integer(Int), integer(Int)).
interpret(boolean(Bool), boolean(Bool)).
interpret(lessThan(E1, E2), boolean(Result)) :-
    %% interpret(E1, FromE1),
    %% interpret(E2, FromE2),
    %% FromE1 = integer(E1Int),
    %% FromE2 = integer(E2Int),
    interpret(E1, integer(E1Result)),
    interpret(E2, integer(E2Result)),
    doLessThan(E1Result, E2Result, Result).
interpret(and(E1, E2), boolean(Result)) :-
    interpret(E1, boolean(E1Result)),
    interpret(E2, boolean(E2Result)),
    doAnd(E1Result, E2Result, Result).
interpret(if(E1, E2, E3), Result) :-
    interpret(E1, boolean(E1Result)),
    ifHelper(E1Result, E2, E3, Result).
interpret(print(E), Result) :-
    interpret(E, Result),
    writeln(Result).
