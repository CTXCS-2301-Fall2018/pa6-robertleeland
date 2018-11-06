		@---------------------
		@	Programming Assignment 6, Problem 2
		@	Your required header information goes here
		@--------------------
		@	You are to write a function that performs integer division
		@	Your function must be called div.  It takes two values, a and b passed as parameters,
		@	and should return a/b.  Code is given for you that tests
		@	your program.  Upon successful completion the following values should print
		@	0
		@	1
		@	11
		@	4
		@	5
	.extern printf
        .global main
        .func main 		
main:		@	DO NOT TOUCH!
		PUSH	{LR}
		MOV	R0, #5
		MOV	R1, #9
		BL	div
		MOV	R1, R0
		LDR	R0, =out
		BL 	printf
		MOV	R0, #9
		MOV	R1, #5
		BL	div
		MOV	R1, R0
		LDR	R0, =out
		BL 	printf
		MOV	R0, #80
		MOV	R1, #7
		BL	div
		MOV	R1, R0
		LDR	R0, =out
		BL 	printf
		MOV	R0, #19
		MOV	R1, #4
		BL	div
		MOV	R1, R0
		LDR	R0, =out
		BL 	printf
		MOV	R0, #60
		MOV	R1, #12
		BL	div
		MOV	R1, R0
		LDR	R0, =out
		BL 	printf
		POP	{PC}
		
		@---------------------
		@	div function.  Your code goes here!
		@---------------------
div:		PUSH	{LR}	@ Leave this here

		@ Your code here
	
		POP	{PC} 	@ return statement
.data
out:	.asciz "%d\n"	@ String for printf
