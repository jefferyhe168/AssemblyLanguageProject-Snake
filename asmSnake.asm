TITLE Snake.asm

INCLUDE Irvine32.inc
main EQU start@0
.data
	Snake1 BYTE " ________   ____  _____       ___       ___   ___   _______ ",0
	Snake2 BYTE "|   _____| |_   \|_   _|     / _ \     |   | /  /  |   ____|",0
	Snake3 BYTE "|  |_____    |   \ | |      / /_\ \    |   |/  /   |  |____ ",0
	Snake4 BYTE "|_____   |   | |\ \| |     /  ___  \   |       \   |   ____|",0
	Snake5 BYTE " _____|  |  _| |_\   |_   /  /   \  \  |   |\   \  |  |____ ",0
	Snake6 BYTE "|________| |_____|\____| /__/     \__\ |___| \___\ |_______|",0

	PressToStart1 BYTE ".-. .-. .-. .-. .-.   .-. .-. .-. .-. .-.   .-. .-.   .-. .-. .-. .-. .-. " ,0
	PressToStart2 BYTE "|-' |(  |-- `-. `-.   `-. |-' |-| |   |--    |  | |   `-.  |  |-| |(   |  " ,0
	PressToStart3 BYTE "'   ' ' `-' `-' `-'   `-' '   ` ' `-' `-'    '  `-'   `-'  '  ' ' ' '  '  " ,0

	GAMOVER1	BYTE "   _|_|_|    _|_|    _|      _|  _|_|_|_|        _|_|    _|      _|  _|_|_|_|  _|_|_|   ",0
	GAMOVER2	BYTE " _|        _|    _|  _|_|  _|_|  _|            _|    _|  _|      _|  _|        _|    _| ",0
	GAMOVER3	BYTE "_|  _|_|  _|_|_|_|  _|  _|  _|  _|_|_|        _|    _|  _|      _|  _|_|_|    _|_|_|    ",0
	GAMOVER4 	BYTE "_|    _|  _|    _|  _|      _|  _|            _|    _|    _|  _|    _|        _|    _|  ",0
	GAMOVER5	BYTE "  _|_|_|  _|    _|  _|      _|  _|_|_|_|        _|_|        _|      _|_|_|_|  _|    _|  ",0

	String1		BYTE "Highest Score: ",0
	String2		BYTE "Your Score is: ",0				   	
	String3		BYTE "GAME OVER!!!",0						
	String4		BYTE "Game speed is: ",0
	String5		BYTE "Press space to continue or esc to exit",0	
	String6		BYTE "Press S or s for simple.",0
	String7		BYTE "Press N or n for normal.",0 
	String8		BYTE "Press H or h for hard.",0
	x_head 		BYTE ?								
	y_head 		BYTE ?								 
	head 		BYTE '0'
	node 		BYTE 'o'							
	x_apple		BYTE ?								
	y_apple		BYTE ?								
	appleeaten	BYTE 0								
	direction 	BYTE 0  							
	olddirection 	BYTE 0								
	bricks1 	BYTE "****************************************************",0	
	bricks2 	BYTE "*                                                  *",0	
	apple		BYTE "@"							
	x_tail		BYTE ?								
	y_tail		byte ?								
	Nodes_X		BYTE 735 DUP(0)
	Nodes_Y		BYTE 735 DUP(0)							
	NumOfNodes	DWORD 0
	score		DWORD 0
	score1		DWORD 0
	rec_sc		DWORD 0
	speed		WORD 160								
.code

StartPage PROC uses eax
	mov  dl,27  ;column
    mov  dh,10  ;row
    call Gotoxy ;,SetTextColor,Writestring,Clrscr,
	mov eax, red+(black*16)
    call SetTextColor
	mov edx, offset Snake1
	call Writestring

	mov  dl,27  ;column
    mov  dh,11  ;row
    call Gotoxy
	mov eax, red+(black*16)
    call SetTextColor
	mov edx, offset Snake2
	call Writestring

	mov  dl,27  ;column
    mov  dh,12  ;row
    call Gotoxy
	mov eax, red+(black*16)
    call SetTextColor
	mov edx, offset Snake3
	call Writestring

	mov  dl,27  ;column
    mov  dh,13  ;row
    call Gotoxy
	mov eax, red+(black*16)
    call SetTextColor
	mov edx, offset Snake4
	call Writestring

	mov  dl,27  ;column
    mov  dh,14  ;row
    call Gotoxy
	mov eax, red+(black*16)
    call SetTextColor
	mov edx, offset Snake5
	call Writestring

	mov  dl,27  ;column
    mov  dh,15  ;row
    call Gotoxy
	mov eax,red+(black*16)
    call SetTextColor
	mov edx, offset Snake6
	call Writestring

	mov  dl,20  ;column
    mov  dh,20  ;row
    call Gotoxy
	mov eax, red+(black*16)
    call SetTextColor
	mov edx, offset PressToStart1
	call Writestring

	mov  dl,20  ;column
    mov  dh,21  ;row
    call Gotoxy
	mov eax, red+(black*16)
    call SetTextColor
	mov edx, offset PressToStart2
	call Writestring

	mov  dl,20  ;column
    mov  dh,22  ;row
    call Gotoxy
	mov eax, red+(black*16)
    call SetTextColor
	mov edx, offset PressToStart3
	call Writestring

	ret
StartPage ENDP

Difficulty PROC
	call Clrscr
	mov eax, yellow			
	call SetTextColor
	mov dl, 50			
	mov dh, 5			
	call Gotoxy
	mov edx, OFFSET String6
	call WriteString

	mov dl, 50		
	mov dh, 15			
	call Gotoxy
	mov edx, OFFSET String7
	call WriteString

	mov dl, 50		
	mov dh, 25			
	call Gotoxy
	mov edx, OFFSET String8
	call WriteString

	checkdiff:
		call ReadChar
		.IF al==53h || al ==73h
			call main
		.ELSEIF al==4eh || al==6eh
			mov speed,140
			call main
		.ELSEIF al==48h || al==68h
			mov speed,110
			call main
		.ENDIF
		
		mov ecx , 2
		loop checkdiff
	ret

Difficulty ENDP

GAME PROC
	call Clrscr
	mov dl, 15			
	mov dh, 23			
	call Gotoxy			
	mov eax, yellow			
	call SetTextColor		
	mov edx, OFFSET String4
	call WriteString
	mov dl, 14			
	mov dh, 4			
	call Gotoxy			
	mov eax, red+(white*16)	
	call SetTextColor		
	mov edx, OFFSET bricks1
	call WriteString
	mov ah, 20
Wall:
	mov dl, 14			
	mov dh, ah
	call Gotoxy			
	dec ah
	mov edx, OFFSET bricks2		
	call WriteString
	cmp ah, 4			
	jg Wall
	mov dl, 14			
	mov dh, 21
	call Gotoxy			
	mov edx, OFFSET bricks1
	call WriteString		
RandomX:
	call Randomize			
	mov eax, 64
	call RandomRange		
	cmp al, 15
	jl RandomX			
	mov x_head, al
	mov esi, OFFSET Nodes_X		
	mov [esi], al
	mov dl, al			
RandomY:
	mov eax, 19			
	call RandomRange
	cmp al, 5			
	jl RandomY
	mov y_head, al			
	mov esi, OFFSET Nodes_Y
	mov [esi], al			
	mov dh, al
	call Gotoxy			
	mov al, head
	call WriteChar
Start:
	call CrashSnake			
	call ReadKey			
	jz SameDirection		
	cmp ah, 51H			
	jg Start
	cmp ah, 47H			
	jl Start
	cmp ah, 4CH			
	je Start
	call Move			
	call Configure			
	call PrintNodes			
	jmp Start
SameDirection:
	mov ah, direction		
	cmp ax, 0001H
	je Start
	call Move			
	call Configure			
	call PrintNodes			
	jmp Start
GAME ENDP

Move PROC USES eax edx
	mov direction, ah		
	call GameSpeed		
	mov ax, speed
	movzx eax, ax			
	call Delay			
	mov dl, 30			
	mov dh, 23			
	call Gotoxy
	mov eax, yellow+(black*16)	
	call SetTextColor
	mov ax, 200
	sub ax, speed
	call WriteDec
	mov eax, red+(white*16)	
	call SetTextColor
	mov dl, x_head
	mov dh, y_head
	call Gotoxy
	mov al, ' '
	call WriteChar
	call EatApple
	mov ah, direction		
	mov al, olddirection		
	cmp dl, 65			
	jge GameOver
	cmp dl, 14			
	jle GameOver
	cmp dh, 21			
	jge GameOver
	cmp dh, 4
	jle GameOver
	cmp ah, 48H			
	je Up
	cmp ah, 50H			
	je Down
	cmp ah, 4DH			
	je Right
	cmp ah, 4BH			
	je Left
	jmp Finish
Up:
	mov olddirection, 48H		
	cmp al, 50H
	je Down			
	dec dh
	jmp UpdateHeadLoc
Down:
	mov olddirection, 50H		
	cmp al, 48H
	je Up				
	inc dh
	jmp UpdateHeadLoc
Right:
	mov olddirection, 4DH		
	cmp al, 4BH
	je Left				
	inc dl
	jmp UpdateHeadLoc
Left:
	mov olddirection, 4BH		
	cmp al, 4DH
	je Right			
	dec dl
	jmp UpdateHeadLoc
UpdateHeadLoc:
	mov x_head, dl			
	mov y_head, dh
	call Gotoxy			
	mov al, head
	call WriteChar
Finish:
	ret
GameOver:
	mov dl, x_head			; If any error occurs the game ends
	mov dh, y_head
	call Gotoxy			; by this label.
	mov al, '*'
	call WriteChar
	mov eax, white+(black*16)
    call SetTextColor
	mov eax, 2000 	; 延遲 3s
	call delay
	call died

Move ENDP

EatApple PROC USES eax edx
NewApple:
	mov al, appleeaten		
	cmp al, 0
	jne NotEaten			
RandomX:
	mov appleeaten, 1	
	mov eax, 64
	call RandomRange		
	cmp al, 15
	jl RandomX			
	mov x_apple, al
	mov dl, al			
RandomY:
	mov eax, 18
	call RandomRange
	cmp al, 5
	jl RandomY
	mov y_apple, al
	mov dh, al
	call Gotoxy
	mov al, apple
	call WriteChar
	mov al, dl
NotEaten:
	mov al, x_head			
	mov ah, y_head
	mov dl, x_apple			
	mov dh, y_apple
	cmp ax, dx			
	jne Finish
	mov eax, NumOfNodes		
	inc eax
	mov NumOfNodes, eax		
	mov appleeaten, 0		
	call AddNodes			
	call GameScore			
	mov dl, 40
	mov dh, 23
	call Gotoxy
	mov eax, yellow			
	call SetTextColor
	mov edx, OFFSET String2		
	call WriteString
	mov eax, score1
	call WriteDec
	mov eax, red+(white*16)
    call SetTextColor
	jmp Finish
Finish:
	ret
EatApple ENDP

AddNodes PROC USES eax ebx ecx esi
	mov ebx, NumOfNodes		
	cmp ebx, 1
	jge Continue			
	mov esi, OFFSET Nodes_X
	mov al, x_head			
	mov [esi], al
	mov al, [esi]
	mov esi, OFFSET Nodes_Y
	mov al, y_head
	mov [esi], al
	mov al, [esi]
	jmp Finish
Continue:				
	mov al, appleeaten		
	movzx eax, al			
	cmp al, 0			
	jne NotEaten
Eaten:
	mov ecx, NumOfNodes		
	inc ecx				
ShiftRight:
	mov ebx, ecx			
	mov esi, OFFSET Nodes_X
	mov al, [esi+ebx-1]		
	mov [esi+ebx], al
	mov esi, OFFSET Nodes_Y		
	mov al, [esi+ebx-1]
	mov [esi+ebx], al		
	Loop ShiftRight
	mov esi, OFFSET Nodes_X		
	mov al, x_apple
	mov [esi], al			
	mov esi, OFFSET Nodes_Y
	mov al, y_apple
	mov [esi], al
NotEaten:
	call Configure			
	call PrintNodes			
Finish:				
	ret
AddNodes ENDP

Configure PROC USES eax ebx ecx esi
	mov esi, OFFSET Nodes_X		
	mov al, [esi]
	mov x_tail, al			
	mov esi, OFFSET Nodes_Y
	mov al, [esi]			
	mov y_tail, al
	mov ebx, 1
	mov ecx, NumOfNodes
	inc ecx
ShiftLeft:
	mov esi, OFFSET Nodes_X		
	mov al, [esi+ebx]
	mov [esi+ebx-1], al		
	mov esi, OFFSET Nodes_Y
	mov al, [esi+ebx]		
	mov [esi+ebx-1], al
	mov al, [esi]			
	inc ebx
	Loop ShiftLeft			
	mov ebx, NumOfNodes
	mov esi, OFFSET Nodes_X
	mov al, x_head
	mov [esi+ebx], al
	mov al, [esi]
	mov esi, OFFSET Nodes_Y
	mov al, y_head
	mov [esi+ebx], al
ret
Configure ENDP

PrintNodes PROC USES eax ebx ecx edx esi
	mov dl, x_tail			
	mov dh, y_tail
	call Gotoxy			
	mov al, ' '
	call WriteChar			
	mov ecx, NumOfNodes
	inc ecx				
Print:
	mov ebx, ecx
	mov esi, OFFSET Nodes_X
	mov al, [esi+ebx-1]		
	mov dl, al
	mov esi, OFFSET Nodes_Y
	mov al, [esi+ebx-1]		
	mov dh, al
	call Gotoxy			
	mov edx, NumOfNodes		
	inc edx
	cmp ecx, edx			
	jne PrintNode
	mov al, head
	jmp Printt
PrintNode:
	mov al, node
Printt:
	call WriteChar
	Loop Print
ret
PrintNodes ENDP

CrashSnake PROC USES eax ebx ecx edx esi
	mov ecx, NumOfNodes		
	cmp ecx, 3
	jle Finish			
	inc ecx
Crash:					
	mov ebx, ecx
	mov esi, OFFSET Nodes_X		
	mov al, [esi+ebx-2]
	mov dl, al
	mov esi, OFFSET Nodes_Y		
	mov al, [esi+ebx-2]
	mov dh, al			
	mov al, x_head
	mov ah, y_head			
	cmp dx, ax
	je Lengthh			
	jmp Endd
Lengthh:				
	mov edx, NumOfNodes
	inc edx				
	cmp ecx, edx
	je Endd
EndOfGame:
	mov eax, white+(black*16)
    call SetTextColor
	mov eax, 2000 	; 延遲 3s
	call delay
	call died

	exit
Endd:
	Loop Crash
Finish:
	ret
CrashSnake ENDP

GameScore PROC USES eax						;計算分數
	mov eax, score
	add eax, 1			
	mov score, eax
	mov eax,score1
	add eax,1
	mov score1,eax
	ret			
GameScore ENDP

GameSpeed PROC USES eax ebx edx				;遊戲中加速
	mov edx, 0			
	mov eax, score
	mov ebx, 10		
	div ebx
	cmp edx, 1			
	jne Finish
	mov ax, speed			
	mov bx, 10
	sub ax, bx			
	mov speed, ax
	mov eax,score			
	add eax,1
	mov score,eax
Finish:
	ret
GameSpeed ENDP

died PROC uses eax ebx edx 
	call Clrscr ;清除畫面
	
	;顯示gameover

	mov  dl,10  ;column
    mov  dh,10  ;row
    call Gotoxy
	mov eax, white+(black*16)
    call SetTextColor
	mov edx, offset GAMOVER1
	call Writestring
	
	mov  dl,10 ;column
    mov  dh,11  ;row
    call Gotoxy
	mov eax, white+(black*16)
    call SetTextColor
	mov edx, offset GAMOVER2
	call Writestring

	mov  dl,10  ;column
    mov  dh,12  ;row
    call Gotoxy
	mov eax, white+(black*16)
    call SetTextColor
	mov edx, offset GAMOVER3
	call Writestring

	mov  dl,10  ;column
    mov  dh,13  ;row
    call Gotoxy
	mov eax, white+(black*16)
    call SetTextColor
	mov edx, offset GAMOVER4
	call Writestring

	mov  dl,10  ;column
    mov  dh,14  ;row
    call Gotoxy
	mov eax, white+(black*16)
    call SetTextColor
	mov edx, offset GAMOVER5
	call Writestring
	
	mov dl,34
	mov  dh,21  ;row
    call Gotoxy
	mov edx, offset string2
	call Writestring
	mov eax,score1
	call WriteDec

	mov eax,score1
	mov ebx,rec_sc
	.IF eax>ebx
		mov rec_sc,eax
	.ENDIF
	mov dl,57
	mov  dh,21  ;row
    call Gotoxy
	mov edx, offset string1
	call Writestring
	mov eax,rec_sc
	call WriteDec

	mov  dl,35  ;column
    mov  dh,26  ;row
    call Gotoxy
	mov edx, offset string5
	call Writestring

	mov appleeaten,0								
	mov direction,0  							
	mov olddirection,0
	mov NumOfNodes,0  							
	mov score,0
	mov score1,0
	mov speed,160

	checkspace:
	; Input handler
		call ReadChar
		.IF al==20h					;重新開始
			call main
		.ELSEIF al==1bh				;離開
			exit
		.ENDIF
		
		mov ecx , 2
		loop checkspace
	ret
	
died ENDP

main PROC
	call Clrscr
	call StartPage					;開始畫面
	checkspace:
		call ReadChar				;判斷按什麼鍵
		.IF al==20h
			call Game
		.ELSEIF al==44h || al==64h
			call Difficulty
		.ELSEIF al==1bh
			exit
		.ENDIF
		
		mov ecx , 2
		loop checkspace
	ret
main ENDP
END main