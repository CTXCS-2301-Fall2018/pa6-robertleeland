		;---------------------
		;		Programming Assignment 5, Problem 2
		;		Your required header information goes here
		;---------------------
		;		You are to write a function that performs integer division
		;		Your function must be called div.  It takes two values, a and b,
		;		and should return a/b.  Code is given for you that tests
		;		your program.  Upon successful completion the following values
		;		should be in the registers:
		;		R5 = 0
		;		R6 = 1
		;		R7 = 11
		;		R8 = 4
		;		R9 = 5
		
tester	;	DO NOT TOUCH!
		MOV		R0, #5
		MOV		R1, #9
		BL		div
		MOV		R5, R0
		MOV		R0, #9
		MOV		R1, #5
		BL		div
		MOV		R6, R0
		MOV		R0, #80
		MOV		R1, #7
		BL		div
		MOV		R7, R0
		MOV		R0, #19
		MOV		R1, #4
		BL		div
		MOV		R8, R0
		MOV		R0, #60
		MOV		R1, #12
		BL		div
		MOV		R9, R0
		END
		
		;---------------------
		;		div function.  Your code goes here!
		;---------------------
div		PUSH		{LR}
		PUSH		{R4-R6}
		MOV		R4, R1
		CMP		R4, R0, LSL #1
Div1		MOVLS	R4, R4, LSL #1
		CMP		R4, R0, LSR #1
		BLS		Div1
		MOV		R3, #0
Div2		CMP		R0, R4
		SUBCS	R0, R0, R4
		ADC		R3, R3, R3
		MOV		R4, R4, LSR #1
		CMP		R4, R1
		BHS		Div2
		MOV		R0, R3
		POP		{R4-R6}
		POP		{PC}
