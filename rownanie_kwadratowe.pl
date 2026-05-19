delta(A, B, C, D) :-
	D is B*B - (4*A*C).

kwadrat(A, B, C, X) :-
	delta(A, B, C, D), (
		D > 0 ->
			X1 is (-B + sqrt(D)) / (2*A),
			X2 is (-B - sqrt(D)) / (2*A),
			X = [X1, X2];
		D =:= 0 ->
			X0 is -B / (2*A),
			X = [X0]; 
		D < 0 ->
			write('Brak rozwiazan rzeczywistych')
	).
    