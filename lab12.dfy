//lab 12 

/*
 method Triple (x: int ) returns (r: int)
 //requires x < 2
 {
var y := 2 * x;
r := x + y;
assert (r == 10*x);
assert(r == 0);
//assert (r % 3 == 0);
//assert false;
}


//determinism
method Triple (x: int ) returns (r: int)
{
if x == 0{
r := 0;
} else {
var y := 2 * x;
r := x + y;
}
assert r == 3 * x;
}
*/
//nondeterminism - cele doua cazuri se suprapun
method Triple (x: int ) returns (r: int)
{
if {
case x < 18 =>
var a, b := 2 * x, 4 * x;
r := (a+b) / 2;
case 0 <= x =>
var y := 2 * x;
r := x + y;
}
assert r == 3 * x;
}
method Main()
{
    var a:= Triple(4);
    print(a);
}
