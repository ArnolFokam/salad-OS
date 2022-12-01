# this file import any configs and exports it to the sub-makefiles
# it also serves as bridge between the user command and the source code iteself

export

ROOTDIR != pwd

include $(shell find $(ROOTDIR)/configs -name '*.mk')

.PHONY: build-kernel
build-kernel:
	$(MAKE) -C $(ROOTDIR)/kernel/