#
# SPDX-FileCopyrightText: The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#

DEVICE_PATH := device/sdmc/tifa

## Bootloader
TARGET_BOOTLOADER_BOARD_NAME := oppen

## DTB
BOARD_KERNEL_SEPARATED_DTBO := true
TARGET_DTB_NAME := dv9135_s4_s905y4_ap222_drm
TARGET_DTBO_NAME := android_overlay_dt

## Kernel
TARGET_KERNEL_PLATFORM_TARGET := tifa
TARGET_KERNEL_SOURCE := vendor/sdmc/tifa-build

## Kernel modules
BOOT_KERNEL_MODULES := $(strip $(shell cat $(DEVICE_PATH)/vendor_boot.modules.load))

BOARD_VENDOR_KERNEL_MODULES_LOAD := $(strip $(shell cat $(DEVICE_PATH)/vendor_dlkm.modules.load))
BOARD_VENDOR_RAMDISK_KERNEL_MODULES_LOAD := $(BOOT_KERNEL_MODULES)

## Partitions
BOARD_SUPER_PARTITION_SIZE := 1887436800

## Properties
TARGET_VENDOR_PROP += $(DEVICE_PATH)/vendor.prop

## Wi-Fi
BOARD_HOSTAPD_DRIVER := NL80211
BOARD_WPA_SUPPLICANT_DRIVER := NL80211
WIFI_DRIVER_SOCKET_IFACE := wlan0
WPA_SUPPLICANT_VERSION := VER_0_8_X

## Include the common tree BoardConfig makefile
include device/amlogic/ne-common/BoardConfigCommon.mk

## Include the proprietary BoardConfig makefile
include vendor/sdmc/tifa/BoardConfigVendor.mk
