; (Location) :: (Function Name)
; .text:000000000019BF40 :: PRX
lea     edi, aApp0EbootBin ; "/app0/eboot.bin"
mov     esi, 0
mov     edx, 0
mov     ecx, 0
xor     eax, eax
call    sceKernelLoadStartModule
xor     eax, eax
retn


; .text:00000000008B6D50 :: LoadModule
call    sceKernelLoadStartModule
lea     rdi, [eax]
call    PRX
lea     eax, [rdi]
retn
