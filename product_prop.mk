#
# Copyright (C) 2020 AICP
#
# SPDX-License-Identifier: Apache-2.0
#
# QC framework value-adds
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    ro.vendor.qti.va_aosp.support=1

PRODUCT_PRODUCT_PROPERTIES += \
    ro.vendor.qti.va_aosp.support=1 \

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

# Enable blurs
PRODUCT_PRODUCT_PROPERTIES += \
    ro.surface_flinger.supports_background_blur=1 \
    ro.sf.blurs_are_expensive=1 \
    persist.sys.sf.disable_blurs=1
    
# LMKD
PRODUCT_PRODUCT_PROPERTIES += \
    ro.config.low_ram=false

# Charger
PRODUCT_PRODUCT_PROPERTIES += \
   ro.charger.enable_suspend=true

# IORap
PRODUCT_PRODUCT_PROPERTIES += \
   iorapd.readahead.enable=true

# Dalvik
PRODUCT_PRODUCT_PROPERTIES += \
	dalvik.vm.dex2oat64.enabled=true

# ART
PRODUCT_PRODUCT_PROPERTIES += \
    pm.dexopt.boot=verify \
    pm.dexopt.first-boot=verify \
    pm.dexopt.install=speed-profile \
    dalvik.vm.image-dex2oat-filter=speed \
    dalvik.vm.image-dex2oat-threads=8 \
    dalvik.vm.dex2oat-filter=speed \
    dalvik.vm.dex2oat-threads=8

    # Better Ram
PRODUCT_PROPERTY_OVERRIDES += \
    ro.config.fha_enable=true \
    ro.sys.fw.bg_apps_limit=32 \
    ro.config.dha_cached_max=16 \
    ro.config.dha_empty_max=42 \
    ro.config.dha_empty_init=32 \
    ro.config.dha_lmk_scale=0.545 \
    ro.config.dha_th_rate=2.3 \
    ro.config.sdha_apps_bg_max=64 \
    ro.config.sdha_apps_bg_min=8
 

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

# Enable fluence for audio/voice recording
PRODUCT_PRODUCT_PROPERTIES += \
    persist.vendor.audio.fluence.audiorec=true \
    persist.vendor.audio.fluence.voicerec=true \
    persist.audio.fluence.voicecall=true \
    persist.audio.fluence.voicerec=true

#PRODUCT_PRODUCT_PROPERTIES += \
#	ro.treble.enabled=false

PRODUCT_PROPERTY_OVERRIDES += \
    ro.hardware.vulkan=adreno \
    ro.hardware.egl=adreno

# Enable iorapd perfetto tracing for app starts
PRODUCT_PROPERTY_OVERRIDES += \
    iorapd.perfetto.enable=true

# Power-saving props
PRODUCT_PRODUCT_PROPERTIES += \
    ro.vold.umsdirtyratio=20 \
    ro.ril.disable.power.collapse=0 \
    power.saving.mode=1 \
    pm.sleep_mode=1

# Eng
ifeq ($(TARGET_BUILD_VARIANT),eng)
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
    ro.persist.partition.support=no
endif
# Userdebug
ifeq ($(TARGET_BUILD_VARIANT),userdebug)
PRODUCT_PRODUCT_PROPERTIES += \
    ro.secure=1 \
    ro.adb.secure=1
endif