include Build.mk

CWD != realpath --relative-to=$(ROOTDIR) .

all: builtin.o $(elf)

builtin.o: $(objs) $(dirs)
	$(LD) $(LDFLAGS) -r $(objs) $(patsubst %/, %/builtin.o, $(dirs)) -o builtin.o; 

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