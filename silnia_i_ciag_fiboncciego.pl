silnia(0, 1).
silnia(N, S) :-
	N > 0,
	N1 is N - 1,
	silnia(N1, S1),
	S is N * S1.

cg_fib(0, 0).
cg_fib(1, 1).
cg_fib(N, F) :-
	N > 1,
	N1 is N - 1,
	N2 is N - 2,
	cg_fib(N1, F1),
	cg_fib(N2, F2),
	F is F1 + F2.