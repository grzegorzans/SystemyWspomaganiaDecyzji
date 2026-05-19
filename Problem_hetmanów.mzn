include "alldifferent.mzn";
include "inverse.mzn";

int: N = 16;
array[1..N] of var 1..N: rows;
array[1..N] of var 1..N: cols;

constraint alldifferent(rows);
constraint alldifferent([rows[i] + i | i in 1..N]);
constraint alldifferent([rows[i] - i | i in 1..N]);
constraint inverse(rows, cols);

constraint rows[1] = 1;
constraint rows[8] != 8;
constraint sum([bool2int(rows[i] <= N div 2) | i in 1..N]) = N div 2;

solve satisfy;

output 
[if fix(rows[i]) = j then "♕" else "☐" endif ++
 if i = N then "\n" else "" endif | j in 1..N, i in 1..N]; 