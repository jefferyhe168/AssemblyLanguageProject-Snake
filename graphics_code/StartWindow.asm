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

.CODE
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

main PROC
	call StartPage
	call ReadChar
main ENDP

END main