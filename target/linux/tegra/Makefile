#
# Copyright (C) 2019 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

ARCH:=arm
BOARD:=tegra
BOARDNAME:=NVIDIA Tegra
FEATURES:=audio boot-part display ext4 fpu gpio pci pcie rootfs-part rtc squashfs usb
SUBTARGETS:=cortexa9 cortexa15 cortexa57
MAINTAINER:=Han Pengfei <pengphei@qq.com>

KERNEL_PATCHVER:=4.14
KERNELNAME:=zImage dtbs

# Tegra 20: dual Cortex-A9
# Tegra 30: quad Cortex-A9
# Tegra 114: quad Cortex-A15
# Tegra 124: quad Cortex-A15
# Tegra 132: quad Cortex-A57
# Tegra 210: quad Cortex-A57

include $(INCLUDE_DIR)/target.mk

DEFAULT_PACKAGES += uboot-envtools
DEFAULT_PACKAGES += partx-utils mkf2fs e2fsprogs

$(eval $(call BuildTarget))
