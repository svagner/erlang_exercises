-module(e31).
-author('Stan P.').

-export([sum/1, sum/2]).

sum(N) when N >= 1, is_number(N) -> N + sum(N-1);
sum(_) -> 0.

sum(N, M) when not is_number(N) or not is_number(M) -> {error, 'arguments are not valid'};
sum(N, M) when N > M -> error('arithmetic_error');
sum(N, M) when M > N -> M + sum(N, M-1);
sum(N, M) when N == M -> N.
