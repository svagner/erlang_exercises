-module(e36).
-author('Stan P.').

-export([qsort/1, msort/1]).

qsort([]) -> [];
qsort([Head|Tail]) -> 
  {Less, More} = split(Head, Tail),
  qsort(Less) ++ [Head] ++ qsort(More).

split(_, []) -> {[], []};
split(Num, [Head|Tail]) ->
  {Less, More} = split(Num, Tail),
  case Head < Num of
    true -> {[Head|Less], More};
    false -> {Less, [Head|More]}
  end.

msort([N|[]]) -> [N];
msort(Array) ->
  {Left, Right} = lists:split(length(Array) div 2, Array),
  merge(msort(Left), msort(Right)).

merge(Left, []) -> Left;
merge([], Right) -> Right;
merge([LHead|LTail], [RHead|RTail]) ->
  case LHead > RHead of
    true -> [RHead|merge([LHead|LTail], RTail)];
    false -> [LHead|merge(LTail, [RHead|RTail])]
  end.
