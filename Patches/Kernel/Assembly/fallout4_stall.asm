; These addresses start at "/libexec/ld-elf" so when using HxD to manually apply them, add 0x4000 to the address
; (Location) :: (Function Name/Description) :: (Orginal function)

.text:0000000000000CC5 :: KPsleepGetPthread
call    sleep
call    pthread_self
retn

.text:0000000000003BD1 :: KPCallSleepPthread
mov     edi, 9
call    KPsleepGetPthread
retn
nop
nop
nop
nop

.text:000000000099B806 :: replaced call :: pthread_self 
KPCallSleepPthread
