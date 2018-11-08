#
# Copyright (C) 2013-2014 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
include $(TOPDIR)/rules.mk

ARCH:=arm
BOARD:=imx6
BOARDNAME:=Freescale i.MX 6
SUBTARGETS:=imx6ul imx6dl imx6q
FEATURES:=audio display fpu gpio pcie rtc usb usbgadget squashfs targz nand ubifs
MAINTAINER:=Luka Perkov <luka@openwrt.org>

KERNEL_PATCHVER:=4.14
KERNELNAME:=zImage dtbs

include $(INCLUDE_DIR)/target.mk

DEFAULT_PACKAGES += uboot-envtools
DEFAULT_PACKAGES += partx-utils mkf2fs e2fsprogs

$(eval $(call BuildTarget))
