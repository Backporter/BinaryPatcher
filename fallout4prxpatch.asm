; 7/16/2021; Initial Patch 
call    sceSystemServiceHideSplashScreen
mov     eax, 1E38634h
lea     edi, [eax]
mov     esi, 0
mov     edx, 0
mov     ecx, 0
mov     eax, 0
call    sceKernelLoadStartModule
ret


; 8/10/2021; 2nd Patch, better, and requires less bytes overall
call    sceSystemServiceHideSplashScreen
lea     edi, [0] ; replace 0 with a string
xor     esi, esi
xor     edx, edx
xor     ecx, ecx
xor     eax, eax
call    sceKernelLoadStartModule
ret
