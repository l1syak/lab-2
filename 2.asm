%include "io.inc"
section .text
global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
    ;write your code here
    xor eax, eax
    lea esi,[x] 
    lea edi,[y] 
    mov ecx, 8 
    mov dl,[esi]
    mov al,8  
next:
    cmp al,3
    jl ost2     
    mov ah,dl
    and ah,0x7 
    mov [edi],ah
    inc edi   
    shr dl,3 
    sub al,3  
    jmp cycle   
    
ost2:    ;здесь мы склеиваем 2 бита старого байта и 1 бит нового, удаляя последний бит нового байта   
    inc esi    
    cmp al,2
    jl ost1 
    mov ah,dl
    mov dl,[esi]
    and dl,0x1  
    shl dl,2  
    or ah,dl  
    mov [edi],ah 
    inc edi   
    mov dl,[esi] 
    shr dl,1
    mov al,7  
    jmp cycle  
ost1:   ;здесь мы склеиваем 1 бит старого байта и 2 бита нового, удаляя последние 2 бита нового байта 
    cmp al,1
    jl ost0    
    mov ah,dl
    mov dl,[esi]
    and dl,0x3 
    shl dl,1   
    or ah,dl  
    mov [edi],ah 
    inc edi   
    mov dl,[esi]
    shr dl,2  
    mov al,6   
    jmp cycle
ost0:   ;здесь мы переходим к новому байту, если не осталось бит в старом.
    mov dl,[esi]
    mov al,8 
    jmp next
cycle:
    loop next
    ret
     
    section .data
    x: DB 0x6f, 0x46, 0xc1
    y: DB 0,0,0,0,0,0,0,0   
    
    
    ;[7,  5,  1,  3,  4,  2,  0,   6]
    ;[111,101,001,011,100,010,000, 110]
    ;[111,101,100,110,001,010,000, 011] перевернули каждые 3 бита
    ; 1byte 11110110, 2 byte 01100010,3 byte 10000011
    ; 1byte 01101111, 2 byte 01000110,3 byte 11000001 перевернули каждый байт