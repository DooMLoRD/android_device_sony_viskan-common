# Copyright (C) 2013 The CyanogenMod Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# inherit from Sony common
-include device/sony/common/BoardConfigCommon.mk

# inherit from qcom-common
-include device/sony/qcom-common/BoardConfigCommon.mk

TARGET_SPECIFIC_HEADER_PATH := device/sony/viskan-common/include

# Kernel properties
TARGET_KERNEL_SOURCE := kernel/sony/viskan

# Platform
TARGET_BOOTLOADER_BOARD_NAME := MSM8960
TARGET_BOARD_PLATFORM := msm8960
BOARD_VENDOR_PLATFORM := viskan

# Architecture
TARGET_ARCH_VARIANT_CPU := cortex-a9

# Flags
TARGET_GLOBAL_CFLAGS += -mfpu=neon-vfpv4 -mfloat-abi=softfp
TARGET_GLOBAL_CPPFLAGS += -mfpu=neon-vfpv4 -mfloat-abi=softfp
COMMON_GLOBAL_CFLAGS += -D__ARM_USE_PLD -D__ARM_CACHE_LINE_SIZE=64

# Krait optimizations
TARGET_USE_KRAIT_BIONIC_OPTIMIZATION := true
TARGET_USE_KRAIT_PLD_SET      := true
TARGET_KRAIT_BIONIC_PLDOFFS   := 10
TARGET_KRAIT_BIONIC_PLDTHRESH := 10
TARGET_KRAIT_BIONIC_BBTHRESH  := 64
TARGET_KRAIT_BIONIC_PLDSIZE   := 64

# Kernel information
BOARD_KERNEL_BASE     := 0x80200000
BOARD_KERNEL_PAGESIZE := 2048
SONY_FORCE_RAMDISK_ADDRESS := 0x81600000
BOARD_KERNEL_CMDLINE  := androidboot.hardware=qcom user_debug=31 androidboot.baseband=msm msm_rtb.filter=0x3F ehci-hcd.park=3 vmalloc=400M
BOARD_MKBOOTIMG_ARGS  := --ramdisk_offset 0x01500000

# Wifi
BOARD_HAS_QCOM_WLAN              := true
BOARD_WLAN_DEVICE                := qcwcn
WPA_SUPPLICANT_VERSION           := VER_0_8_X
BOARD_WPA_SUPPLICANT_DRIVER      := NL80211
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_$(BOARD_WLAN_DEVICE)
BOARD_HOSTAPD_DRIVER             := NL80211
BOARD_HOSTAPD_PRIVATE_LIB        := lib_driver_cmd_$(BOARD_WLAN_DEVICE)
WIFI_DRIVER_MODULE_PATH          := "/system/lib/modules/wlan.ko"
WIFI_DRIVER_MODULE_NAME          := "wlan"
WIFI_DRIVER_FW_PATH_STA          := "sta"
WIFI_DRIVER_FW_PATH_AP           := "ap"

TARGET_PROVIDES_LIBLIGHT := true

# GPS
BOARD_VENDOR_QCOM_GPS_LOC_API_HARDWARE := $(TARGET_BOARD_PLATFORM)
TARGET_NO_RPC := true

# Bluetooth
BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_QCOM := true
BLUETOOTH_HCI_USE_MCT := true

# Vold
TARGET_USE_CUSTOM_LUN_FILE_PATH := /sys/devices/platform/msm_hsusb/gadget/lun%d/file

# Custom boot
#TARGET_RECOVERY_PIXEL_FORMAT := "RGBX_8888"
BOARD_CUSTOM_BOOTIMG_MK := device/sony/viskan-common/custombootimg.mk
TARGET_RELEASETOOLS_EXTENSIONS := device/sony/viskan-common
#BOARD_CUSTOM_GRAPHICS := ../../../device/sony/viskan-common/recovery/graphics.c
#BOARD_USE_CUSTOM_RECOVERY_FONT := \"roboto_15x24.h\"

BOARD_FLASH_BLOCK_SIZE := 131072
BOARD_HAS_NO_SELECT_BUTTON := true
TARGET_USERIMAGES_USE_EXT4 := true

# Audio
BOARD_USES_ALSA_AUDIO := true
TARGET_USES_QCOM_MM_AUDIO := true
BOARD_AUDIO_CAF_LEGACY_INPUT_BUFFERSIZE := true

# FM radio
BOARD_USES_STE_FMRADIO := true
COMMON_GLOBAL_CFLAGS += -DSTE_FM

# Sensors
SOMC_CFG_SENSORS := true
SOMC_CFG_SENSORS_LIGHT_LM3533 := yes
SOMC_CFG_SENSORS_GYRO_MPU3050 := yes
SOMC_CFG_SENSORS_PROXIMITY_APDS9702 := yes
SOMC_CFG_SENSORS_ACCEL_BMA250NA_INPUT := yes
SOMC_CFG_SENSORS_COMPASS_AK8963 := yes

#TWRP flags
DEVICE_RESOLUTION := 720x1280
RECOVERY_GRAPHICS_USE_LINELENGTH := true
RECOVERY_SDCARD_ON_DATA := true
TW_HAS_NO_RECOVERY_PARTITION := true
TW_FLASH_FROM_STORAGE := true
TW_EXTERNAL_STORAGE_PATH := "/external_sd"
TW_EXTERNAL_STORAGE_MOUNT_POINT := "external_sd"
TW_DEFAULT_EXTERNAL_STORAGE := true
#TW_INCLUDE_CRYPTO := true
TW_INCLUDE_JB_CRYPTO := true
TW_CRYPTO_FS_TYPE := "ext4"
TW_CRYPTO_REAL_BLKDEV := "/dev/block/platform/msm_sdcc.1/by-name/Userdata"
TW_CRYPTO_MNT_POINT := "/data"
TW_CRYPTO_FS_OPTIONS := "nosuid,nodev,barrier=1,noauto_da_alloc,discard"
TW_CRYPTO_FS_FLAGS := "0x00000406"
TW_CRYPTO_KEY_LOC := "footer"
TW_INCLUDE_FUSE_EXFAT := true
TW_BOARD_CUSTOM_GRAPHICS := ../../../device/sony/viskan-common/recovery/twrpgraphics.c
TW_BRIGHTNESS_PATH := /sys/devices/i2c-10/10-0040/leds/lcd-backlight1/brightness
TW_MAX_BRIGHTNESS := 255
TW_NO_USB_STORAGE := true
