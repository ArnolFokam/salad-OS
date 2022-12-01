export

ROOTDIR != pwd

include $(shell find $(ROOTDIR)/configs -name '*.mk')

.PHONY: all
all:
	$(MAKE) -C src/