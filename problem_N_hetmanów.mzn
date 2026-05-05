include "globals.mzn";

int: N = 32;
array[1..N] of var 1..N: rows;
array[1..N] of var 1..N: cols;

constraint alldifferent(rows);
constraint alldifferent([rows[i] + i | i in 1..N]);
constraint alldifferent([rows[i] - i | i in 1..N]);
constraint inverse(rows, cols);

solve satisfy;

output 
[if fix(rows[i]) = j then "♕" else "☐" endif ++
 if i = N then "\n" else "" endif | j in 1..N, i in 1..N];