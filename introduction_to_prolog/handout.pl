% question #1
servedWarm(pizza).
servedWarm(burger).
servedWarm(burrito).

% question #2
% servedWarm(X).

% question #3
likes(alice, pizza).
likes(alice, burger).
likes(alice, burrito).
likes(alice, yogurt).
likes(bob, pizza).
likes(bob, burger).
likes(bob, salad).
likes(bob, milk).

% question #4
% likes(alice, X).

% question #5
% likes(X, pizza)

% 6.) Write a rule encapsulating the following idea: Bill likes any food that’s served warm.
% The name of the rule should be the same as the fact name you used in the previous problem.

likes(bill, Food) :-
    servedWarm(Food).

% 7.) Write a rule encapsulating the following idea: Janet likes any food that both Alice and Bob like.
% The name of the rule should be the same as before.

likes(janet, Food):-
    %% (likes(alice, Food); likes(bob, Food)). % need setof to avoid duplicates
    likes(alice, Food),
    likes(bob, Food).

% 8.) Write code (potentially both rules and facts) encapsulating the following idea: Mel likes the foods
% that Janet likes, along with yogurt.  Any rules and/or facts you define should use the same name as before.

%% likes(mel, Food) :-
%%     likes(janet, Food); Food = yogurt.

likes(mel, Food) :-
    likes(janet, Food).
likes(mel, yogurt).


