all: builtin.o $(elf)

$(dirs): $(patsubst %/, %/Makefile, $(dirs))
	@$(MAKE) -C $@ $(param)

%.o: %.cpp
	$(CXX) - c $(CPPFLAGS) $(CXXFLAGS) $^ -o $@

%.o: %.s
	as $(ASFLAGS) -o $@ $<