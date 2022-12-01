export

PDIR := $(SRCDIR)/kernel

dirs-y = core/ arch/

# run every make file from $(dirs-y). Eg. core/ -> core/Makefile
.PHONY: $(dirs-y)
$(dirs-y): $(patsubst %/,%/Makefile, $(dirs-y))
	@$(ECHO) "Making " kernel/$@
	@$(MAKE) -C $@ $(param)

# clean depends on $(dirs-y) and param=clean is passed
.PHONY: clean
clean: param = clean
clean: $(dirs-y)