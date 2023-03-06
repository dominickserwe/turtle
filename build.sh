#!/bin/bash

# compile bootloader
cd src/boot
nasm -f bin turtle.asm -o boot.bin
mv boot.bin ../../build

# compile kernel
cd ../kernel
gcc -ffreestanding -c kernel.c -o kernel.o
mv kernel.o ../../build

cd ../../build
ld -o kernel.bin kernel.o -Ttext 0x1000 --oformat binary

cat boot.bin kernel.bin > os.bin