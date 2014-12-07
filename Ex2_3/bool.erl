-module(bool).
-author('Stan P.').

-compile(export_all).

b_not(false) -> true;
b_not(true) -> false;
b_not(_) -> {error, 'Argument is not valid'}.

b_and(false, _) -> false;
b_and(true, true) -> true;
b_and(true, false) -> false;
b_and(_, _) -> {error, 'Argument is not valid'}.

b_nand(A, B) -> b_not(b_and(A, B)).
