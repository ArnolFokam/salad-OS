%.o: %.cpp
	$(CXX) - c $(CPPFLAGS) $(CXXFLAGS) $^ -o $@

%.o: %.s
	nams -f elf 