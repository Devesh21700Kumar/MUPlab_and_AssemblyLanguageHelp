.MODEL TINY
.486
.DATA
	ORG 100H
	ARRAY1 DD 12345678H, 9ABCDEF0H, 12345678H, 9ABCDEF0H, 12345678H, 9ABCDEF0H, 12345678H, 9ABCDEF0H
	ORG 114H
	ARRAY2 DD 10 DUP(?)
.CODE
.STARTUP
	LEA SI, ARRAY1
	LEA DI, ARRAY2
	MOV CX, 0AH
X1: MOV EAX, [SI]
	MOV [DI], EAX
	ADD SI, 04H
	ADD DI, 04H
	LOOP X1
	
	LEA SI, ARRAY2
	MOV CX, 0AH
X2: MOV EAX, [SI]
	ADD SI, 04H
	LOOP X2	
.EXIT
END