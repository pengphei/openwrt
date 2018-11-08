#
# Copyright (C) 2013 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

define Profile/Default
  NAME:=Default Profile (default)
  PRIORITY:=1
endef

define Profile/Default/Description
  Default set compatible with most Freescale i.MX 6 based boards.
endef

$(eval $(call Profile,Default))
