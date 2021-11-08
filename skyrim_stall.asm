; (Location) :: (Function Name)

.text:00000000016DE190 :: stallandsleep
mov edi, 9
call sceKernelSleep
retn

; Orginal code we ended up overwriting
.text:00000000016E9170 OG_nullsub_22 
lea     rbx, [aApp0]
mov     rdi, rbx
call    sub_F8C970
retn

.text:00000000006A16A6 :: callstall
call    stallandsleep

.text:00000000006A16AB :: callOG_nullsub_22
call    OG_nullsub_22

.text:00000000006A16B0 :: NOP_Allignment
nop/nop/nop/nop/nop
