# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/product_launched_with_p.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Get non-open-source specific aspects
$(call inherit-product-if-exists, vendor/lenovo/kunlun2/kunlun2-vendor.mk)

# ZuiCam
$(call inherit-product-if-exists, vendor/lenovo/ZuiCamera/config.mk)

# ZuiAudio
$(call inherit-product-if-exists, vendor/lenovo/ZuiAudio/config.mk)

# Enable updating of APEXes
$(call inherit-product, $(SRC_TARGET_DIR)/product/updatable_apex.mk)

PRODUCT_COMPATIBLE_PROPERTY_OVERRIDE := true

# Disabled debugging
PRODUCT_ART_TARGET_INCLUDE_DEBUG_BUILD := false
PRODUCT_MINIMIZE_JAVA_DEBUG_INFO := true
PRODUCT_PACKAGES_DEBUG := false
PRODUCT_PACKAGES_DEBUG_ASAN := false

# Always preopt extracted APKs to prevent extracting out of the APK
# for gms modules.
#PRODUCT_ALWAYS_PREOPT_EXTRACTED_APK := true

PRODUCT_PRODUCT_PROPERTIES += \
    ro.vendor.qti.va_aosp.support=1 \

PRODUCT_ODM_PROPERTIES += \
    ro.vendor.qti.va_odm.support=1

PRODUCT_PRODUCT_PROPERTIES += \
	vendor.bluetooth.soc=cherokee \
	ro.vendor.fm.use_audio_session=true

PRODUCT_PRODUCT_PROPERTIES += \
	dalvik.vm.heapstartsize=8m \
    dalvik.vm.heapgrowthlimit=256m \
    dalvik.vm.heapsize=512m \
    dalvik.vm.heaptargetutilization=0.6 \
    dalvik.vm.heapminfree=8m \
    dalvik.vm.heapmaxfree=16m

PRODUCT_PRODUCT_PROPERTIES += \
    persist.camera.HAL3.enabled=1 \
    persist.vendor.camera.HAL3.enabled=1 \
    persist.camera.eis.enable=1 \
    persist.vendor.camera.eis.enable=1

PRODUCT_PRODUCT_PROPERTIES += \
    ro.min_pointer_dur=0.000000000001 \
	vendor.grip.status=off \
	vendor.touch.smoothness=5 \
	debug.gralloc.enable_fb_ubwc=1

#WFD
PRODUCT_PRODUCT_PROPERTIES += \
    persist.hwc.enable_vds=1

#Surfaceflinger
PRODUCT_PRODUCT_PROPERTIES += \
    ro.surface_flinger.max_frame_buffer_acquired_buffers=3 \
    ro.surface_flinger.vsync_event_phase_offset_ns=2000000 \
    ro.surface_flinger.vsync_sf_event_phase_offset_ns=6000000

# LMKD
PRODUCT_PRODUCT_PROPERTIES += \
    ro.lmk.low=1001 \
    ro.lmk.medium=800 \
    ro.lmk.critical=0 \
    ro.lmk.critical_upgrade=false \
    ro.lmk.upgrade_pressure=100 \
    ro.lmk.downgrade_pressure=100 \
    ro.lmk.kill_heaviest_task=true \
    ro.lmk.kill_timeout_ms=100 \
    ro.lmk.use_minfree_levels=true \
    ro.lmk.log_stats=true

#Apex
PRODUCT_PRODUCT_PROPERTIES += \
    ro.apex.updatable=true

# Perf
PRODUCT_PRODUCT_PROPERTIES += \
	ro.sys.fw.dex2oat_thread_count=6

# Dalvik
PRODUCT_PRODUCT_PROPERTIES += \
	dalvik.vm.dex2oat64.enabled=true

# ART
PRODUCT_PRODUCT_PROPERTIES += \
	dalvik.vm.dex2oat-filter=speed \
	dalvik.vm.image-dex2oat-filter=speed 
PRODUCT_PRODUCT_PROPERTIES += \
	dalvik.vm.image-dex2oat-Xms=64m \
	dalvik.vm.image-dex2oat-Xmx=64m \
	dalvik.vm.dex2oat-Xms=64m \
	dalvik.vm.dex2oat-Xmx=512m \
	dalvik.vm.usejit=true \
	dalvik.vm.usejitprofiles=true \
	dalvik.vm.dexopt.secondary=true \
	dalvik.vm.appimageformat=lz4 \
	ro.dalvik.vm.native.bridge=0
PRODUCT_PRODUCT_PROPERTIES += \
	pm.dexopt.first-boot=quicken \
	pm.dexopt.boot=verify \
	pm.dexopt.install=speed-profile \
	pm.dexopt.bg-dexopt=speed-profile \
	pm.dexopt.ab-ota=speed-profile \
	pm.dexopt.inactive=verify \
	pm.dexopt.shared=speed \
	dalvik.vm.dex2oat-resolve-startup-strings=true \
	dalvik.vm.dex2oat-max-image-block-size=524288 \
	dalvik.vm.minidebuginfo=true \
	dalvik.vm.dex2oat-minidebuginfo=true 

#Enable 16 bit PCM offload by default
PRODUCT_PRODUCT_PROPERTIES += \
	audio.offload.pcm.16bit.enable=true

#Enable 24 bit PCM offload by default
PRODUCT_PRODUCT_PROPERTIES += \
	audio.offload.pcm.24bit.enable=true

# Enable AAC frame ctl for A2DP sinks
PRODUCT_PRODUCT_PROPERTIES += \
    persist.vendor.bt.aac_frm_ctl.enabled=true

# Zygote preforking
PRODUCT_PRODUCT_PROPERTIES += \
    persist.device_config.runtime_native.usap_pool_enabled=true

# Thermal
PRODUCT_PRODUCT_PROPERTIES += \
    vendor.thermal.config=thermal_info_config.json 

# Enable fluence for audio/voice recording
PRODUCT_PRODUCT_PROPERTIES += \
    persist.vendor.audio.fluence.audiorec=true \
    persist.vendor.audio.fluence.voicerec=true \
    persist.audio.fluence.voicecall=true \
    persist.audio.fluence.voicerec=true

PRODUCT_PRODUCT_PROPERTIES += \
	ro.treble.enabled=false

PRODUCT_PROPERTY_OVERRIDES += \
    ro.hardware.vulkan=adreno \
    ro.hardware.egl=adreno

#Eng
ifeq ($(TARGET_BUILD_VARIANT),userdebug)
PRODUCT_PRODUCT_PROPERTIES += \
    persist.sys.usb.config=mtp,adb \
    ro.secure=0 \
    ro.allow.mock.location=0 \
    ro.debuggable=1 \
    persist.service.acm.enable=1  \
    persist.service.adb.enable=1 \
    persist.service.debuggable=1 \
    persist.logd.logpersistd=logcatd \
    ro.adb.secure=0 \
    ro.mount.fs=EXT4 \
    ro.persist.partition.support=no \
    ro.control_privapp_permissions=log 
endif
# Userdebug
# ifeq ($(TARGET_BUILD_VARIANT),userdebug)
# PRODUCT_PRODUCT_PROPERTIES += \
#     ro.secure=1 \
#     ro.adb.secure=1 \
#     ro.control_privapp_permissions=log
# endif

# AID/fs configs
PRODUCT_PACKAGES += \
    fs_config_files

# VNDK
PRODUCT_TARGET_VNDK_VERSION := 29
PRODUCT_EXTRA_VNDK_VERSIONS := 29

# Boot animation
TARGET_SCREEN_HEIGHT := 2340
TARGET_SCREEN_WIDTH := 1080

# Bluetooth
PRODUCT_PACKAGES += \
    android.hardware.bluetooth.audio@2.0-impl \
    audio.bluetooth.default \
    libbthost_if \
    libldacBT_dec \
    libldacBT_enc \
    libldacBT_abr \
    hwaddrs \
    libbt-vendor \
    libbtconfigstore \
    vendor.qti.hardware.bluetooth_audio@2.0 \
    vendor.qti.hardware.bluetooth_audio@2.0.vendor \
    vendor.qti.hardware.btconfigstore@1.0.vendor

# Codec2
PRODUCT_PACKAGES += \
    libcodec2_vndk.vendor \
    libcodec2_hidl@1.0.vendor

# Codec2 modules
PRODUCT_PACKAGES += \
    com.android.media.swcodec \
    libsfplugin_ccodec

# Media
PRODUCT_COPY_FILES += \
    frameworks/av/media/libstagefright/data/media_codecs_sw.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_sw.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_c2.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_google_c2.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_c2_audio.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_google_c2_audio.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_c2_video.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_google_c2_video.xml

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/media/media_profiles_vendor.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_profiles_vendor.xml \
    $(LOCAL_PATH)/configs/media/media_codecs_vendor_audio.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_vendor_audio.xml \
    $(LOCAL_PATH)/configs/media/media_codecs_vendor.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_vendor.xml \
    $(LOCAL_PATH)/configs/media/media_codecs.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs.xml \
    $(LOCAL_PATH)/configs/media/media_codecs_performance.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_performance.xml \
    $(LOCAL_PATH)/configs/media/media_codecs_performance_sdm710_v0.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_performance_sdm710_v0.xml \
    $(LOCAL_PATH)/configs/media/media_codecs_sdm710_v0.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_sdm710_v0.xml \
    $(LOCAL_PATH)/configs/media/media_profiles_V1_0.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_profiles_V1_0.xml \
    $(LOCAL_PATH)/configs/media/media_profiles.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_profiles.xml

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
    $(LOCAL_PATH)/configs/audio/audio_platform_info_intcodec.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_platform_info_intcodec.xml \
    $(LOCAL_PATH)/configs/audio/audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio/audio_policy_configuration.xml \
    $(LOCAL_PATH)/configs/audio/audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_policy_configuration.xml \
    $(LOCAL_PATH)/configs/audio/bluetooth_qti_audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/bluetooth_qti_audio_policy_configuration.xml \
    $(LOCAL_PATH)/configs/audio/a2dp_audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/a2dp_audio_policy_configuration.xml \
    $(LOCAL_PATH)/configs/audio/audio_policy_configuration_a2dp_offload_disabled.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_policy_configuration_a2dp_offload_disabled.xml \
    $(LOCAL_PATH)/configs/audio/audio_policy_volumes.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_policy_volumes.xml \
    $(LOCAL_PATH)/configs/audio/audio_tuning_mixer.txt:$(TARGET_COPY_OUT_VENDOR)/etc/audio_tuning_mixer.txt \
    $(LOCAL_PATH)/configs/audio/default_volume_tables.xml:$(TARGET_COPY_OUT_VENDOR)/etc/default_volume_tables.xml \
    $(LOCAL_PATH)/configs/audio/listen_platform_info.xml:$(TARGET_COPY_OUT_VENDOR)/etc/listen_platform_info.xml \
    $(LOCAL_PATH)/configs/audio/mixer_paths_mtp.xml:$(TARGET_COPY_OUT_VENDOR)/etc/mixer_paths_mtp.xml \
    $(LOCAL_PATH)/configs/audio/sound_trigger_mixer_paths.xml:$(TARGET_COPY_OUT_VENDOR)/etc/sound_trigger_mixer_paths.xml \
    $(LOCAL_PATH)/configs/audio/sound_trigger_mixer_paths_wcd9340.xml:$(TARGET_COPY_OUT_VENDOR)/etc/sound_trigger_mixer_paths_wcd9340.xml \
    $(LOCAL_PATH)/configs/audio/sound_trigger_mixer_paths_wcd9335.xml:$(TARGET_COPY_OUT_VENDOR)/etc/sound_trigger_mixer_paths_wcd9335.xml \
    $(LOCAL_PATH)/configs/audio/sound_trigger_mixer_paths_skuw.xml:$(TARGET_COPY_OUT_VENDOR)/etc/sound_trigger_mixer_paths_skuw.xml \
    $(LOCAL_PATH)/configs/audio/mixer_paths_tavil.xml:$(TARGET_COPY_OUT_VENDOR)/etc/mixer_paths_tavil.xml \
    $(LOCAL_PATH)/configs/audio/mixer_paths_tashalite.xml:$(TARGET_COPY_OUT_VENDOR)/etc/mixer_paths_tashalite.xml \
    $(LOCAL_PATH)/configs/audio/mixer_paths_tasha.xml:$(TARGET_COPY_OUT_VENDOR)/etc/mixer_paths_tasha.xml \
    $(LOCAL_PATH)/configs/audio/mixer_paths_skuw.xml:$(TARGET_COPY_OUT_VENDOR)/etc/mixer_paths_skuw.xml \
    $(LOCAL_PATH)/configs/audio/mixer_paths_overlay_static.xml:$(TARGET_COPY_OUT_VENDOR)/etc/mixer_paths_overlay_static.xml \
    $(LOCAL_PATH)/configs/audio/mixer_paths_i2s.xml:$(TARGET_COPY_OUT_VENDOR)/etc/mixer_paths_i2s.xml \
    $(LOCAL_PATH)/configs/audio/mixer_paths_360cam.xml:$(TARGET_COPY_OUT_VENDOR)/etc/mixer_paths_360cam.xml \
    $(LOCAL_PATH)/configs/audio/mixer_paths.xml:$(TARGET_COPY_OUT_VENDOR)/etc/mixer_paths.xml \
    $(LOCAL_PATH)/configs/audio/audio_tuning_mixer_tavil.txt:$(TARGET_COPY_OUT_VENDOR)/etc/audio_tuning_mixer_tavil.txt \
    $(LOCAL_PATH)/configs/audio/audio_policy.conf:$(TARGET_COPY_OUT_VENDOR)/etc/audio_policy.conf \
    $(LOCAL_PATH)/configs/audio/audio_platform_info_skuw.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_platform_info_skuw.xml \
    $(LOCAL_PATH)/configs/audio/audio_platform_info_i2s.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_platform_info_i2s.xml \
    $(LOCAL_PATH)/configs/audio/audio_platform_info.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_platform_info.xml \
    $(LOCAL_PATH)/configs/audio/sound_trigger_platform_info.xml:$(TARGET_COPY_OUT_VENDOR)/etc/sound_trigger_platform_info.xml

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/audio/bluetooth_hearing_aid_audio_policy_configuration.xml:/$(TARGET_COPY_OUT_VENDOR)/etc/bluetooth_hearing_aid_audio_policy_configuration.xml \
    $(TOPDIR)frameworks/av/services/audiopolicy/config/r_submix_audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/r_submix_audio_policy_configuration.xml \
    $(TOPDIR)frameworks/av/services/audiopolicy/config/usb_audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/usb_audio_policy_configuration.xml

# Device uses high-density artwork where available
PRODUCT_AAPT_CONFIG := normal
PRODUCT_AAPT_PREF_CONFIG := xxhdpi

# Overlays
DEVICE_PACKAGE_OVERLAYS += $(LOCAL_PATH)/overlay
DEVICE_PACKAGE_OVERLAYS += $(LOCAL_PATH)/overlay-aicp
PRODUCT_PACKAGES += DefaultDark-Contacts-M \
					DefaultDark-Messaging-M \
    				NoCutoutOverlay
	

# Audio
PRODUCT_PACKAGES += \
    android.hardware.audio@2.0-service \
    android.hardware.audio@2.0-impl \
    android.hardware.audio@5.0 \
    android.hardware.audio@5.0-impl \
    android.hardware.audio.common@2.0-util \
    android.hardware.audio.common@5.0 \
    android.hardware.audio.common@5.0-util \
    android.hardware.audio.effect@2.0-impl \
    android.hardware.audio.effect@5.0 \
    android.hardware.audio.effect@5.0-impl \
    android.hardware.soundtrigger@2.2-impl \
    audio.a2dp.default \
    audio.hearing_aid.default \
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

# Hardware
PRODUCT_BOARD_PLATFORM := sdm710
PRODUCT_USES_QCOM_HARDWARE := true

# Camera
PRODUCT_PACKAGES += \
    android.frameworks.displayservice@1.0 \
    android.hardware.camera.provider@2.4-impl \
    android.hardware.camera.provider@2.4-service \
    libxml2 \
    libdng_sdk \
    libdng_sdk.vendor \
    vendor.qti.hardware.camera.device@1.0.vendor

# Common init scripts
PRODUCT_PACKAGES += \
    fstab.qcom \
    ueventd.rc \
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
    init.msm.usb.configfs.rc \
    init.qcom.usb.rc \
    init.safailnet.rc \
    init.power.rc \
    init.qcom.rc \
    init.qcom.factory.rc \
    init.lenovo.rc \
    init.ontim_fac.rc \
    init.target.rc

# Device-specific settings
PRODUCT_PACKAGES += \
	LenovoParts \
	LenovoPocketMode

# Dex preopt
PRODUCT_DEXPREOPT_SPEED_APPS += \
    SystemUI \
    Settings \
    LenovoParts \
    LenovoPocketMode \
    Launcher3 \
    Etar \
    AicpExtras

# Display
PRODUCT_PACKAGES += \
    android.hardware.graphics.composer@2.3-impl \
    android.hardware.graphics.composer@2.3-service \
    android.hardware.memtrack@1.0-impl \
    android.hardware.memtrack@1.0-service \
    android.hardware.graphics.mapper@3.0 \
    android.hardware.graphics.mapper@2.0-impl-qti-display \
    gralloc.sdm710 \
    hwcomposer.sdm710 \
    libdisplayconfig \
    libdisplayconfig.vendor \
    libhwc2on1adapter \
    libhwc2onfbadapter \
    libqdMetaData.system \
    libtinyxml2 \
    libvulkan \
    memtrack.sdm710 \
    vendor.display.config@1.11 \
    vendor.display.config@1.11.vendor \
    vendor.qti.hardware.display.allocator@1.0-service \
    vendor.qti.hardware.display.mapper@3.0.vendor \
    libsdm-disp-vndapis \
    libgui

# DRM
PRODUCT_PACKAGES += \
    android.hardware.drm@1.0-impl \
    android.hardware.drm@1.0-service \
    android.hardware.drm@1.2-service.clearkey

# Freeform Multiwindow
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.software.freeform_window_management.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.freeform_window_management.xml

# Offline charger
PRODUCT_PACKAGES += \
    charger_res_images \
    product_charger_res_images

# ANT+
PRODUCT_PACKAGES += \
    AntHalService \
    com.dsi.ant.antradio_library

# Permissions
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.fingerprint.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.fingerprint.xml \
    external/ant-wireless/antradio-library/com.dsi.ant.antradio_library.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/com.dsi.ant.antradio_library.xml \
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
    frameworks/native/data/etc/handheld_core_hardware.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/handheld_core_hardware.xml

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/qti_whitelist.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/sysconfig/qti_whitelist.xml \
    $(LOCAL_PATH)/permissions/privapp-permissions-qti.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/privapp-permissions-qti.xml \
    $(LOCAL_PATH)/permissions/com.custom.ambient.display.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/com.custom.ambient.display.xml \
    $(LOCAL_PATH)/permissions/privapp-permissions-google.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/privapp-permissions-google.xml \
    $(LOCAL_PATH)/permissions/org.codeaurora.snapcam.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/org.codeaurora.snapcam.xml

# FM
PRODUCT_PACKAGES += \
    FM2 \
    libqcomfm_jni \
    qcom.fmradio

PRODUCT_BOOT_JARS += \
    qcom.fmradio

# HIDL
PRODUCT_PACKAGES += \
    android.hidl.base@1.0 \
    android.hidl.base@1.0_system \
    android.hidl.manager@1.0 \
    android.hidl.manager@1.0_system

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/manifest.xml:$(TARGET_COPY_OUT_VENDOR)/etc/vintf/manifest.xml

# IMS
PRODUCT_PACKAGES += \
    ims-ext-common_system \
    ims_ext_common.xml

PRODUCT_BOOT_JARS += \
	ims-ext-common_system 
	
# Input
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/keylayout/fts_ts.kl:system/usr/keylayout/fts_ts.kl

# IPv6
PRODUCT_PACKAGES += \
    ethertypes \
    libebtc

# Lights
PRODUCT_PACKAGES += \
    android.hardware.light@2.0-service.lenovo \
    lights.sdm710 \
    android.hardware.light@2.0-impl

# Net
PRODUCT_PACKAGES += \
    netutils-wrapper-1.0

# OMX
PRODUCT_PACKAGES += \
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
    android.hardware.power@1.3-service.lenovo-libperfmgr \
    android.hardware.power@1.0-impl \
    android.hardware.power.stats@1.0-service.lenovo

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/powerhint.json:system/etc/powerhint.json \
    $(LOCAL_PATH)/configs/thermal_info_config.json:$(TARGET_COPY_OUT_VENDOR)/etc/thermal_info_config.json \
    $(LOCAL_PATH)/thermal-engine.conf:$(TARGET_COPY_OUT_VENDOR)/etc/thermal-engine.conf
    
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
    hardware/google/pixel

# SoundRecoreder
PRODUCT_PACKAGES += \
	SoundRecorder

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

# WiFi Display
PRODUCT_PACKAGES += \
    libnl

# WiFi
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/wifi/wigig_supplicant.conf:$(TARGET_COPY_OUT_VENDOR)/etc/wifi/wigig_supplicant.conf \
    $(LOCAL_PATH)/wifi/wigig_p2p_supplicant.conf:$(TARGET_COPY_OUT_VENDOR)/etc/wifi/wigig_p2p_supplicant.conf \
    $(LOCAL_PATH)/wifi/icm.conf:$(TARGET_COPY_OUT_VENDOR)/etc/wifi/icm.conf \
    $(LOCAL_PATH)/wifi/p2p_supplicant_overlay.conf:$(TARGET_COPY_OUT_VENDOR)/etc/wifi/p2p_supplicant_overlay.conf \
    $(LOCAL_PATH)/wifi/WCNSS_qcom_cfg.ini:$(TARGET_COPY_OUT_VENDOR)/etc/wifi/WCNSS_qcom_cfg.ini \
    $(LOCAL_PATH)/wifi/wpa_supplicant.conf:$(TARGET_COPY_OUT_VENDOR)/etc/wifi/wpa_supplicant.conf \
    $(LOCAL_PATH)/wifi/wpa_supplicant_overlay.conf:$(TARGET_COPY_OUT_VENDOR)/etc/wifi/wpa_supplicant_overlay.conf \
    $(LOCAL_PATH)/configs/xtwifi.conf:$(TARGET_COPY_OUT_VENDOR)/etc/xtwifi.conf

#ThermalPixel
PRODUCT_PACKAGES += \
  	android.hardware.thermal@2.0-service.lenovo \
    android.hardware.thermal@1.0-impl \
    thermal.sdm710

# Charging
PRODUCT_PACKAGES += \
    charger_res_images \
    product_charger_res_images

#Wfdconfig
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/wfdconfig.xml:$(TARGET_COPY_OUT_VENDOR)/etc/wfdconfig.xml   

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/msm_irqbalance.conf:$(TARGET_COPY_OUT_VENDOR)/etc/msm_irqbalance.conf

# Health
PRODUCT_PACKAGES += \
	android.hardware.health@2.0 \
    android.hardware.health@2.0-impl \
    android.hardware.health@2.0-service

# Context Hub
PRODUCT_PACKAGES += \
    android.hardware.contexthub@1.0-impl.generic \
    android.hardware.contexthub@1.0-service

# IPA
PRODUCT_PACKAGES += \
    ipacm \
    IPACM_cfg.xml

# RenderScript
PRODUCT_PACKAGES += \
    android.hardware.renderscript@1.0-impl

# Vibrator
PRODUCT_PACKAGES += \
    android.hardware.vibrator@1.0-impl \
    android.hardware.vibrator@1.0-service 

# Configstore
PRODUCT_PACKAGES += \
    android.hardware.configstore@1.1-service

# WiFi
PRODUCT_PACKAGES += \
    android.hardware.wifi@1.0-service \
    hostapd \
    hostapd_cli \
    libcld80211 \
    libkeystore-engine-wifi-hidl \
    libkeystore-wifi-hidl \
    libwifi-hal-ctrl \
    libwifi-hal-qcom \
    libwpa_client \
    vendor.qti.hardware.wifi.hostapd@1.1.vendor \
    vendor.qti.hardware.wifi.supplicant@2.1.vendor \
    wpa_cli \
    wpa_supplicant \
    wpa_supplicant.conf

# Radio
PRODUCT_PACKAGES += \
    android.hardware.radio@1.2 \
    android.hardware.radio@1.3 \
    android.hardware.radio@1.4 \
    android.hardware.radio.config@1.2 \
    android.hardware.radio.config@1.1 \
    android.hardware.radio.config@1.0 \
    android.hardware.secure_element@1.0 \
    android.hardware.secure_element@1.0-service \
    libcnefeatureconfig \
    libjson \
    librmnetctl \
    libxml2 \
    libprotobuf-cpp-full

# Broadcast
PRODUCT_PACKAGES += \
    android.hardware.broadcastradio@1.0-impl

# Atrace
 PRODUCT_PACKAGES += \
    android.hardware.atrace@1.0-service

# Sensors
PRODUCT_PACKAGES += \
    libsensorndkbridge \
    libgui_vendor

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
    $(LOCAL_PATH)/configs/IPACM_cfg.xml:$(TARGET_COPY_OUT_VENDOR)/etc/IPACM_cfg.xml \
    $(LOCAL_PATH)/configs/lowi.conf:$(TARGET_COPY_OUT_VENDOR)/etc/lowi.conf    
