#!/bin/bash

nasm -fbin boot.asm -o boot.bin
nasm -fbin kernel.asm -o kernel.bin
cat boot.bin kernel.bin > logos.img
qemu-system-i386 -drive format=raw,file=logos.img
