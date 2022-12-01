include Build.mk

CWD != realpath --relative-to=$(ROOTDIR) .

all: $(dirs)

.PHONY: $(dirs)
$(dirs): $(patsubst %/, %/Makefile, $(dirs))
	$(MAKE) -C $@ $(param)

%.o: %.cpp
	$(CXX) -c $(CPPFLAGS) $(CXXFLAGS) $^ -o $@

%.o: %.s
	$(AS) $(ASFLAGS) -o $@ $<

.PHONY: clean
clean: param = clean
clean: $(dirs)
	@$(RM) $(objs) $(elf) builtin.o