/**
 * main entry of the kernel
 */

#include <core/printk.h>

int main(void* multiboot_structure, unsigned int magic_number){
    printk("Welcome to SalaOS");
    while(1);
    return 0;
}