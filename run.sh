#!/bin/bash

./build.sh
qemu-system-x86_64 -drive format=raw,file="build/os.bin",index=0,if=floppy,  -m 128M