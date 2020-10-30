% [ 1, 2, 3, 4, 5, 6, 7, 8, 9 ]
% [ 4  *  *
% [ *  *  *
% [ *
% [ *
% [ *
% [ *
% [ *
% [ *

solveSudoku(Grid) :-
    rowsOk(Grid),
    columnsOk(Grid),
    squaresOk(Grid).
