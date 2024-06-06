function Fib (n: nat) : nat
decreases n
{
if n < 2 then n else Fib(n - 2) + Fib(n - 1)
}
//Since both recursive calls decrease the measure (n), and the measure is a natural number, it ensures that the function will eventually reach the base case.
//Since the termination measure decreases with each recursive call and the function terminates immediately for n < 2, the verifier accepts n as the termination measure for all natural numbers.

//lab14 4.2
function F(x: int): int
decreases x
 {
  if x < 10 then x else F(x - 1)
}
//Default decreases: Dafny uses x as the default decreases clause.
//Analysis: For x >= 10, the function calls F(x - 1). Since x - 1 < x, the measure x is decreasing.
//Conclusion: The default decreases works because each recursive call reduces x until x < 10.

function G(x: int): int
decreases x {
  if 0 <= x then G(x - 2) else x
}
//Default decreases: Dafny uses x as the default decreases clause.
//Analysis: For x >= 0, the function calls G(x - 2). Since x - 2 < x, the measure x is decreasing.
//Conclusion: The default decreases works because each recursive call reduces x until x < 0.

function I(x: nat, y: nat): int 
    decreases x, y
    {
  if x == 0 || y == 0 then 12
  else if x % 2 == y % 2 then
    I(x - 1, y)
  else
    I(x, y - 1)
}
//Default decreases: Dafny uses (x, y) as the default decreases clause.
/*Analysis:
For x % 2 == y % 2, the function calls I(x - 1, y), decreasing x.
For x % 2 != y % 2, the function calls I(x, y - 1), decreasing y.
Both x and y are non-negative and decrease, ensuring termination.
*/
//Conclusion: The default decreases (x, y) works because each recursive call decreases either x or y.

function J(x: nat, y: nat): int
    decreases x, y
     {
  if x == 0 then y
  else if y == 0 then
    J(x - 1, 3)
  else
    J(x, y - 1)
}