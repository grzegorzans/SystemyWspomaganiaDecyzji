int: N;
array[1..N] of var 1..N: rows;
include "alldifferent.mzn";

constraint alldifferent(rows);
constraint alldifferent([rows[i] + i | i in 1..N]);
constraint alldifferent([rows[i] - i | i in 1..N]);

solve satisfy;

output 
[if fix(rows[i]) = j then "♕" else "☐" endif ++
 if i = N then "\n" else "" endif | j in 1..N, i in 1..N];