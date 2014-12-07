-module(e34).
-author("Stan P.").

-export([new/0, destroy/1, write/3, delete/2, read/2, match/2, test/0]).

new() -> [].

destroy(_) -> ok.

write(Key, Value, Db) -> [{Key, Value}|delete(Key, Db)].

delete(_, []) -> [];
delete(Key, [{Key, _}|TDb]) -> delete(Key, TDb);
delete(Key, [Head|TDb]) -> [Head|delete(Key, TDb)].

read(_, []) -> {error, instance};
read(Key, [{Key, Value}|_]) -> {ok, Value};
read(Key, [_|TDb]) -> read(Key, TDb).

match(_, []) -> [];
match(Value, [{Key, Value}|TDb]) -> [Key|match(Value, TDb)];
match(Value, [_|TDb]) -> match(Value, TDb).

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
