int: nodesNumber;
int: n=5; 
int: m=6; 
int: k=3; 
array[1..m, 1..2] of int: edges = 
[|
  1, 2 |
  1, 5 |
  2, 3 |
  3, 4 |
  4, 5 |
  5, 3
|];

var 1..nodesNumber: colorsNumber = max(nodes);
array[1..nodesNumber] of var 1..nodesNumber: nodes;

constraint 
  forall(i in 1..m)(
    nodes[edges[i,1]] != nodes[edges[i,2]] 
  );

solve minimize colorsNumber;

output [show(colorsNumber), " colors \n"] ++ 
[show(nodes[i]) ++ " " | i in 1..nodesNumber];