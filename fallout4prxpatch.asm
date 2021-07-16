call    sceSystemServiceHideSplashScreen
mov     eax, 1E38634h
lea     edi, [eax]
mov     esi, 0
mov     edx, 0
mov     ecx, 0
mov     eax, 0
call    sceKernelLoadStartModule
retn
