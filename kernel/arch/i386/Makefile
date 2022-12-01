include Build.mk

elf    += kernel-$(VERSION).$(ARCH)

kernel-$(VERSION).$(ARCH): builtin.o
	@$(LD) $(LDFLAGS) -T kernel.$(ARCH).ld -o $@