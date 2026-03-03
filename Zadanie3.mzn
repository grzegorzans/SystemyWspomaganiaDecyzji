include "globals.mzn";
include "data.dzn";

int: nmeals;
set of int: Meals = 1..nmeals;

array[Meals] of string: name;
array[Meals] of int: price;
int: budget;

array[Meals] of var 0..budget: n;

constraint sum(i in Meals)(price[i]*n[i]) = budget;

solve satisfy;

output [ name[i] ++ " = " ++ show(n[i]) ++ "\n"| i in Meals];
