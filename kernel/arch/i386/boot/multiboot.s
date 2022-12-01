.section .text
.extern main
.globel loader

loader:
    mov $kernel_stack, %esp

.section .bss

kernel_stack: