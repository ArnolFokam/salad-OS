export

SRCDIR != pwd
# build info
ARCH=i386
VERSION=0.0.1

# commands
CP=cp
BASH=bash
ECHO=echo

# check if the command 'grub2-mkrescue' is available
GRUB_MKRESCUE = $(shell command -v grub2-mkrescue 2> /dev/null)

# use 'grub-mkrescue' if 'grub2-mkrescue' is not available
ifeq ($(GRUB_MKRESCUE),)
GRUB_MKRESCUE = grub-mkrescue
endif

install-kernel:
	$(MAKE) -C $(SRCDIR)/kernel/ install

clean-kernel:
	$(MAKE) -C $(SRCDIR)/kernel/ clean

.PHONY: build-kernel clean-kernel install-kernel
build-kernel:
	$(MAKE) -C $(SRCDIR)/kernel/

iso/kernel.elf.gz: build-kernel
	$(BASH) -c "if [[ ! -e iso ]]; then mkdir iso; fi"
	$(CP) kernel/arch/$(ARCH)/kernel-$(VERSION).$(ARCH) iso/kernel.elf
	gzip -f iso/kernel.elf

iso/initrd.img.gz: build-initrd
	$(BASH) -c "if [[ ! -e iso ]]; then mkdir iso; fi"
	cp initrd/initrd.img iso/initrd.img
	gzip -f iso/initrd.img

iso32: iso/kernel.elf.gz iso/initrd.img.gz
	$(GRUB_MKRESCUE) -d /usr/lib/grub/i386-pc/ -o salados.iso iso/