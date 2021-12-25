%include "io.inc"

section .text
global CMAIN 
CMAIN:
    mov ebp, esp    ;for correct debugging
    xor eax, eax
    lea  eax, [x]  
    add  eax, 1   
    lea  ebx, [x]
    add  ebx, 6  
top: 
    cmp eax, ebx
    jge exit      
    mov ecx, ebx   
left:
    mov esi, ecx    
    sub esi, 1   
    mov dl, [esi]
    cmp [ecx],dl  
    jge leftnext
    mov dh,[ecx]  
    mov [esi], dh
    mov [ecx], dl
leftnext:
    sub ecx, 1   
    cmp ecx, eax  
    jge left     
    add eax, 1  
    mov ecx, eax  
right:
    mov esi, ecx
    sub esi, 1   
    mov dl, [esi]
    cmp [ecx],dl  
    jge rightnext 
    mov dh,[ecx]  
    mov [esi], dh
    mov [ecx], dl
rightnext:
    add ecx, 1   
    cmp ecx, ebx   
    jle right     
    sub ebx,1    
    jmp top 
exit:      
    ret
section .data

x: db 10, 2,15 ,6 ,0 ,8 ,-6
    