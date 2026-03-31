include "alldifferent.mzn";

int: S = 3;   
int: N = S * S; 
set of int: PuzzleRange = 1..N; 
set of int: SingleSquareRange = 1..S; 

array[PuzzleRange, PuzzleRange] of 0..N: board = 
[|
  5,3,0,0,7,0,0,0,0 |
  6,0,0,1,9,5,0,0,0 |
  0,9,8,0,0,0,0,6,0 |
  8,0,0,0,6,0,0,0,3 |
  4,0,0,8,0,3,0,0,1 |
  7,0,0,0,2,0,0,0,6 |
  0,6,0,0,0,0,2,8,0 |
  0,0,0,4,1,9,0,0,5 |
  0,0,0,0,8,0,0,7,9
|];

array[PuzzleRange, PuzzleRange] of var PuzzleRange: puzzle;

constraint
  forall(r,c in PuzzleRange where board[r,c] > 0)(
    puzzle[r,c] = board[r,c]
  );
  
constraint 
  forall(r in PuzzleRange) (
    all_different([puzzle[r,c] | c in PuzzleRange])
  );
  
constraint 
  forall(c in PuzzleRange) (
    all_different([puzzle[r,c] | r in PuzzleRange])
  );
  
constraint 
  forall(br, bc in 0..S-1) (
    all_different([puzzle[br*S + r, bc*S + c] | r,c in 1..S])
  );

solve satisfy;

output [show(puzzle[r,c]) ++
(if c = N then "\n" else " " endif) | r,c in PuzzleRange];