		;---------------------
		;		Programming Assignment 5, Problem 1
		;		Your required header information goes here
		;---------------------
		;		In those you will use the provided function pow to compute
		;		a^b - 3a
		;		You must set up the arguments to pow and call it using BL
		;		The result should be in R4 after the program completes
		
a_val	DCD		3
b_val	DCD		4
begin
		;		Your code goes here
		LDR		R0, =a_val
		LDR		R1, =b_val
		LDR		R2, [R0]
		LDR		R1, [R1]
		MOV		R0, R2
		BL		pow
		MOV		R4, #3
		MUL		R3, R2, R4
		SUB		R4, R0, R3
		END
		
		;---------------------
		;		pow function.  DO NOT CHANGE!
		;---------------------
pow		PUSH		{LR}
		PUSH		{R4-R6}
		MOV		R4, R1
		MOV		R5, #1
loop		CMP		R4, #0
		BEQ		exit
		MUL		R5, R0, R5
		SUB		R4, R4, #1
		BAL		loop
exit		MOV		R0, R5
		POP		{R4-R6}
		POP		{PC}
