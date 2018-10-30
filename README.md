# PA6
CSC2301 Programming Assignment 6

1. In this problem I’ve given you some starter code and a function in the file `pa6-1.s`.  This function is called `pow` and follows the ABI standards for parameter and return value locations.  This function computes *a^b* where *a* and *b* are integer values.  This function is completed for you and you should not modify it.  Your task, is to use the `pow` function, and other instructions, to compute *a^b – 3\*a*.  You will need to get *a* and *b* into the appropriate registers, call `pow` (using `BL`), then use the result and perform the rest of the computation. Your final answer should be in R4 when the program completes.

2. In this exercise you are going write a function that follows the ABI standards.  This function is going to perform integer division and must be named `div`.  You should use the code from Figure 12b in your book as the starting point for your division code.  Note that in order to follow the ABI standards of where parameters go, you will have to modify this code.  Your function should compute `R0 / R1` and put the quotient in `R0`.  (You can ignore the remainder.)  Be sure to `PUSH {LR}` and any registers you use (`R4-R12`) on the stack at the beginning of your function and `POP` them off at the end.  In `pa5-2.s` you are given some code that will test your `div` function.  Do not modify this code.  Your code for `div` should go at the end of the file.  The results that you should get are shown in the comments of the code.

## Grading Rubric

### Comments
Your code must contain (in comments)
 * Name of author (or both partners for pair assignments)
 * Name of assignment
 * Date assignment is completed
 * A short (one or two line) description of what your program does.
 * A description of how each register in the program is being used
 * When subroutines are created, a description of all inputs and the purpose of the function
 * Any outside resources (other than textbook, or slides) utilized in the completion of the project
 * __Each line of new code you write should indicate what that line of code is doing.__

### Grading standard

| Standard | Correctness | Design and Efficiency | Comments and format |
|----------|-------------|-----------------------|---------------------|
|Full credit|Program fully implements the operational requirements as set forth in the assignment.  For all test inputs, the program produces the correct result.: 20 points | Code implements the algorithm in the most efficient manner possible: 5 points | Code contains all the  comments listed above: 5 points |
| Good | Program produces the correct result in 75% of the test cases: 15 points | Code does two or three operations that are not needed, or could be simplified: 3 points | 1 or 2 items missing or code not neat: 3 points |
| Fair | Program produces the correct result in 50% of the test cases: 10 points | Code does many inefficient operations, but is generally able to be followed:  2 points | about half of comments are missing: 2 points |
| Poor | Program produces the correct result in less than 50% of the test cases, but a reasonable attempt has been made to write correct code: 5 points | | Minimal commenting: 1 point |
| Nothing | Code not turned in or does not appear to address the operational requirements in any meaningful way: 0 | Code is very inefficient or convoluted or difficult to follow: 0 | No commenting: 0 |
