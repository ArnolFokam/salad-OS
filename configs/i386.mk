PDIR := $(ROOTDIR)/kernel

AS=as

LDFLAGS += -melf_i386

ASFLAGS += --32 \
	-I. \
	-I$(PDIR)/include
	
CXXFLAGS += -m32 -fno-use-cxa-atexit -nostdlib \
	-fno-builtin -fno-rtti -fno-exceptions -fno-leading-underscore \
	-I. \
	-I$(PDIR)/include