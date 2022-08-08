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

# Disable blurs
PRODUCT_PRODUCT_PROPERTIES += \
    ro.surface_flinger.supports_background_blur=0
    
# LMKD
PRODUCT_PRODUCT_PROPERTIES += \
    ro.config.low_ram=false \
    ro.lmk.kill_heaviest_task=true \
    ro.lmk.use_new_strategy=true \
    ro.lmk.enable_watermark_check=true \
    ro.lmk.enable_userspace_lmk=true \
    ro.lmk.enhance_batch_kill=false \
    ro.lmk.super_critical=701 \
    ro.lmk.filecache_min_kb=153600 \
    ro.lmk.kill_timeout_ms=50 \
    ro.lmk.stall_limit_critical=40 \
    ro.lmk.psi_scrit_complete_stall_ms=150 \
    ro.lmk.direct_reclaim_pressure=45 \
    ro.lmk.reclaim_scan_threshold=0 \

# Charger
PRODUCT_PRODUCT_PROPERTIES += \
   ro.charger.enable_suspend=true

# Dalvik
PRODUCT_PRODUCT_PROPERTIES += \
	dalvik.vm.dex2oat64.enabled=true

# ART
PRODUCT_PRODUCT_PROPERTIES += \
    pm.dexopt.boot=verify \
    pm.dexopt.first-boot=verify \
    pm.dexopt.install=speed-profile \
    dalvik.vm.image-dex2oat-filter=speed \
    dalvik.vm.systemuicompilerfilter=speed \
    dalvik.vm.image-dex2oat-threads=8 \
    dalvik.vm.dex2oat-filter=speed \
    dalvik.vm.dex2oat-threads=8
 

#Enable 16 bit PCM offload by default
PRODUCT_PRODUCT_PROPERTIES += \
	audio.offload.pcm.16bit.enable=true

#Enable 24 bit PCM offload by default
PRODUCT_PRODUCT_PROPERTIES += \
	audio.offload.pcm.24bit.enable=true

# Enable AAC frame ctl for A2DP sinks
PRODUCT_PRODUCT_PROPERTIES += \
    persist.vendor.bt.aac_frm_ctl.enabled=true

# Enable fluence for audio/voice recording
PRODUCT_PRODUCT_PROPERTIES += \
    persist.vendor.audio.fluence.audiorec=true \
    persist.vendor.audio.fluence.voicerec=true \
    persist.audio.fluence.voicecall=true \
    persist.audio.fluence.voicerec=true

# App Launch Blur
PRODUCT_PRODUCT_PROPERTIES += \
    ro.launcher.blur.appLaunch=false

# IMS
PRODUCT_PRODUCT_PROPERTIES += \
ro.telephony.block_binder_thread_on_incoming_calls=false

# BG apps limit
PRODUCT_PRODUCT_PROPERTIES += \
    persist.sys.fw.bg_apps_limit=128

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