include "globals.mzn";

int: nmeals = 6;
set of int: Meals = 1..nmeals;

array[Meals] of string: name = ["Owoce", "Frytki", "Sałatka", "Skrzydełka", "Paluszki", "Zestaw próbny"];
array[Meals] of int: price = [215, 275, 335, 355, 420, 580];

array[Meals] of var 0..7: n;

constraint sum(i in Meals)(price[i]*n[i]) = 1505;

solve satisfy;

output [ name[i] ++ " = " ++ show(n[i]) ++ "\n"| i in Meals];
