-module(ex35).
-author('Stan P.').

-export([test/0, filter/2, reverse/1, concatenate/1, flatten/1]).

filter([_|_], Num) when not is_number(Num) -> {error, "arguments aren't valid"};
filter([], _) -> [];
filter([Head|Tail], Num) when Head =< Num -> [Head|filter(Tail, Num)];
filter([_|Tail], Num) -> filter(Tail, Num).

reverse([]) -> [];
reverse([Head|Tail]) -> reverse(Tail) ++ [Head].

concatenate([]) -> [];
concatenate([Head|Tail]) when is_list(Head) -> Head ++ concatenate(Tail);
concatenate([Head|Tail]) -> [Head|Tail].

flatten([Head|Tail]) when is_list(Head) -> concatenate([flatten(Head)|flatten(Tail)]);
flatten([Head|Tail]) -> [Head|flatten(Tail)];
flatten([]) -> [].

test() ->
  [1,2,3] = filter([1,2,3,4,5],3),
  [3,2,1] = reverse([1,2,3]),
  [1,2,3,4,five] = concatenate([[1,2,3], [], [4, five]]),
  [1,2,3,4,5,6] = flatten([[1,[2,[3],[]]], [[[4]]], [5,6]]).
