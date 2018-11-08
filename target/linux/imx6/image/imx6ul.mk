#
# IMX6UL Profiles
#

ifeq ($(SUBTARGET),imx6ul)

define Device/EPC-A6G2C
  DEVICE_TITLE := ZLG EPC A6G2C
  DEVICE_DTS := a6g2c-base-128m
  DEVICE_PACKAGES := kmod-sound-core kmod-sound-soc-imx \
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
  MKUBIFS_OPTS := -m $$(PAGESIZE) -e 124KiB -c 540
  BOOT_SCRIPT := bootscript-a6g2c
endef
TARGET_DEVICES += EPC-A6G2C

define Device/EPC-A6G2C-128M
  $(Device/EPC-A6G2C)
  DEVICE_TITLE := ZLG A6G2C 128M
  DEVICE_DTS := a6g2c-base-128m
endef
TARGET_DEVICES += EPC-A6G2C-128M

define Device/EPC-A6G2C-256M
  $(Device/EPC-A6G2C)
  DEVICE_TITLE := ZLG A6G2C 256M
  DEVICE_DTS := a6g2c-base-256m
endef
TARGET_DEVICES += EPC-A6G2C-256M


endif