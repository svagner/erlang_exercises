-module(e37).
-author("Stan P.").

-export([new/0, destroy/1, write/3, delete/2, read/2, match/2, test/0]).

new() -> [].

destroy(_) -> ok.

write(Key, Value, Db) -> [{Key, Value}|delete(Key, Db)].

delete(Key, Db) -> lists:keydelete(Key, 1, Db).

read(Key, Db) -> 
  Res = lists:keyfind(Key, 1, Db),
  case Res == false of 
    true -> {error, instance};
    false -> {ok, element(2, Res)}
  end.

match_echo([]) -> [];
match_echo([Head|Tail]) ->
  [element(1, Head)|match_echo(Tail)].

match(Value, Db) -> 
  Res = lists:filter(fun(X) -> element(2, X) == Value end, Db),
  case Res == false of
    true -> [];
    false -> match_echo(Res)
  end.

test() ->
  Db = new(),
  Dbl = write(francesco, london, Db),
  Db2 = write(lelle, stockholm, Dbl),
  {ok, london} = read(francesco, Db2),
  Db3 = write(joern, stockholm, Db2),
  {error,instance} = read(ola, Db3),
  [joern, lelle] = match(stockholm, Db3),
  Db4 = delete(lelle, Db3),
  [joern] = match(stockholm, Db4).
