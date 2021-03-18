  .model small
  .stack 100h
  .const
  .data
    message db 'Hello World!', '$'
    input db 'Please press a key: ', '$'
    output db 'You pressed key: ', '$'
    pau db 'Press any key to exit.', '$'
    newline db 0ah, 0dh, '$'
    ent db 0dh, '$'
  .code
start:
  mov ax, DGROUP
  mov ds, ax

  mov ah, 9
  mov dx, offset message
  int 21h

  mov ah, 9
  mov dx, offset newline
  int 21h

  mov ah, 9
  mov dx, offset input
  int 21h

  mov ah, 1
  int 21h

  mov ah, 9
  mov dx, offset newline
  int 21h

  mov ah, 9
  mov dx, offset output
  int 21h

  mov dl, al
  mov ah, 2
  int 21h

  mov ah, 9
  mov dx, offset newline
  int 21h

  mov ah, 9
  mov dx, offset pau
  int 21h
  mov ah, 1
  int 21h

  mov ah, 9
  mov dx, offset newline
  int 21h

  mov ax, 4c00h
  int 21h
  end start

end