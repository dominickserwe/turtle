#!/bin/bash

# compile bootloader
cd src/boot

nasm -f bin turtle.asm -o boot.bin
mv boot.bin ../../build

# compile kernel entry
nasm -f elf kernel_entry.asm -o kernel_entry.o
mv kernel_entry.o ../../build

# compile kernel
cd ../kernel

gcc -ffreestanding -c kernel.c -o kernel.o
mv kernel.o ../../build

cd ../../build
ld -o kernel.bin -Ttext 0x1000 kernel_entry.o kernel.o --oformat binary

# put it all together
cat boot.bin kernel.bin > os.bin