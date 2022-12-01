include Build.mk

elf    += kernel-$(VERSION).$(ARCH)

kernel-$(VERSION).$(ARCH): builtin.o
	@$(LD) $(LDFLAGS) -T kernel.$(ARCH).ld -o $@

.PHONY: $(dirs-y)
$(dirs-y): $(patsubst %/,%/Makefile, $(dirs-y))
	@$(MAKE) -C $@ $(param)

%.o:%.c
	@$(CC) $(CFLAGS) -c $< -o $@


.PHONY: clean
clean: param = clean
clean: $(dirs-y)
	@$(RM) $(obj-y) $(elf) builtin.o