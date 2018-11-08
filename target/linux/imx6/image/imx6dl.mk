#
# IMX6UL Profiles
#

ifeq ($(SUBTARGET),imx6dl)

define Device/ventana
  DEVICE_TITLE := Gateworks Ventana family (normal NAND flash)
  DEVICE_DTS:= \
	imx6dl-gw51xx \
	imx6dl-gw52xx \
	imx6dl-gw53xx \
	imx6dl-gw54xx \
	imx6dl-gw551x \
	imx6dl-gw552x \
	imx6dl-gw553x \
	imx6dl-gw5904 \
	imx6q-gw51xx \
	imx6q-gw52xx \
	imx6q-gw53xx \
	imx6q-gw54xx \
	imx6q-gw5400-a \
	imx6q-gw551x \
	imx6q-gw552x \
	imx6q-gw553x \
	imx6q-gw5904
  DEVICE_PACKAGES := kmod-sky2 kmod-sound-core kmod-sound-soc-imx kmod-sound-soc-imx-sgtl5000 \
	kmod-can kmod-can-flexcan kmod-can-raw \
	kmod-hwmon-gsc \
	kmod-leds-gpio kmod-pps-gpio \
	kobs-ng
  KERNEL += | boot-overlay
  IMAGES := nand.ubi bootfs.tar.gz
  UBINIZE_PARTS = boot=$$(KDIR_KERNEL_IMAGE).boot.ubifs=15
  IMAGE/nand.ubi := append-ubi
  IMAGE/bootfs.tar.gz := bootfs.tar.gz | install-dtb
  PAGESIZE := 2048
  BLOCKSIZE := 128k
  MKUBIFS_OPTS := -m $$(PAGESIZE) -e 124KiB -c 8124
endef
TARGET_DEVICES += ventana

define Device/ventana-large
  $(Device/ventana)
  DEVICE_NAME := ventana
  DEVICE_TITLE := Gateworks Ventana family (large NAND flash)
  IMAGES := nand.ubi
  PAGESIZE := 4096
  BLOCKSIZE := 256k
  MKUBIFS_OPTS := -m $$(PAGESIZE) -e 248KiB -c 8124
endef
TARGET_DEVICES += ventana-large

define Device/wandboard
  DEVICE_TITLE := Wandboard Dual
  DEVICE_DTS := imx6dl-wandboard
endef
TARGET_DEVICES += wandboard

endif