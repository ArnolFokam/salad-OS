include Build.mk

all: $(dirs) arch/

.PHONY: $(dirs)
$(dirs): $(patsubst %/, %/Makefile, $(dirs))
	@$(MAKE) -C $@ $(param)

.PHONY: arch/
arch/: $(dirs-y) arch/Makefile
	@$(MAKE) -C $@ $(param)

.PHONY: clean
clean: param = clean
clean: $(dirs) arch/