TITLE Example of ASM                (asmExample.ASM)

; A snake game written in assembly using Kip Irvnine's Irvine32 assembly
; library.

INCLUDE Irvine32.inc
main EQU start@0
.DATA
	Snake1 BYTE " ________   ____  _____       ___       ___   ___   _______ ",0
	Snake2 BYTE "|   _____| |_   \|_   _|     / _ \     |   | /  /  |   ____|",0
	Snake3 BYTE "|  |_____    |   \ | |      / /_\ \    |   |/  /   |  |____ ",0
	Snake4 BYTE "|_____   |   | |\ \| |     /  ___  \   |       \   |   ____|",0
	Snake5 BYTE " _____|  |  _| |_\   |_   /  /   \  \  |   |\   \  |  |____ ",0
	Snake6 BYTE "|________| |_____|\____| /__/     \__\ |___| \___\ |_______|",0

	PressToStart1 BYTE ".-. .-. .-. .-. .-.   .-. .-. .-. .-. .-.   .-. .-.   .-. .-. .-. .-. .-. " ,0
	PressToStart2 BYTE "|-' |(  |-- `-. `-.   `-. |-' |-| |   |--    |  | |   `-.  |  |-| |(   |  " ,0
	PressToStart3 BYTE "'   ' ' `-' `-' `-'   `-' '   ` ' `-' `-'    '  `-'   `-'  '  ' ' ' '  '  " ,0

	GAMOVER1	BYTE "   _|_|_|    _|_|    _|      _|  _|_|_|_|        _|_|    _|      _|  _|_|_|_|  _|_|_|    " , 0
	GAMOVER2	BYTE " _|        _|    _|  _|_|  _|_|  _|            _|    _|  _|      _|  _|        _|    _|" , 0
	GAMOVER3	BYTE "_|  _|_|  _|_|_|_|  _|  _|  _|  _|_|_|        _|    _|  _|      _|  _|_|_|    _|_|_|    " , 0
	GAMOVER4 	BYTE "_|    _|  _|    _|  _|      _|  _|            _|    _|    _|  _|    _|        _|    _|  " , 0
	GAMOVER5	BYTE "  _|_|_|  _|    _|  _|      _|  _|_|_|_|        _|_|        _|      _|_|_|_|  _|    _|  " , 0

.CODE

;開始畫面(封面)
StartPage PROC
	mov  dl,27  ;column
    mov  dh,10  ;row
    call Gotoxy
	mov eax, white+(black*16)
    call SetTextColor
	mov edx, offset Snake1
	call Writestring

	mov  dl,27  ;column
    mov  dh,11  ;row
    call Gotoxy
	mov eax, white+(black*16)
    call SetTextColor
	mov edx, offset Snake2
	call Writestring
	
	mov  dl,27  ;column
    mov  dh,12  ;row
    call Gotoxy
	mov eax, white+(black*16)
    call SetTextColor
	mov edx, offset Snake3
	call Writestring

	mov  dl,27  ;column
    mov  dh,13  ;row
    call Gotoxy
	mov eax, white+(black*16)
    call SetTextColor
	mov edx, offset Snake4
	call Writestring

	mov  dl,27  ;column
    mov  dh,14  ;row
    call Gotoxy
	mov eax, white+(black*16)
    call SetTextColor
	mov edx, offset Snake5
	call Writestring

	mov  dl,27  ;column
    mov  dh,15  ;row
    call Gotoxy
	mov eax, white+(black*16)
    call SetTextColor
	mov edx, offset Snake6
	call Writestring

	mov  dl,20  ;column
    mov  dh,20  ;row
    call Gotoxy
	mov eax, white+(black*16)
    call SetTextColor
	mov edx, offset PressToStart1
	call Writestring

	mov  dl,20  ;column
    mov  dh,21  ;row
    call Gotoxy
	mov eax, white+(black*16)
    call SetTextColor
	mov edx, offset PressToStart2
	call Writestring

	mov  dl,20  ;column
    mov  dh,22  ;row
    call Gotoxy
	mov eax, white+(black*16)
    call SetTextColor
	mov edx, offset PressToStart3
	call Writestring
	
	ret
StartPage ENDP

;遊戲結束畫面
died PROC uses eax ebx edx 
	
call Clrscr ;清除畫面

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

	;mov eax, 3000 	; 延遲 3s
	;call delay
	;exit
	ret

died ENDP

main PROC
	call StartPage
	;call ReadChar
	
	mov eax, 3000 	; 延遲 3s
	call delay
	call died
	
main ENDP

END main