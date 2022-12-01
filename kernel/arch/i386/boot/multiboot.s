.set MAGIC, 0x1badb002
.set FLAGS, (1<<0 | 1<<1)
.set CHECKSUM, -(MAGIC + FLAGS)

.section .multiboot
    .long MAGIC
    .long FLAGS
    .long CHECKSUM

.section .text
.extern main
.global loader

loader:
    cli                             # block interrupts
    mov $kernel_stack, %esp         # set stack pointer
    push %eax                       # get multiboot structure in the ax register
    push %ebx                       # get magic number in the bx register
    call main                       # call the kernel
    hlt                             # halt the CPU

.section .bss
.space 2*1024*1024                  # Use 2 MiB for our kernel stack
kernel_stack:
