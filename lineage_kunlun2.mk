#
# Copyright (C) 2018 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

$(call inherit-product, device/lenovo/kunlun2/device.mk)

# Inherit some common Lineage stuff.
$(call inherit-product, vendor/lineage/config/common_full_phone.mk)

# Device identifier. This must come after all inclusions.
PRODUCT_NAME := lineage_kunlun2
PRODUCT_DEVICE := kunlun2
PRODUCT_BRAND := Lenovo
PRODUCT_MODEL := Z6SE
PRODUCT_MANUFACTURER := Lenovo

BUILD_FINGERPRINT := "Lenovo/kunlun2/kunlun2:9/PKQ1.190127.001/11.0.049_190517:user/release-keys"

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRIVATE_BUILD_DESC="kunlun2-user 9 PKQ1.190127.001 11.0.049_190517 release-keys" \
    PRODUCT_NAME="kunlun2" \
    TARGET_DEVICE="kunlun2"

PRODUCT_GMS_CLIENTID_BASE := android-lenovo
