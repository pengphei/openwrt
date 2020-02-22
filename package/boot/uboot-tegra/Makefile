#
# Copyright (C) 2013-2020 OpenWrt.org
# Copyright (C) 2020 Han Pengfei
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk
include $(INCLUDE_DIR)/kernel.mk

PKG_VERSION:=2020.01

PKG_HASH:=aa453c603208b1b27bd03525775a7f79b443adec577fdc6e8f06974025a135f1

PKG_MAINTAINER:=Han Pengfei <pengphei@qq.com>

include $(INCLUDE_DIR)/u-boot.mk
include $(INCLUDE_DIR)/package.mk

define U-Boot/Default
  BUILD_TARGET:=tegra
  UENV:=default
  HIDDEN:=1
endef

define U-Boot/trimslice
  BUILD_SUBTARGET:=cortexa9
  NAME:=CompuLab TrimSlice
  BUILD_DEVICES:=tegra20-trimslice
  UBOOT_IMAGE:=trimslice-mmc.img trimslice-spi.img
  SOC:=tegra20
  VENDOR:=compulab
endef

define U-Boot/jetson-tk1
  BUILD_SUBTARGET:=cortexa15
  NAME:=Jetson TK1
  BUILD_DEVICES:=tegra124-jetson-tk1
  UBOOT_IMAGE:=jetson-tk1-emmc.img
  SOC:=tegra124
  VENDOR:=nvidia
endef

define U-Boot/dalmore-t40s-1600
  BUILD_SUBTARGET:=cortexa15
  NAME:=Nvidia Dalmore
  BUILD_DEVICES:=tegra114-dalmore-t40s-1600
  UBOOT_IMAGE:=dalmore-t40s-1600.img
  SOC:=tegra114
  VENDOR:=nvidia
endef

define U-Boot/dalmore-t40s-1866
  BUILD_SUBTARGET:=cortexa15
  NAME:=Nvidia Dalmore
  BUILD_DEVICES:=tegra114-dalmore-t40s-1866
  UBOOT_IMAGE:=dalmore-t40s-1866.img
  SOC:=tegra114
  VENDOR:=nvidia
endef

define U-Boot/dalmore-t40x-1866
  BUILD_SUBTARGET:=cortexa15
  NAME:=Nvidia Dalmore
  BUILD_DEVICES:=tegra114-dalmore-t40s-1600
  UBOOT_IMAGE:=dalmore-t40x-1866.img
  SOC:=tegra114
  VENDOR:=nvidia
endef

UBOOT_TARGETS := \
	trimslice \
	jetson-tk1 \
	dalmore-t40s-1600 \
	dalmore-t40s-1866 \
	dalmore-t40x-1866

define Build/bct-image
	$(CP) $(PKG_BUILD_DIR)/u-boot-dtb-tegra.bin $(PKG_BUILD_DIR)/u-boot.bin
	$(foreach bct,$(basename $(UBOOT_IMAGE)), \
		cd $(PKG_BUILD_DIR); \
		cbootimage -s $(SOC) -gbct \
			$(STAGING_DIR_HOST)/share/cbootimage-configs/$(SOC)/$(VENDOR)/$(VARIANT)/$(bct).bct.cfg \
			$(bct).bct; \
		cbootimage -s $(SOC) \
			$(STAGING_DIR_HOST)/share/cbootimage-configs/$(SOC)/$(VENDOR)/$(VARIANT)/$(bct).img.cfg \
			$(PKG_BUILD_DIR)/$(bct).img; \
		rm -f $(bct).bct; \
	)
endef

define Build/Configure
	sed '/select BINMAN/d' -i $(PKG_BUILD_DIR)/arch/arm/mach-tegra/Kconfig
	$(call Build/Configure/U-Boot)
endef

define Build/Compile
	$(call Build/Compile/U-Boot)
	$(call Build/bct-image)
endef

define Build/InstallDev
	$(INSTALL_DIR) $(STAGING_DIR_IMAGE)
	$(foreach img,$(UBOOT_IMAGE), \
		$(CP) $(PKG_BUILD_DIR)/$(img) $(STAGING_DIR_IMAGE)/;)
endef

$(eval $(call BuildPackage/U-Boot))
