export

PDIR := $(SRCDIR)/kernel

#
# Add include pathes to CFLAGS & ASFLAGS
#

CXXFLAGS += \
	-I. \
	-I$(PDIR)/arch/$(ARCH_DIR)/platform/$(PLATFORM_DIR)/include \
	-I$(PDIR)/arch/$(ARCH_DIR)/include \
	-I$(PDIR)/include \
	-I$(PDIR)

dirs-y = core/

all: $(dirs-y)

# run every make file from $(dirs-y). Eg. core/ -> core/Makefile
.PHONY: $(dirs-y)
$(dirs-y): $(patsubst %/,%/Makefile, $(dirs-y))
	@$(MAKE) -C $@ $(param)

.PHONY: install
install: all
	@$(MKDIR) -p $(DESTDIR)/boot
	@$(CP) arch/$(ARCH)/kernel-$(VERSION).$(ARCH) $(DESTDIR)/boot/kernel

# clean depends on $(dirs-y) and param=clean is passed
.PHONY: clean
clean: param = clean
clean: $(dirs-y)