$(dirs): $(patsubst %/,%/Makefile, $(dirs))
	@$(MAKE) -C $@ $(param)

%.o: %.cpp
	$(CXX) - c $(CPPFLAGS) $(CXXFLAGS) $^ -o $@