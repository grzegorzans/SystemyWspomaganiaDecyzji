include "globals.mzn";
include "data.dzn";

int: nmeals;
set of int: Meals = 1..nmeals;

array[Meals] of string: name;
array[Meals] of int: price;
int: budget;

array[Meals] of int: yumyum = [0, 0, 1, 1, 2, 3];

array[Meals] of var 0..budget: n;
var int: yumyum_factor = sum(i in Meals)(yumyum[i] * n[i]);

constraint sum(i in Meals)(price[i]*n[i]) = budget;

solve maximize yumyum_factor;

output [ name[i] ++ " = " ++ show(n[i]) ++ "\n"| i in Meals] ++ ["\nsuma smaku = ", show(yumyum_factor)];