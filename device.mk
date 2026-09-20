#
# SPDX-FileCopyrightText: The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#

## Bluetooth
BOARD_HAVE_BLUETOOTH_RTK_TV := true
include hardware/realtek/rtkbt/rtkbt.mk

PRODUCT_PACKAGES += \
    BluetoothOverlayTarget

## Init
PRODUCT_PACKAGES += \
    init.amlogic.wifi_buildin.rc

## Keylayout (IR)
PRODUCT_PACKAGES += \
    Vendor_005d_Product_0001.kl

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/keylayout/Vendor_0001_Product_0001.kl:$(TARGET_COPY_OUT_VENDOR)/usr/keylayout/Vendor_0001_Product_0001.kl

## Netflix
PRODUCT_PACKAGES += \
    NetflixConfig \
    NetflixConfigOverlayTarget

## Platform
TARGET_AMLOGIC_SOC := s4

## Soong Namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(LOCAL_PATH)

## Wi-Fi
include hardware/realtek/wlan/wlan.mk

## Inherit from the common tree product makefile
$(call inherit-product, device/amlogic/ne-common/ne.mk)

## Inherit from the proprietary files makefile
$(call inherit-product, vendor/sdmc/tifa/tifa-vendor.mk)
