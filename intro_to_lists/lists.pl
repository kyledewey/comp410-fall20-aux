% myLength: List, LengthOfList
%
% def myLength(list):
%   if isinstance(list, Nil):
%     return 0
%   elif isinstance(list, Cons):
%     return myLength(list.tail) + 1
%
myLength([], 0).
myLength([_|Remaining], Length) :-
    myLength(Remaining, RemainingLength),
    Length is RemainingLength + 1.

%
% [1, 2] ++ [3, 4] == Cons(1, ([2] ++ [3, 4]))
%
% def myAppend(list1, list2):
%   if isinstance(list1, Nil):
%     return list2
%   elif isinstance(list1, Cons):
%     rest_result = myAppend(list1.tail, list2)
%     return Cons(list1.head, rest_result)

%% myAppend([], Second, Result) :-
%%     Second = Result.
myAppend([], Second, Second).
myAppend([Head|Tail], Second, [Head|RestResult]) :-
    myAppend(Tail, Second, RestResult).

%% myAppend([Head|Tail], Second, Result) :-
%%     myAppend(Tail, Second, RestResult),
%%     Result = [Head|RestResult].


% sumAll([1, 2, 3, 4, 5], X).
% 1 + (2 + (3 + (4 + (5 + 0))))
sumAll([],0).
sumAll([Head|Tail],X) :-
    sumAll(Tail,RestResult),
    X is Head + RestResult.

% sumAllOther([1, 2, 3, 4, 5], X).
% ((((0 + 1) + 2) + 3) + 4) + 5
%
% result = 0
% for each element in list:
%   result += element
%   # new_result = result + element
% return result
%

% result = accumulator = accum
% sumAllAccum: ListOfElement, Accum, Result
sumAllAccum([], Accum, Accum).
sumAllAccum([Head|Tail], Accum, Result) :-
    NewAccum is Accum + Head,
    sumAllAccum(Tail, NewAccum, Result).

sumAllAccum(List, Sum) :-
    sumAllAccum(List, 0, Sum).

sublist([], []).
sublist([H|T], [H|St]) :- % Case #1: keep the element
    sublist(T, St).
sublist([_|T], Sublist) :- % Case #2: don't keep the element
    sublist(T, Sublist).

% [1, 2, 3]
% First choice: keep 1
% Second choice: not to keep 2
% Third choice: keep 3

% myReverse([3, 2, 1], Result).
% myReverse([3, 2, 1], [], Result).
%   myReverse([2, 1], [3], Result).
%     myReverse([1], [2, 3], Result).
%       myReverse([], [1, 2, 3], Result).
%       myReverse([], [1, 2, 3], Result).
%
% myReverse/3
%
myReverse([], Accum, Accum).
myReverse([Head|Tail], Accum, Result) :-
    myReverse(Tail, [Head|Accum], Result).

% problem query (arity 2): myReverse(List, [3, 2, 1]).
% problem query (arity 3): myReverse(List, [], [3, 2, 1])
%
% myReverse/2
%
myReverse(List, Result) :-
    myReverse(List, [], Result).

% var(X)
%
% nonvar(X)
%
% ground(X)
