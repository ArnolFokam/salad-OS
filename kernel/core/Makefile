include Build.mk

CWD != realpath --relative-to=$(SRCDIR) .

all: builtin.o

builtin.o: $(objs) $(dirs)
	@$(LD) $(LDFLAGS) -r $(objs) $(patsubst %/, %/builtin.o, $(dirs)) -o builtin.o; 

$(dirs): $(patsubst %/, %/Makefile, $(dirs))
	$(MAKE) -C $@ $(param)

%.o: %.cpp
	$(CXX) - c $(CPPFLAGS) $(CXXFLAGS) $^ -o $@

%.o: %.s
	as $(ASFLAGS) -o $@ $<