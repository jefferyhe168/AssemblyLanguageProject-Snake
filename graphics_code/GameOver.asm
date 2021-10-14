TITLE Example of ASM                (asmExample.ASM)

; A snake game written in assembly using Kip Irvnine's Irvine32 assembly
; library.

INCLUDE Irvine32.inc
main EQU start@0

.DATA
GAMOVER1	BYTE "   _|_|_|    _|_|    _|      _|  _|_|_|_|        _|_|    _|      _|  _|_|_|_|  _|_|_|    " , 0
GAMOVER2	BYTE " _|        _|    _|  _|_|  _|_|  _|            _|    _|  _|      _|  _|        _|    _|" , 0
GAMOVER3	BYTE "_|  _|_|  _|_|_|_|  _|  _|  _|  _|_|_|        _|    _|  _|      _|  _|_|_|    _|_|_|    " , 0
GAMOVER4 	BYTE "_|    _|  _|    _|  _|      _|  _|            _|    _|    _|  _|    _|        _|    _|  " , 0
GAMOVER5	BYTE "  _|_|_|  _|    _|  _|      _|  _|_|_|_|        _|_|        _|      _|_|_|_|  _|    _|  " , 0
BCol BYTE 100					; 螢幕寬度
BRow BYTE 28					; 螢幕高度

.CODE
died PROC uses eax ebx ecx edx 
	
call Clrscr ;清除畫面

;畫框線
movzx ecx, BRow
		Loop2:
		mov ebx, ecx
		push ecx

		movzx ecx, BCol
		Loop1:
			.IF ecx == 1
				mov al, ' '
			.ELSEIF ebx == 1
				mov al, '-'
			.ELSE
				mov al, ' '
			.ENDIF
			
			call WriteChar
			mov eax, white+(black*16)
    		call SetTextColor
			
		LOOP Loop1

		call Crlf
		pop ecx
	LOOP Loop2

	;顯示gameover
	mov  dl,5  ;column
    mov  dh,12  ;row
    call Gotoxy
	mov eax, white+(black*16)
    call SetTextColor
	mov edx, offset GAMOVER1
	call Writestring
	
	mov  dl,5  ;column
    mov  dh,13  ;row
    call Gotoxy
	mov eax, white+(black*16)
    call SetTextColor
	mov edx, offset GAMOVER2
	call Writestring

	mov  dl,5  ;column
    mov  dh,14  ;row
    call Gotoxy
	mov eax, white+(black*16)
    call SetTextColor
	mov edx, offset GAMOVER3
	call Writestring

	mov  dl,5  ;column
    mov  dh,15  ;row
    call Gotoxy
	mov eax, white+(black*16)
    call SetTextColor
	mov edx, offset GAMOVER4
	call Writestring

	mov  dl,5  ;column
    mov  dh,16  ;row
    call Gotoxy
	mov eax, white+(black*16)
    call SetTextColor
	mov edx, offset GAMOVER5
	call Writestring

	mov eax, 3000 	; 延遲 3s
	call delay
	exit
	ret

died ENDP

main PROC
	call died
	call ReadChar
	;call WaitMsg
main ENDP

END main