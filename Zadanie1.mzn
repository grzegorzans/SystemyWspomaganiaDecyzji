include "globals.mzn";

var 0..10: ow;
var 0..10: fr;
var 0..10: sa; 
var 0..10: sk;
var 0..10: pa;
var 0..10: zp;

constraint 215 * ow + 275 * fr + 335 * sa + 355 * sk + 420 * pa + 580 * zp = 1505;

solve satisfy;

output[" owoce = ",show(ow),"\n frytki = ",show(fr),"\n sałatka = ",show(sa),"\n skrzydełka = ",show(sk),"\n paluszki = ",show(pa),"\n zestaw próbny = ",show(zp)];