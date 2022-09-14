# Get non-open-source specific aspects
$(call inherit-product-if-exists, vendor/lenovo/kunlun2/kunlun2-vendor.mk)

# ZuiCam
# $(call inherit-product-if-exists, vendor/lenovo/ZuiCamera/config.mk)

# GCam
$(call inherit-product-if-exists, vendor/lenovo/GoogleCamera/config.mk)

# ZuiAudio
$(call inherit-product-if-exists, vendor/lenovo/ZuiAudio/config.mk)

# MicroG
ifeq ($(ADD_MICROG), true)
$(call inherit-product-if-exists, vendor/lenovo/MicroG/config.mk)
endif

# GAPPS
ifeq ($(WITH_CORE_GAPPS),true)
-include vendor/lenovo/gms/gms.mk
PACKAGE_BUILD_TYPE := GAPPS
endif

# Hardware
PRODUCT_BOARD_PLATFORM := sdm845
PRODUCT_USES_QCOM_HARDWARE := true

# HALS
SRC_AUDIO_HAL_DIR := hardware/qcom-caf/sdm845/audio
SRC_DISPLAY_HAL_DIR := hardware/qcom-caf/sdm845/display
SRC_MEDIA_HAL_DIR := hardware/qcom-caf/sdm845/media

PRODUCT_COMPATIBLE_PROPERTY_OVERRIDE := true
-include $(LOCAL_PATH)/properties/product_prop.mk
-include $(LOCAL_PATH)/properties/odm_prop.mk
-include $(LOCAL_PATH)/properties/vendor_prop.mk

# Disabled debugging
PRODUCT_ART_TARGET_INCLUDE_DEBUG_BUILD := false
PRODUCT_MINIMIZE_JAVA_DEBUG_INFO := true
PRODUCT_PACKAGES_DEBUG := false
PRODUCT_PACKAGES_DEBUG_ASAN := false
USE_DEX2OAT_DEBUG := false

# Always preopt extracted APKs to prevent extracting out of the APK
# for gms modules.
#PRODUCT_ALWAYS_PREOPT_EXTRACTED_APK := true

# AID/fs configs
PRODUCT_PACKAGES += \
    fs_config_files

# Set boot SPL
BOOT_SECURITY_PATCH = $(PLATFORM_SECURITY_PATCH)
# Setting vendor SPL
VENDOR_SECURITY_PATCH = $(PLATFORM_SECURITY_PATCH)

# Boot animation
TARGET_BOOT_ANIMATION_RES := 1080
TARGET_SCREEN_HEIGHT := 2340
TARGET_SCREEN_WIDTH := 1080

# Bluetooth
PRODUCT_PACKAGES += \
    android.hardware.bluetooth.audio-impl \
    audio.bluetooth.default \
    vendor.qti.hardware.bluetooth_audio@2.0.vendor \
    vendor.qti.hardware.btconfigstore@1.0.vendor \
    vendor.qti.hardware.btconfigstore@2.0.vendor \
    vendor.qti.hardware.capabilityconfigstore@1.0.vendor \
    android.hardware.bluetooth@1.0 \
    android.hardware.bluetooth@1.0.vendor

# Codec2
PRODUCT_PACKAGES += \
    libcodec2_vndk.vendor \
    libcodec2_hidl@1.0.vendor \
    android.hardware.media.c2@1.0 \
    android.hardware.media.c2@1.1 \
    android.hardware.media.c2@1.2

# Codec2 modules
PRODUCT_PACKAGES += \
    com.android.media.swcodec \
    libsfplugin_ccodec

# Media
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/media/media_codecs.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs.xml \
    $(LOCAL_PATH)/configs/media/media_codecs_performance.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_performance.xml \
    $(LOCAL_PATH)/configs/media/media_profiles.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_profiles.xml \
    $(LOCAL_PATH)/configs/media/media_profiles.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_profiles_V1_0.xml \
    $(LOCAL_PATH)/configs/media/media_profiles_vendor.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_profiles_vendor.xml \

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/system_properties.xml:$(TARGET_COPY_OUT_VENDOR)/etc/system_properties.xml

PRODUCT_COPY_FILES += \
    frameworks/av/media/libstagefright/data/media_codecs_google_c2.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_google_c2.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_c2_audio.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_google_c2_audio.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_c2_video.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_google_c2_video.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_audio.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_google_audio.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_telephony.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_google_telephony.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_video.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_google_video.xml

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/audio/audio_configs.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_configs.xml \
    $(LOCAL_PATH)/configs/audio/audio_effects.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_effects.xml \
    $(LOCAL_PATH)/configs/audio/audio_output_policy.conf:$(TARGET_COPY_OUT_VENDOR)/etc/audio_output_policy.conf \
    $(LOCAL_PATH)/configs/audio/audio_output_policy.conf:$(TARGET_COPY_OUT_VENDOR)/etc/audio_io_policy.conf \
    $(LOCAL_PATH)/configs/audio/audio_platform_info_intcodec.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_platform_info_intcodec.xml \
    $(LOCAL_PATH)/configs/audio/audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_policy_configuration.xml \
    $(LOCAL_PATH)/configs/audio/audio_policy_volumes.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_policy_volumes.xml \
    $(LOCAL_PATH)/configs/audio/audio_tuning_mixer.txt:$(TARGET_COPY_OUT_VENDOR)/etc/audio_tuning_mixer.txt \
    $(LOCAL_PATH)/configs/audio/default_volume_tables.xml:$(TARGET_COPY_OUT_VENDOR)/etc/default_volume_tables.xml \
    $(LOCAL_PATH)/configs/audio/listen_platform_info.xml:$(TARGET_COPY_OUT_VENDOR)/etc/listen_platform_info.xml \
    $(LOCAL_PATH)/configs/audio/mixer_paths_mtp.xml:$(TARGET_COPY_OUT_VENDOR)/etc/mixer_paths_mtp.xml \
    $(LOCAL_PATH)/configs/audio/sound_trigger_mixer_paths.xml:$(TARGET_COPY_OUT_VENDOR)/etc/sound_trigger_mixer_paths.xml \
    $(LOCAL_PATH)/configs/audio/sound_trigger_mixer_paths_wcd9340.xml:$(TARGET_COPY_OUT_VENDOR)/etc/sound_trigger_mixer_paths_wcd9340.xml \
    $(LOCAL_PATH)/configs/audio/sound_trigger_mixer_paths_wcd9335.xml:$(TARGET_COPY_OUT_VENDOR)/etc/sound_trigger_mixer_paths_wcd9335.xml \
    $(LOCAL_PATH)/configs/audio/audio_platform_info.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_platform_info.xml \
    $(LOCAL_PATH)/configs/audio/sound_trigger_platform_info.xml:$(TARGET_COPY_OUT_VENDOR)/etc/sound_trigger_platform_info.xml

PRODUCT_COPY_FILES += \
    frameworks/av/services/audiopolicy/config/a2dp_in_audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/a2dp_in_audio_policy_configuration.xml \
    frameworks/av/services/audiopolicy/config/r_submix_audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/r_submix_audio_policy_configuration.xml \
    frameworks/av/services/audiopolicy/config/usb_audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/usb_audio_policy_configuration.xml \
    frameworks/av/services/audiopolicy/config/hearing_aid_audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/hearing_aid_audio_policy_configuration.xml \
    frameworks/av/services/audiopolicy/config/bluetooth_audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/bluetooth_audio_policy_configuration.xml 

# GPS
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/gps/apdr.conf:$(TARGET_COPY_OUT_VENDOR)/etc/apdr.conf \
    $(LOCAL_PATH)/configs/gps/flp.conf:$(TARGET_COPY_OUT_VENDOR)/etc/flp.conf \
    $(LOCAL_PATH)/configs/gps/gps.conf:$(TARGET_COPY_OUT_VENDOR)/etc/gps.conf \
    $(LOCAL_PATH)/configs/gps/izat.conf:$(TARGET_COPY_OUT_VENDOR)/etc/izat.conf \
    $(LOCAL_PATH)/configs/gps/lowi.conf:$(TARGET_COPY_OUT_VENDOR)/etc/lowi.conf \
    $(LOCAL_PATH)/configs/gps/sap.conf:$(TARGET_COPY_OUT_VENDOR)/etc/sap.conf \
    $(LOCAL_PATH)/configs/gps/xtwifi.conf:$(TARGET_COPY_OUT_VENDOR)/etc/xtwifi.conf

# Cgroup and task_profiles
 PRODUCT_COPY_FILES += \
    system/core/libprocessgroup/profiles/cgroups_29.json:$(TARGET_COPY_OUT_VENDOR)/etc/cgroups.json \
    system/core/libprocessgroup/profiles/task_profiles_29.json:$(TARGET_COPY_OUT_VENDOR)/etc/task_profiles.json

# Device uses high-density artwork where available
PRODUCT_AAPT_CONFIG := normal
PRODUCT_AAPT_PREF_CONFIG := xxhdpi

# Overlays
DEVICE_PACKAGE_OVERLAYS += $(LOCAL_PATH)/overlay
DEVICE_PACKAGE_OVERLAYS += $(LOCAL_PATH)/overlay-lineage
	

# Audio
PRODUCT_PACKAGES += \
    android.hardware.audio.service \
    android.hardware.audio@6.0-impl:32 \
    android.hardware.audio.effect@6.0-impl:32 \
    android.hardware.soundtrigger@2.2-impl:32 \
    audio.primary.sdm710 \
    audio.r_submix.default \
    audio.usb.default \
    liba2dpoffload \
    libbatterylistener \
    libcomprcapture \
    libexthwplugin \
    libhdmiedid \
    libhfp \
    libaudio-resampler \
    libaudioroute \
    libqcompostprocbundle \
    libqcomvisualizer \
    libqcomvoiceprocessing \
    libsndmonitor \
    libspkrprot \
    libtinycompress \
    libtinycompress.vendor \
    libvolumelistener \
    tinymix

# Camera
PRODUCT_PACKAGES += \
    android.hardware.camera.provider@2.4-impl:32 \
    android.hardware.camera.provider@2.4-service \
    libxml2 \
    libdng_sdk \
    libdng_sdk.vendor \
    vendor.qti.hardware.camera.device@1.0.vendor \
    android.frameworks.displayservice@1.0.vendor \
    vendor.qti.hardware.camera.device@1.0.vendor \
    android.hidl.memory.block@1.0 \
    android.hidl.memory.block@1.0.vendor \
    libstdc++.vendor

# Crypto
PRODUCT_PACKAGES += \
    android.hardware.gatekeeper@1.0.vendor \
    android.hardware.keymaster@4.1.vendor \
    android.hardware.keymaster@4.0.vendor

# Charger
PRODUCT_PACKAGES += \
    libsuspend

# Common init scripts
PRODUCT_PACKAGES += \
    fstab.qcom \
    ueventd.qcom.rc \
    init.aicp-lenovo.rc \
    init.qcom.usb.sh \
    init.qti.fm.sh \
    init.qcom.early_boot.sh \
    init.qcom.post_boot.sh \
    init.qcom.sensors.sh \
    init.qcom.sh \
    init.class_main.sh \
    init.crda.sh \
    init.mdm.sh \
    qca6234-service.sh \
    init.qcom.class_core.sh \
    init.qti.ims.sh \
    init.qcom.coex.sh \
    init.qcom.crashdata.sh \
    init.qcom.efs.sync.sh \
    init.qcom.sdio.sh \
    init.qti.can.sh \
    init.qti.chg_policy.sh \
    init.fpc.rc \
    init.lenovo.common.rc \
    init.lenovo.usb.configfs.rc \
    init.qcom.usb.rc \
    init.power.rc \
    init.qcom.rc \
    init.qcom.factory.rc \
    init.lenovo.rc \
    init.ontim_fac.rc \
    init.target.rc \
    logcat.rc

# Device-specific settings
PRODUCT_PACKAGES += \
	LenovoParts 
PRODUCT_PACKAGES += \
    PocketMode

PRODUCT_COPY_FILES += \
     $(LOCAL_PATH)/pocketmode/privapp-permissions-pocketmode.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/permissions/privapp-permissions-pocketmode.xml

# Dex
PRODUCT_DEX_PREOPT_DEFAULT_COMPILER_FILTER := verify

# Disable Configstore
PRODUCT_PACKAGES += \
    disable_configstore


# Display
PRODUCT_PACKAGES += \
    android.hardware.graphics.composer@2.3-impl \
    android.hardware.graphics.composer@2.3-service \
    android.hardware.memtrack@1.0-impl \
    android.hardware.memtrack@1.0-service \
    android.hardware.graphics.mapper@3.0 \
    android.hardware.graphics.mapper@2.0-impl-qti-display \
    android.hardware.graphics.allocator@3.0-impl \
    android.hardware.graphics.allocator@4.0-impl \
    gralloc.sdm710 \
    hwcomposer.sdm710 \
    libdisplayconfig.qti \
    libdisplayconfig.qti.vendor \
    libhwc2on1adapter \
    libhwc2onfbadapter \
    libqdMetaData \
    libqdMetaData.vendor \
    libtinyxml \
    libvulkan \
    memtrack.sdm710 \
    vendor.display.config@1.0.vendor \
    vendor.display.config@2.0 \
    vendor.display.config@2.0.vendor \
    vendor.qti.hardware.display.allocator@1.0-service \
    vendor.qti.hardware.display.mapper@1.1.vendor \
    vendor.qti.hardware.display.mapper@1.0.vendor \
    vendor.qti.hardware.display.mapper@3.0.vendor \
    vendor.qti.hardware.display.mapper@4.0.vendor \
    libsdm-disp-vndapis \
    libgui

# DRM
PRODUCT_PACKAGES += \
    android.hardware.drm@1.3.vendor \
    android.hardware.drm@1.2.vendor \
    android.hardware.drm@1.1.vendor \
    android.hardware.drm@1.0.vendor \
    android.hardware.drm@1.0-impl \
    android.hardware.drm@1.0-service \
    android.hardware.drm@1.4-service.clearkey

# GNSS
PRODUCT_PACKAGES += \
    android.hardware.gnss@1.0 \
    android.hardware.gnss@1.1 \
    android.hardware.gnss@1.2 \
    android.hardware.gnss@2.0 \
    android.hardware.gnss@2.1


# Perf dummy
PRODUCT_PACKAGES += \
    libqti-perfd-client \

# Freeform Multiwindow
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.software.freeform_window_management.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.freeform_window_management.xml

# ANT+
PRODUCT_PACKAGES += \
    AntHalService-Soong \
    com.dsi.ant@1.0.vendor


# Permissions
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.fingerprint.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.fingerprint.xml \
    frameworks/native/data/etc/android.hardware.audio.low_latency.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.audio.low_latency.xml \
    frameworks/native/data/etc/android.hardware.audio.pro.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.audio.pro.xml \
    frameworks/native/data/etc/android.hardware.bluetooth_le.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.bluetooth_le.xml \
    frameworks/native/data/etc/android.hardware.bluetooth.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.bluetooth.xml \
    frameworks/native/data/etc/android.hardware.camera.flash-autofocus.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.flash-autofocus.xml \
    frameworks/native/data/etc/android.hardware.camera.front.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.front.xml \
    frameworks/native/data/etc/android.hardware.camera.full.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.full.xml \
    frameworks/native/data/etc/android.hardware.camera.raw.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.raw.xml \
    frameworks/native/data/etc/android.hardware.location.gps.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.location.gps.xml \
    frameworks/native/data/etc/android.hardware.opengles.aep.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.opengles.aep.xml \
    frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/native/data/etc/android.hardware.sensor.compass.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.compass.xml \
    frameworks/native/data/etc/android.hardware.sensor.gyroscope.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.gyroscope.xml \
    frameworks/native/data/etc/android.hardware.sensor.hifi_sensors.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.hifi_sensors.xml \
    frameworks/native/data/etc/android.hardware.sensor.light.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/native/data/etc/android.hardware.sensor.proximity.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/native/data/etc/android.hardware.sensor.relative_humidity.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.relative_humidity.xml \
    frameworks/native/data/etc/android.hardware.sensor.stepcounter.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.stepcounter.xml \
    frameworks/native/data/etc/android.hardware.sensor.stepdetector.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.stepdetector.xml \
    frameworks/native/data/etc/android.hardware.telephony.cdma.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.telephony.cdma.xml \
    frameworks/native/data/etc/android.hardware.telephony.gsm.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.telephony.gsm.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
    frameworks/native/data/etc/android.hardware.usb.accessory.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.usb.accessory.xml \
    frameworks/native/data/etc/android.hardware.usb.host.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.usb.host.xml \
    frameworks/native/data/etc/android.hardware.vulkan.compute-0.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.vulkan.compute-0.xml \
    frameworks/native/data/etc/android.hardware.vulkan.level-1.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.vulkan.level-1.xml \
    frameworks/native/data/etc/android.hardware.vulkan.version-1_1.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.vulkan.version-1_1.xml \
    frameworks/native/data/etc/android.hardware.wifi.direct.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.wifi.direct.xml \
    frameworks/native/data/etc/android.hardware.wifi.passpoint.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.wifi.passpoint.xml \
    frameworks/native/data/etc/android.hardware.wifi.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.wifi.xml \
    frameworks/native/data/etc/android.software.ipsec_tunnels.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.ipsec_tunnels.xml \
    frameworks/native/data/etc/android.software.midi.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.midi.xml \
    frameworks/native/data/etc/android.software.sip.voip.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.sip.voip.xml \
    frameworks/native/data/etc/android.hardware.telephony.ims.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.telephony.ims.xml \
    frameworks/native/data/etc/android.software.opengles.deqp.level-2020-03-01.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.opengles.deqp.level.xml \
    frameworks/native/data/etc/android.software.vulkan.deqp.level-2020-03-01.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.vulkan.deqp.level.xml

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/qti_whitelist.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/sysconfig/qti_whitelist.xml \
    $(LOCAL_PATH)/permissions/privapp-permissions-qti.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/privapp-permissions-qti.xml \
    $(LOCAL_PATH)/permissions/system_ext-privapp-permissions-qti.xml:$(TARGET_COPY_OUT_SYSTEM_EXT)/etc/permissions/privapp-permissions-qti.xml \
    $(LOCAL_PATH)/permissions/com.custom.ambient.display.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/com.custom.ambient.display.xml \
    $(LOCAL_PATH)/permissions/privapp-permissions-google.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/privapp-permissions-google.xml \
    $(LOCAL_PATH)/permissions/org.codeaurora.snapcam.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/org.codeaurora.snapcam.xml \
    $(LOCAL_PATH)/permissions/com.google.android.carrier.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/permissions/com.google.android.carrier.xml

# HotwordEnrollement app permissions
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/permissions/privapp-permissions-hotword.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/permissions/privapp-permissions-hotword.xml

# Component overrides
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/component-overrides.xml:$(TARGET_COPY_OUT_VENDOR)/etc/sysconfig/component-overrides.xml

# FM
PRODUCT_PACKAGES += \
    FM2 \
    libqcomfm_jni \
    qcom.fmradio

# HIDL
PRODUCT_PACKAGES += \
    android.hidl.base@1.0 \
    android.hidl.base@1.0.vendor \
    libhidltransport \
    libhidltransport.vendor \
    libhwbinder \
    libhwbinder.vendor

# IMS
PRODUCT_PACKAGES += \
    extphonelib \
    extphonelib-product \
    extphonelib.xml \
    extphonelib_product.xml \
    ims-ext-common \
    ims_ext_common.xml
	
# Input
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/keylayout/fts_ts.kl:system/usr/keylayout/fts_ts.kl

# IPv6
PRODUCT_PACKAGES += \
    ethertypes \
    libebtc

# Lights
PRODUCT_PACKAGES += \
    android.hardware.lights-service.lenovo \
    lights.sdm710 \
    android.hardware.light@2.0-impl

# Tethering
PRODUCT_PACKAGES += \
    TetheringConfigOverlay

# OMX
PRODUCT_PACKAGES += \
	libavservices_minijail \
    libavservices_minijail.vendor \
    libc2dcolorconvert \
    libmm-omxcore \
    libOmxAacEnc \
    libOmxAmrEnc \
    libOmxCore \
    libOmxEvrcEnc \
    libOmxG711Enc \
    libOmxQcelp13Enc \
    libOmxVdec \
    libOmxVenc \
    libOmxVidcCommon \
    libstagefrighthw

# Power
PRODUCT_PACKAGES += \
    android.hardware.power-service.lenovo-libperfmgr \
    android.hardware.power@1.0-impl \
    android.hardware.power.stats@1.0-service.lenovo \
    android.hardware.power@1.0 \
    android.hardware.power@1.1 \
    android.hardware.power@1.2 \
    android.hardware.power@1.3

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/powerhint.json:$(TARGET_COPY_OUT_VENDOR)/etc/powerhint.json \
    $(LOCAL_PATH)/configs/thermal_info_config.json:$(TARGET_COPY_OUT_VENDOR)/etc/thermal_info_config.json
    
# QMI
PRODUCT_PACKAGES += \
    libjson \
    libqti_vndfwk_detect \
    libqti_vndfwk_detect.vendor \
    libvndfwk_detect_jni.qti \
    libvndfwk_detect_jni.qti.vendor

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(LOCAL_PATH) \
    hardware/google/interfaces \
    hardware/google/pixel \
    hardware/qcom-caf/sdm845

# Packages
PRODUCT_PACKAGES += \
    Etar

PRODUCT_PACKAGES += \
    remove_packages

# Telephony
PRODUCT_PACKAGES += \
    telephony-ext

PRODUCT_BOOT_JARS += \
    telephony-ext

PRODUCT_PACKAGES += \
    qti-telephony-hidl-wrapper \
    qti_telephony_hidl_wrapper.xml \
    qti-telephony-utils \
    qti_telephony_utils.xml

# USB
PRODUCT_PACKAGES += \
    android.hardware.usb@1.0-service

# Vibrator
PRODUCT_PACKAGES += \
    vendor.qti.hardware.vibrator.service.lenovo
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/vibrator/excluded-input-devices.xml:$(TARGET_COPY_OUT_VENDOR)/etc/excluded-input-devices.xml

# WiFi Display
PRODUCT_PACKAGES += \
    libnl \
    libwfdaac_vendor

# WiFi
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/wifi/wigig_supplicant.conf:$(TARGET_COPY_OUT_VENDOR)/etc/wifi/wigig_supplicant.conf \
    $(LOCAL_PATH)/wifi/wigig_p2p_supplicant.conf:$(TARGET_COPY_OUT_VENDOR)/etc/wifi/wigig_p2p_supplicant.conf \
    $(LOCAL_PATH)/wifi/icm.conf:$(TARGET_COPY_OUT_VENDOR)/etc/wifi/icm.conf \
    $(LOCAL_PATH)/wifi/p2p_supplicant_overlay.conf:$(TARGET_COPY_OUT_VENDOR)/etc/wifi/p2p_supplicant_overlay.conf \
    $(LOCAL_PATH)/wifi/WCNSS_qcom_cfg.ini:$(TARGET_COPY_OUT_VENDOR)/etc/wifi/WCNSS_qcom_cfg.ini \
    $(LOCAL_PATH)/wifi/wpa_supplicant_overlay.conf:$(TARGET_COPY_OUT_VENDOR)/etc/wifi/wpa_supplicant_overlay.conf

# Thermal HAL
PRODUCT_PACKAGES += \
    android.hardware.thermal@2.0-service.lenovo \
    thermal_symlinks \
    android.hardware.thermal@1.0-impl \
    thermal.sdm710

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/msm_irqbalance.conf:$(TARGET_COPY_OUT_VENDOR)/etc/msm_irqbalance.conf

# Health
PRODUCT_PACKAGES += \
	android.hardware.health@2.1 \
    android.hardware.health@2.1-impl:64 \
    android.hardware.health@2.1-service

# Allocator
PRODUCT_PACKAGES += \
    android.hidl.allocator@1.0 \
    android.hidl.allocator@1.0.vendor \

# Context Hub
PRODUCT_PACKAGES += \
    android.hardware.contexthub@1.0-impl.generic \
    android.hardware.contexthub@1.0-service

# IPA
PRODUCT_PACKAGES += \
    ipacm \
    IPACM_cfg.xml

# WiFi
PRODUCT_PACKAGES += \
    android.hardware.wifi@1.5.vendor \
    android.hardware.wifi@1.0-service \
    hostapd \
    hostapd_cli \
    libcld80211 \
    WifiOverlay \
    libkeystore-engine-wifi-hidl \
    libkeystore-wifi-hidl \
    libwifi-hal-ctrl \
    libwifi-hal-qcom \
    libwpa_client \
    wpa_cli \
    wpa_supplicant \
    wpa_supplicant.conf

# Protobuf
PRODUCT_PACKAGES += \
    libprotobuf-cpp-full-vendorcompat \
    libprotobuf-cpp-lite-vendorcompat

# Radio
PRODUCT_PACKAGES += \
    android.system.net.netd@1.1.vendor \
    android.hardware.radio@1.2 \
    android.hardware.radio.config@1.2.vendor \
    android.hardware.radio.deprecated@1.0 \
    android.hardware.radio.deprecated@1.0.vendor \
    android.hardware.radio@1.4.vendor \
    android.hardware.radio@1.5.vendor \
    android.hardware.secure_element@1.2.vendor \
    android.hardware.secure_element@1.1.vendor \
    android.hardware.secure_element@1.0.vendor \
    libcnefeatureconfig \
    libjson \
    librmnetctl \
    libxml2 \
    rild

# Broadcast
PRODUCT_PACKAGES += \
    android.hardware.broadcastradio@1.0-impl

# Atrace
 PRODUCT_PACKAGES += \
    android.hardware.atrace@1.0-service.pixel \
    android.hardware.atrace@1.0.vendor

# NeuralNetworks
PRODUCT_PACKAGES += \
    android.hardware.neuralnetworks@1.3 \
    android.hardware.neuralnetworks@1.3.vendor \
    android.hardware.neuralnetworks@1.2 \
    android.hardware.neuralnetworks@1.2.vendor \
    android.hardware.neuralnetworks@1.1 \
    android.hardware.neuralnetworks@1.1.vendor \
    android.hardware.neuralnetworks@1.0 \
    android.hardware.neuralnetworks@1.0.vendor

# Sensors
PRODUCT_PACKAGES += \
    libsensorndkbridge \
    libgui_vendor

# NQ Client
PRODUCT_PACKAGES += \
    libchrome.vendor

# Fingerprint
PRODUCT_PACKAGES += \
android.hardware.biometrics.fingerprint@2.1.vendor

# Sensors
PRODUCT_PACKAGES += \
    android.hardware.sensors@2.0.vendor \
    android.hardware.sensors@2.1.vendor

# Seccomp policy
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/seccomp/mediacodec-seccomp.policy:$(TARGET_COPY_OUT_VENDOR)/etc/seccomp_policy/mediacodec.policy

# Sensor Configuration
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/hals.conf:$(TARGET_COPY_OUT_VENDOR)/etc/sensors/hals.conf

# IRSC
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/sec_config:$(TARGET_COPY_OUT_VENDOR)/etc/sec_config

# Public Libraries
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/public.libraries.txt:$(TARGET_COPY_OUT_VENDOR)/etc/public.libraries.txt

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/graphite_ipc_platform_info.xml:$(TARGET_COPY_OUT_VENDOR)/etc/graphite_ipc_platform_info.xml \
    $(LOCAL_PATH)/configs/lowi.conf:$(TARGET_COPY_OUT_VENDOR)/etc/lowi.conf
