.MODEL TINY
.DATA
	ATTRIBUTE	DB	04H ;PIXEL COLOR
	BEGINROW	DW	80
	BEGINCOL	DW	70
	ENDROW		DW	180
	ENDCOL		DW	150
	ORIGINAL	DB	?
	
.CODE
.STARTUP	

	MOV	AH, 0FH ;GETTING THE DISPLAY MODE
	INT 10H
	
	MOV ORIGINAL,AL ;PRESERVING THE ORIGINAL VALUE OF AL
	MOV	AL, 12H ;SETTING THE DISPLAY MODE TO GRAPHICAL MODE
	MOV AH, 0
	INT 10H
	
	MOV	DX, BEGINROW ;INITIALISING THE BEGINNING 
	
X1:	MOV CX, BEGINCOL ;INITIALISING THE COLUMN POSITION

X2:	MOV AL, ATTRIBUTE ;PIXEL COLOR
	MOV	AH, 0CH ;FILLING A PIXEL
	INT 10H
	
	INC CX
	CMP CX, ENDCOL
	JNZ	X2 ; IF THE COLUMN IS NOT COMPLETED
	
	INC DX ;JUMP TO THE NEXT ROW
	CMP DX, ENDROW
	JNZ X1 ;START FROM THE NEXT ROW
	
X3: MOV AH, 07H
	INT 21H	
	CMP AL,'E' ;PRESS 'E' FOR EXIT
	JZ X3

	MOV AL, ORIGINAL ;RESTORING BACK THE ORGINAL DISPLAY MODE
	MOV AH, 0
	INT 10H
	
.EXIT
END