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


