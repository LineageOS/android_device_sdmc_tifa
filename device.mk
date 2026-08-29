#
# SPDX-FileCopyrightText: The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#

## Bluetooth
PRODUCT_PACKAGES += \
    BluetoothOverlayTifa

## Init
PRODUCT_PACKAGES += \
    init.amlogic.wifi_buildin.rc

## Keylayout (IR)
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/keylayout/Vendor_0001_Product_0001.kl:$(TARGET_COPY_OUT_VENDOR)/usr/keylayout/Vendor_0001_Product_0001.kl \
    $(LOCAL_PATH)/keylayout/Vendor_005d_Product_0001.kl:$(TARGET_COPY_OUT_VENDOR)/usr/keylayout/Vendor_005d_Product_0001.kl

## Netflix
PRODUCT_PACKAGES += \
    NetflixConfig \
    NetflixConfigOverlayTifa

## Platform
TARGET_AMLOGIC_SOC := s4

## Soong Namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(LOCAL_PATH)

## Inherit from the common tree product makefile
$(call inherit-product, device/amlogic/ne-common/ne.mk)

## Inherit from the proprietary files makefile
$(call inherit-product, vendor/sdmc/tifa/tifa-vendor.mk)
