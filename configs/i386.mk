PDIR := $(ROOTDIR)/kernel

AS=as

LDFLAGS = -melf_i386

ASFLAGS += --32 \
	-I. \
	-I$(PDIR)/include

CXXFLAGS += -m32 \
	-I. \
	-I$(PDIR)/include