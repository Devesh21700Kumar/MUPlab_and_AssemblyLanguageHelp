.model tiny
.486 
.data 
	sttr db "aBCDefgHIJklmnoPQRStuvWXyzZZ"
.code
.startup
	lea si,sttr
	mov cl,30
	mov al,60h
	mov bl,7Bh
x2: clc
	cmp [si],al
	jle x1
	cmp [si],bl
	jge x1
	mov dl,[si]
	sub dl,20h
	mov [si],dl	
x1: inc si
	dec cl
	jnz x2
.exit
end
