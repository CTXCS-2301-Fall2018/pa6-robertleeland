		@---------------------
		@	Programming Assignment 6, Problem 2
		@	Your required header information goes here
		@	 robert Leeland
		@	 PA6-2.s
		@	 Nov 9, 2018
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

	@ in this exercise you are going to write a function that follows the ABI standards.
	@ This function is going to perform integer division and must be named div.
	@ You should use the code from Figure 12b in your book as the starting point for your
	@ division code. Note that in order to follow the ABI standards of where parameters go,
	@ you will ahve to modify this code. Your function should compute R0/R1 and put the
	@ quotient in R0. (You can ignore the remainder.) Be sure to PUSH {LR} and any
	@ registers you use (R4-R12) on the stack at the beginning of your function and POP
	@ off at the end. In PA6-2.s you are given some code that will test your div function.
	@ Do not modify this code. Your code for div should go at the end of the file. The
	@ results that you should get are shown in the comments of the code.
	
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
		PUSH	{R4,R5,R6}
		MOV R4, R1		@ put divisor in R4
		CMP R4, R0, LSR #1	@ double until 2xR4>divisor

div1:
		MOVLS R4, R4, LSL #1	@ moves	
		CMP R4, R0, LSR #1
		BLS div1
		MOV R3, #0		@R3 assigned as quotient and initialized

div2:
		CMP R0, R4		@ can we subtract R4?
		SUBCS R0, R0, R4	@ if we can do so.	
		ADC R3, R3, R3		@ double quotient & add new bit
		MOV R4, R4, LSR #1	@ Halve R4
		CMP R4, R1		@ compare divisor
		
		BHS div2		@ run loop till 
		MOV R0, R3		@ moves quotient into R0
	
		POP	{R4,R5,R6}
		POP	{PC} 	@ return statement
.data
out:	.asciz "%d\n"	@ String for printf
