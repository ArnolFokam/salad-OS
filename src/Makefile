include Build.mk

all: $(dirs)

$(dirs): $(patsubst %/, %/Makefile, $(dirs))
	@$(MAKE) -C $@ $(param)

%.o: %.cpp
	$(CXX) - c $(CPPFLAGS) $(CXXFLAGS) $^ -o $@

%.o: %.s
	as $(ASPARAMS) -o $@ $<