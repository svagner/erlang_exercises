-module(e33).
-author('Stan P.').

-export([print_nums/2, print_nums/1]).

print_nums(N, odd) when is_number(N), N > 0, N rem 2 == 0 -> print_nums(N-1, odd), io:format("~p~n", [N]);
print_nums(N, odd) when is_number(N), N > 0 -> print_nums(N-1, odd);
print_nums(_, odd) -> ok.

print_nums(N) when is_number(N), N > 0 -> print_nums(N-1), io:format("~p~n", [N]);
print_nums(_) -> ok.
