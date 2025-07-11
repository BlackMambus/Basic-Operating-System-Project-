#!/bin/bash
set -e

mkdir -p build/isofiles/boot/grub

# Compile kernel
i686-elf-g++ -ffreestanding -O2 -Wall -Wextra -c kernel/kernel.cpp -o build/kernel.o

# Link kernel
i686-elf-ld -T kernel/linker.ld -o build/kernel.bin build/kernel.o -nostdlib

# Copy files
cp build/kernel.bin build/isofiles/boot/
cp boot/grub/grub.cfg build/isofiles/boot/grub/

# Create ISO
grub-mkrescue -o build/myos.iso build/isofiles

echo "Build complete. Run with: qemu-system-i386 -cdrom build/myos.iso"
