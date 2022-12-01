include Build.mk

CWD != realpath --relative-to=$(SRCDIR) .

all: builtin.o $(elf)

builtin.o: $(obj-y) $(dirs-y)
	@$(LD) $(LDFLAGS) -r $(obj-y) $(patsubst %/,%/builtin.o, $(dirs-y)) -o builtin.o; 

.PHONY: $(dirs-y)
$(dirs-y): $(patsubst %/,%/Makefile, $(dirs-y))
	@$(MAKE) -C $@ $(param)

%.o:%.c
	@$(CC) $(CFLAGS) -c $< -o $@

.PHONY: clean
clean: param = clean
clean: $(dirs-y)
	@$(RM) $(obj-y) $(elf) builtin.o