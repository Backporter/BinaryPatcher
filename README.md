# BinaryPatcher

# What is this?
This Repo Will Host Tools/Custom Patches For Games I've Done alongside my tool knwon as BinaryPatcher

## Can i add my own patches?
Yes!, use the example json format provided in json-format.json and put your patches inside `jsons` folder and my tool will scan for all patches on start

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

# Notes: 
* This does use Address based patching, so if you do not have the proper game update and or version of the game as shown below, it likely won't work


# Requirements: 
* CUSA: CUSA02557
* Version: 1.22

![screenshot](https://cdn.discordapp.com/attachments/458451567658401802/864987083381932092/Screenshot_1.png)

[![Example of would you could do:]()](https://www.youtube.com/watch?v=k_HV1eiYf7k)
	
# Soruce Code(ASM):

<details><summary>Show Code:</summary>
<p>

```asm
call    sceSystemServiceHideSplashScreen
mov     eax, 1E38634h ; 1E38634h => memory adress to the custom PRX path(/app0/prx.prx)
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
  
---------------------------------------------------------------------

<details><summary>Manual(Hex Editing):</summary>
<p>

**go to these addresses in a Hex(like HxD) Editor and replace the Orginal Bytes with the Replace With ones:**

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

</p>
</details>

---------------------------------------------------------------------

<details><summary><h1>Coding a PRX for this: </h1></summary>
<br>

**First thing, make sure you have module_start and module_stop inside you're PRX, should looks somthing like this:**
```cpp
extern "C" int module_start(size_t argc, const void* argv)
{
}

extern "C" int module_stop(size_t argc, const void* argv)
{
}
```

**Once Done, stick the code inside module_start that way it gets executed, like so:**
```cpp
#include <stdio.h>
#include <string>
#include <pthread.h>
#include "Notify.h" // this can be found in my fork of OSM's PS4-Notify repo aka https://github.com/Backporter/PS4-Notify/blob/main/Notify.h

void *keep(void*n) {
	int64_t runtime = 0;
	while (true) {
		Notify("Still Running");
		runtime++;
		sceKernelSleep(60);
	}
}
  
extern "C" int module_start(size_t argc, const void* argv)
{
	ScePthread thread;
	scePthreadCreate(&thread, NULL, keep, NULL, "injection thread");
	Notify("Test! {loaded code via prx} {module_start}");
	return 0;
}

extern "C" int module_stop(size_t argc, const void* argv)
{
}
```
Notes(I could very well be wrong on these, so do not take them as 100% fact): 

Now, First thing to note is the fact that in the example above, my code, its running on a seperate thread, and not the main thread, so all functions need to be thread-safe, if you want to use non-thread safe functions they would be required to be ran directly inside module_start(this means they must be able to be ran at run time).
  
</details>
