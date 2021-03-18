  .model small
  .stack 100h
  .const
  .data
    k dw 6   ; 三角形大小
    m db 'Hi', '$'  ; 填充字符
    blank db ' .', '$'
    ent db '  <|', 0ah, 0dh, '$'
  .code

print_blank proc
  mov ah, 9
  mov dx, offset blank
  int 21h
  ret
print_blank endp

print_m proc
  mov ah, 9
  mov dx, offset m
  int 21h
  ret
print_m endp

print_ent proc
  mov ah, 9
  mov dx, offset ent
  int 21h
  ret
print_ent endp

main proc
start:
  mov ax, DGROUP
  mov ds, ax

  mov cx, k
  tr1:
    ; 空格输出i次，#输出k-i次
    push cx
    tt1:
      push cx
      mov cx, 2
      tt2:
        call print_blank
        loop tt2
      pop cx
      loop tt1
    pop cx
    push cx
    mov dx, k
    inc dx
    sbb dx, cx
    mov cx, dx
    tr2:
      push cx
      mov cx, 4
      trr:
        call print_m
        loop trr
      pop cx
      loopnz tr2
    call print_ent
    pop cx
    loop tr1
  
  mov cx, k
  mtr1:
    ; 空格输出k-i次，#输出i次
    push cx
    mov dx, k
    inc dx
    sbb dx, cx
    mov cx, dx
    mtt1:
      push cx
      mov cx, 2
      mtt2:
        call print_blank
        loop mtt2
      pop cx
      loop mtt1
    pop cx
    push cx
    mtr2:
      push cx
      mov cx, 4
      mtrr:
        call print_m
        loop mtrr
      pop cx
      loopnz mtr2
    call print_ent
    pop cx
    
    loop mtr1


  ; te:
  ;   push cx
  ;   call print_m
  ;   pop cx
  ;   loop te

  mov ax, 4c00h
  int 21h
  end start
main endp
end