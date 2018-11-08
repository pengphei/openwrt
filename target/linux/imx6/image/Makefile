#
# Copyright (C) 2013 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
include $(TOPDIR)/rules.mk
include $(INCLUDE_DIR)/image.mk

#################################################
# Images
#################################################

DEVICE_VARS += MKUBIFS_OPTS BOOT_SCRIPT

define Build/boot-overlay
	rm -rf $@.boot
	mkdir -p $@.boot

	$(CP) $@ $@.boot/uImage
	ln -sf uImage $@.boot/uImage

	$(foreach dts,$(DEVICE_DTS), \
		$(CP) \
			$(DTS_DIR)/$(dts).dtb \
			$@.boot/$(dts).dtb; \
		ln -sf \
			$(dts).dtb \
			$@.boot/$(dts).dtb; \
	)
	mkimage -A arm -O linux -T script -C none -a 0 -e 0 \
		-n '$(DEVICE_ID) OpenWrt bootscript' \
		-d ./$(BOOT_SCRIPT) \
		$@.boot/6x_bootscript-$(BOOT_SCRIPT)

	$(STAGING_DIR_HOST)/bin/mkfs.ubifs \
		--space-fixup --compr=zlib --squash-uids \
		$(MKUBIFS_OPTS) \
		-o $@.boot.ubifs -d $@.boot

	$(TAR) -C $@.boot -cf $@.boot.tar .
endef

define Build/bootfs.tar.gz
	rm -rf $@.boot
	mkdir -p $@.boot

	$(TAR) -C $@.boot -xf $(IMAGE_KERNEL).boot.tar
	$(TAR) -C $@.boot \
		--numeric-owner --owner=0 --group=0 --transform "s,./,./boot/," \
		-czvf $@ .
endef

define Build/install-dtb
	$(foreach dts,$(DEVICE_DTS), \
		$(CP) \
			$(KDIR)/image-$(dts).dtb \
			$(BIN_DIR)/$(dts).dtb; \
	)
endef

#################################################
# Devices
#################################################

KERNEL_LOADADDR=0x10008000

define Device/Default
  PROFILES = Default 
  DEVICE_VARS := $$(DTS)
  FILESYSTEMS := squashfs ext4
  KERNEL_INSTALL := 1
  KERNEL_NAME := zImage
  KERNEL_DEPENDS = $$(wildcard ../dts/$$(DTS).dts)
  KERNEL := kernel-bin | uImage none
  DEVICE_DTS_DIR := ../dts
  IMAGES := 
  BOOT_SCRIPT := bootscript-ventana
endef

include imx6ul.mk
include imx6dl.mk
include imx6q.mk

$(eval $(call BuildImage))
