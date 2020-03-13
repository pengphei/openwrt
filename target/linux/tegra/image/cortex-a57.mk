#
# Copyright (C) 2017-2019 Tomasz Maciej Nowak <tomek_n@o2.pl>
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
ifeq ($(SUBTARGET),cortexa57)

define Device/tegra210-p2571
  DEVICE_TITLE:=NVIDIA Tegra210 P2571 (Ref)
  SUPPORTED_DEVICES:=nvidia,tegra210-p2571
  KERNEL_NAME := Image
  KERNEL := kernel-bin
  DEVICE_DTS:=nvidia/tegra210-p2571
endef

TARGET_DEVICES += tegra210-p2571

define Device/tegra210-jetson-nano
  DEVICE_TITLE:=NVIDIA Jetson Nano
  SUPPORTED_DEVICES:=nvidia,jetson-nano
  KERNEL_NAME := Image
  KERNEL := kernel-bin
  DEVICE_DTS:=nvidia/tegra210-p3450-0000
endef

TARGET_DEVICES += tegra210-jetson-nano

endif
