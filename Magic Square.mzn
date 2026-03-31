include "alldifferent.mzn";

int: n = 3;
int: n2 = n*n;
array[1..n, 1..n] of var 1..n2: square;
int: magic_sum = n * (n2 + 1) div 2;

constraint all_different([square[i,j] | i,j in 1..n]);

constraint 
  forall(i in 1..n)(
    sum(j in 1..n)(square[i,j]) = magic_sum
  );

constraint 
  forall(j in 1..n) (
    sum(i in 1..n)(square[i,j]) = magic_sum
  );
    
constraint sum(i in 1..n)(square[i,i]) = magic_sum
        /\ sum(i in 1..n)(square[i,n-i+1]) = magic_sum;

solve satisfy;

output [show(square[i,j]) ++ 
(if j = n then "\n" else " " endif)| i,j in 1..n];