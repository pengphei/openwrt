#
# Copyright (C) 2017-2019 Tomasz Maciej Nowak <tomek_n@o2.pl>
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
ifeq ($(SUBTARGET),cortexa9)

define Device/tegra20-trimslice
  DEVICE_TITLE := CompuLab TrimSlice
  SUPPORTED_DEVICES:=compulab,tegra20-trimslice
  DEVICE_PACKAGES := kmod-r8169 kmod-rt2800-usb kmod-rtc-em3027 \
	kmod-usb-storage wpad-mini
  DEVICE_DTS := tegra20-trimslice
  UBOOT := trimslice-mmc
endef
TARGET_DEVICES += tegra20-trimslice

endif
