# SSE-Fallout-4-Patcher

# What is this?
This Repo Will Host Tools/Custom Patches For Games I've Done.

# How Do I Use this?
For patches I post in plain text, you will need HxD and have a basic understanding of how to use a Hex Editor, for apps that automatic apply patches you will need to follow the instructions and have requirements.

# Can I Request A Custom Patch?
While I would love to be able to do this, I can't do custom patches.

# Will You Post The Source Code Of The Patches?
Yes.

# Can I Undo Any Of The Patches?
Yes, just replace the eboot.bin(or any other ELF that was patched) with the orginal.

# Patches:
<details><summary>Fallout 4 Custom PRX Patch(Patch To Load a User Created PRX)</summary>

![screenshot](https://cdn.discordapp.com/attachments/458451567658401802/864987083381932092/Screenshot_1.png)
# Soruce Code(ASM):

<details><summary>Show Code:</summary>
<p>

```asm
call    sceSystemServiceHideSplashScreen
mov     eax, 1E38634h ; 1E38634h => memory adress to the custom prx prx path(/app0/prx.prx)
lea     edi, [eax]
mov     esi, 0
mov     edx, 0
mov     ecx, 0
mov     eax, 0
call    sceKernelLoadStartModule
retn
```

</p>
</details>

Automatic: use SSE-Fallout-4-Patcher-F4PRX.exe.
<details><summary>Manual:</summary>
<p>

<details><summary>0x9A1385</summary>
<p>
Orginal Bytes: 0x9F, 0x7C, 0x2A, 0x01

Replace With: 0x47, 0x69, 0xE2, 0x00
</p>
</details>

<details><summary>0x17C7CD0</summary>
<p>
Orginal Bytes: 0xC3, 0x66, 0x66, 0x66, 0x66, 0x66, 0x66, 0x2E, 0x0F, 0x1F, 0x84, 0x00, 0x00, 0x00

Replace With: 0xE8, 0x53, 0x13, 0x48, 0x00, 0xB8, 0x34, 0x86, 0xE3, 0x01, 0x67, 0x8D, 0x38, 0xBE
</p>
</details>

<details><summary>0x17C7CE0</summary>
<p>
Orginal Bytes: 0xC3, 0x66, 0x66, 0x66, 0x66, 0x66, 0x66, 0x2E, 0x0F, 0x1F, 0x84

Replace With: 0x00, 0x00, 0xBA, 0x00, 0x00, 0x00, 0x00, 0xB9, 0x00, 0x00, 0x00
</p>
</details>

<details><summary>0x17C7CEC</summary>
Orginal Byes: 0x00

Replace With: 0xB8
</p>
</details>

<details><summary>0x17C7CF0</summary>
  
Orginal Bytes: 0xC3, 0x66, 0x66, 0x66, 0x66, 0x66, 0x66, 0x2E, 0x0F, 0x1F, 0x84, 0x00, 0x00, 0x00, 0x00, 0x00

Replace With: 0x00, 0xE8, 0x82, 0x25, 0x48, 0x00, 0xC3, 0x90, 0x90, 0x00, 0x90, 0x90, 0x90, 0x90, 0x90, 0x90

</p>
</details>
