#
# SPDX-FileCopyrightText: The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#

# Not set in time to check, so set before everything else
PRODUCT_IS_ATV := true

# Inherit some common AOSP stuff
$(call inherit-product, device/google/atv/products/atv_base.mk)

# Inherit some common Lineage stuff
$(call inherit-product, vendor/lineage/config/common_full_tv.mk)

# Inherit device configuration
$(call inherit-product, $(LOCAL_PATH)/device.mk)

## Device identifier. This must come after all inclusions
PRODUCT_BRAND := TV360-4K-Box
PRODUCT_DEVICE := tifa
PRODUCT_GMS_CLIENTID_BASE := android-sdmc-tv
PRODUCT_MANUFACTURER := SDMC
PRODUCT_MODEL := TV360 4K Box
PRODUCT_NAME := lineage_tifa

PRODUCT_BUILD_PROP_OVERRIDES += \
    BuildDesc="oppen-user 14 UKG3.250803.001 20251124 release-keys" \
    BuildFingerprint=TV360-4K-Box/TV360-ATV-Y4-SDMC/DV9135-KVV:14/UKG/20251211:user/release-keys \
    SystemName=DV9135-KVV
