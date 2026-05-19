kolor(czerwony).
kolor(zielony).
kolor(niebieski).

koloruj(A,B,C,D,E) :-
	kolor(A), kolor(B), kolor(C), kolor(D), kolor(E),
	A \= B,
	A \= C,
	B \= D,
	B \= C,
	B \= E,
	C \= E.