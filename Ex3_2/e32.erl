-module(e32).
-author('Stan P.').

-export([create/1, reverse_create/1]).

create(N) when not is_number(N) or N < 0 -> {error, 'arguments are not valid'};
create(1) -> [1];
create(N) when is_number(N), N > 0 -> create(N-1) ++ [N].

reverse_create(N) when not is_number(N) or N < 0 -> {error, 'arguments are not valid'};
reverse_create(1) -> [1];
reverse_create(N) when is_number(N), N > 0 -> [N] ++ reverse_create(N-1).

%% reverse_create(N) when is_number(N), N > 0 -> lists:reverse(create(N)).

%% we can create it with accumulate
