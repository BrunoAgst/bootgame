# This repository is for boot games

You need nasm to compile and qemu to run.

## NASM:
`nasm file.asm -f bin -o file.bin`
## QEMU:
`qemu-system-i386 -drive file=boot.bin,format=raw,index=0,if=floppy &`

I created a [tool](https://github.com/BrunoAgst/toolkit/tree/main/asm-compile) to automatically compile and run.
