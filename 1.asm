%include "io.inc"

section .text
global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
    ;write your code here
    xor eax, eax
    mov  ecx,5 
    mov  eax,0      
    lea  ebx, [x]
comp: 
    mov dl, [ebx]
    cmp dl, 0
    jge  next 
    inc  eax 
 next:
   inc  ebx
   loop comp  
   ret
    
section .data
x:  DB 2, -3, 4, -5, 0
    
