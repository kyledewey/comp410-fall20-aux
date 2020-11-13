% INTEGER can be 0, 1, or 2
% t is a tree ::= leaf(INTEGER) | node(t1, t2)

genInteger(0).
genInteger(1).
genInteger(2).

% genTree: Tree, Bound
genTree(leaf(Integer), _) :-
    genInteger(Integer).
genTree(node(Tree1, Tree2), Bound) :-
    Bound > 0,
    NewBound is Bound - 1,
    genTree(Tree1, NewBound),
    genTree(Tree2, NewBound).
