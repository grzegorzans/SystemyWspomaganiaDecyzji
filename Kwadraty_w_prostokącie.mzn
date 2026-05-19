include "diffn.mzn";
include "cumulative.mzn";
include "squares_placement.dzn";

int: n;

array[1..n] of int: size = [i | i in 1..n];

int: maxSide = sum(size);

var 1..maxSide: width;
var 1..maxSide: height;

array[1..n] of var 0..maxSide: x;
array[1..n] of var 0..maxSide: y;

constraint forall(i in 1..n)(
    x[i] + size[i] <= width /\
    y[i] + size[i] <= height
);

constraint diffn(x, y, size, size);

constraint cumulative(x, size, size, height);
constraint cumulative(y, size, size, width);

constraint x[n] = 0;
constraint width <= 3 * height div 2;
constraint exists(i in 1..n)(y[i] = 0);

solve minimize height * width;

output [
    "width = ", show(width), "\n",
    "height = ", show(height), "\n",
    "x = ", show(x), "\n",
    "y = ", show(y), "\n"
];