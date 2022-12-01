# this file import any configs and exports it to the sub-makefiles
# it also serves as bridge between the user command and the source code iteself

export

ROOTDIR != pwd
ARCH=i386
VERSION=0.0.1
CP=cp
BASH=bash
MKDIR=mkdir -p
ECHO=echo

include $(shell find $(ROOTDIR)/configs -name '*.mk')

GRUB_MKRESCUE = $(shell command -v grub2-mkrescue 2> /dev/null)
ifeq ($(GRUB_MKRESCUE),)
GRUB_MKRESCUE = grub-mkrescue
endif

DESTDIR = $(ROOTDIR)/sysroot

.PHONY: build-kernel
build-kernel:
	@$(MAKE) -C $(ROOTDIR)/kernel/

.PHONY: iso/kernel.elf.gz
iso/kernel.elf.gz: build-kernel
	$(BASH) -c "if [[ ! -e iso ]]; then mkdir iso; fi"
	$(CP) kernel/arch/$(ARCH)/kernel-$(VERSION).$(ARCH) iso/kernel.elf
	gzip -f iso/kernel.elf

salados.i386.iso: iso/kernel.elf.gz
	$(GRUB_MKRESCUE) -d /usr/lib/grub/i386-pc/ -o salados.i386.iso iso/