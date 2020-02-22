#
# Copyright (C) 2017-2019 Tomasz Maciej Nowak <tomek_n@o2.pl>
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
ifeq ($(SUBTARGET),cortexa15)

define Device/tegra124-jetson-tk1
  DEVICE_TITLE:=NVIDIA Jetson TK1
  SUPPORTED_DEVICES:=nvidia,tegra124-jetson-tk1
  DEVICE_DTS:=tegra124-jetson-tk1
  UBOOT:=jetson-tk1-emmc
endef

TARGET_DEVICES += tegra124-jetson-tk1

define Device/tegra114-dalmore-t40s-1600
  DEVICE_TITLE:=NVIDIA Dalmore
  SUPPORTED_DEVICES:=dalmore,tegra114-dalmore
  DEVICE_DTS:=tegra114-dalmore
  UBOOT:=dalmore-t40s-1600
endef

TARGET_DEVICES += tegra114-dalmore-t40s-1600

endif
