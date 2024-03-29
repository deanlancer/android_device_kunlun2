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
$(call inherit-product, $(SRC_TARGET_DIR)/product/product_launched_with_p.mk)
# Enable updating of APEXes
$(call inherit-product, $(SRC_TARGET_DIR)/product/updatable_apex.mk)

$(call inherit-product, device/lenovo/kunlun2/device.mk)

# Inherit some common Spark OS stuff
$(call inherit-product, vendor/spark/config/common_full_phone.mk)

# Device identifier. This must come after all inclusions.
PRODUCT_NAME := spark_kunlun2
PRODUCT_BRAND := Lenovo
PRODUCT_DEVICE := kunlun2
PRODUCT_MODEL := L38111
PRODUCT_MANUFACTURER := Lenovo

TARGET_VENDOR := lenovo

# Spark
TARGET_FACE_UNLOCK_SUPPORTED := true
TARGET_SUPPORTS_ADAPTIVE_CHARGING := false
TARGET_SUPPORTS_QUICK_TAP := false

# Stock
BUILD_FINGERPRINT := Lenovo/kunlun2/kunlun2:10/QKQ1.191014.001/11.5.160_200513:user/release-keys 
PRODUCT_BUILD_PROP_OVERRIDES += \
    PRODUCT_DEVICE=kunlun2 \
    PRODUCT_NAME=kunlun2 \
    PRIVATE_BUILD_DESC="kunlun2-user 10 QKQ1.191014.001 11.5.160_200513 release-keys"

PRODUCT_GMS_CLIENTID_BASE := android-lenovo
