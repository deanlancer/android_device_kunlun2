#
# Copyright (C) 2019 The PixelExperience Project
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
#
# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

$(call inherit-product, device/lenovo/kunlun2/device.mk)

# Inherit some common Lineage stuff
$(call inherit-product, vendor/aicp/config/common_full_phone.mk)

# AICP maintainer
PRODUCT_BUILD_PROP_OVERRIDES += \
    DEVICE_MAINTAINERS="Deanlancer"

#TARGET_GAPPS_ARCH := arm64
# Recorder
#TARGET_SUPPORTS_GOOGLE_RECORDER := true

# Device identifier. This must come after all inclusions.
PRODUCT_NAME := aicp_kunlun2
PRODUCT_BRAND := Lenovo
PRODUCT_DEVICE := kunlun2
PRODUCT_MODEL := Lenovo Z6SE
PRODUCT_MANUFACTURER := Lenovo

TARGET_VENDOR := lenovo

# Stock. I'll leave it here
# BUILD_FINGERPRINT := Lenovo/kunlun2/kunlun2:10/QKQ1.191014.001/11.5.117_200331:user/release-keys 
# PRODUCT_BUILD_PROP_OVERRIDES += \
#     PRODUCT_DEVICE=kunlun2 \
#     PRODUCT_NAME=kunlun2 \
#     PRIVATE_BUILD_DESC="kunlun2-user 10 QKQ1.191014.001 11.5.117_200331 release-keys"

# Google Walleye
BUILD_FINGERPRINT := "google/walleye/walleye:8.1.0/OPM1.171019.011/4448085:user/release-keys" \

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRIVATE_BUILD_DESC="walleye-user 8.1.0 OPM1.171019.011 4448085 release-keys" \
    PRODUCT_NAME="kunlun2" \
    TARGET_DEVICE="kunlun2"

PRODUCT_PROPERTY_OVERRIDES += \
    ro.build.fingerprint=google/walleye/walleye:8.1.0/OPM1.171019.011/4448085:user/release-keys \
    ro.build.description=walleye-user 8.1.0 OPM1.171019.011 4448085 release-keys

PRODUCT_GMS_CLIENTID_BASE := android-lenovo
