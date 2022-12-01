include Build.mk

CWD != realpath --relative-to=$(SRCDIR) .

all: builtin.o

builtin.o: $(obj-y)
	@$(LD) $(LDFLAGS) -r $(obj-y) -o builtin.o;

%.o:%.cpp
	@$(CXX) $(CXXFLAGS) -c $< -o $@

.PHONY: clean
clean:
	@$(RM) $(obj-y) builtin.o