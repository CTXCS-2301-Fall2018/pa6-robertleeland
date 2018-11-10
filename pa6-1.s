		@---------------------
		@	Programming Assignment 6, Problem 1
		@	Your required header information goes here
		@Robert Leeland
		@PA6-1.s
		@Nov 9, 2018
		@---------------------
		@ In those you will use the provided function pow to comput
		@ a^b - 3a
		@ You must set up the arguments to pow and call it using BL
		@ The result should be in R4 after the program completes
	
	@ This function is called pow and follows the ABI standards
	@ for parameter and return value locations.
	@ This function computes a^b where a and b are integer values.
	@ This function is completed for you and you should not modify
	@ it. Your task, is to use the pow function, and other instructions,
	@ to compute a^b-3*a. You will need to get a and b into the
	@ appropriate registers, call pow ( using BL), then use the
	@ result and perform the rest of the computation. Your final
	@ andswer should be in R4 when the program completes. The provided
	@ code will print out your result.
	@ 3^4-3(3)=72

	.extern printf
	.global	main
	.func main	
main:	PUSH {LR}                  @ saves LR to the stack
	@	Your code goes here
	@ 	Objective here is to put A into the right register and multiply
	@       itself B amount of times then subtract A times 3 
	LDR 	R0, =a 		   @ puts the a value in R0
	LDR	R1, =b		   @ puts the b value in R1
	BL	pow		   @ runs pow func (R4=b, R1=a)
	LDR	R2, =a             @ loads a into R2 
	MOV	R3, #3             @ moves #3 into R3
	MUL	R2, R2, R3         @ R2=R2*R3
	SUB	R4, R0, R2         @ R4(ans)=R0(a^b)-R2(3*a)
	@ gives the wrong answer and i don't know why
	@ Code to print your answer.  DO NOT CHANGE!
	LDR	R0, =out           @loads out func to R0
	MOV	R1, R4             @moves R4 value into R1
	BL 	printf             @displays value in R0
	POP	{PC} 		   @returns LR to PC from stack

	
	@---------------------
	@  pow function.  DO NOT CHANGE!
	@---------------------
pow:	PUSH		{LR}	   @ saves LR to the stack
	PUSH		{R4-R6}    @ saves R4-R6 to the stack
	MOV		R4, R1	   @ moves R1(b) to R4
	MOV		R5, #1     @ moves #1 to R5
loop:	CMP		R4, #0     @ compares #0 to R4
	BEQ		exit       @ runs exit if equal
	MUL		R5, R0, R5 @ R5= R0(a) * R5
	SUB		R4, R4, #1 @ R4= R4 - 1
	BAL		loop	   @ Always runs the loop
exit:	MOV		R0, R5     @ moves R5 into R0
	POP		{R4-R6}    @ returns R4-R6 from the stack
	POP		{PC}       @ returns LR to the PC from stack

.data
a:	.word	3                  @ value a = 3
b:	.word	4                  @ value b = 4 
out:	.asciz "Answer: %d\n"      @display string answer from R1
