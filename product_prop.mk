#
# Copyright (C) 2020 AICP
#
# SPDX-License-Identifier: Apache-2.0
#

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

#Surfaceflinger
PRODUCT_PRODUCT_PROPERTIES += \
    ro.surface_flinger.max_frame_buffer_acquired_buffers=3 \
    ro.surface_flinger.vsync_event_phase_offset_ns=2000000 \
    ro.surface_flinger.force_hwc_copy_for_virtual_displays=true \
	ro.surface_flinger.has_HDR_display=true \
	ro.surface_flinger.has_wide_color_display=true \
	ro.surface_flinger.max_virtual_display_dimension=4096 \
	ro.surface_flinger.protected_contents=true \
	ro.surface_flinger.use_color_management=true \
	ro.surface_flinger.wcg_composition_dataspace=143261696 \
    ro.surface_flinger.vsync_sf_event_phase_offset_ns=6000000

# Enable blurs
PRODUCT_PRODUCT_PROPERTIES += \
    ro.surface_flinger.supports_background_blur=1 \
    ro.sf.blurs_are_expensive=1
    
# LMKD
PRODUCT_PRODUCT_PROPERTIES += \
    ro.config.low_ram=false \
    ro.lmk.log_stats=true

# Charger
PRODUCT_PRODUCT_PROPERTIES += \
   ro.charger.enable_suspend=true

# IORap
PRODUCT_PRODUCT_PROPERTIES += \
   iorapd.readahead.enable=true

# Perf
PRODUCT_PRODUCT_PROPERTIES += \
	ro.sys.fw.dex2oat_thread_count=6

# Dalvik
PRODUCT_PRODUCT_PROPERTIES += \
	dalvik.vm.dex2oat64.enabled=true

# ART
PRODUCT_PRODUCT_PROPERTIES += \
    dalvik.vm.dex2oat-cpu-set=0,1,2,3,4,5,6,7 \
    dalvik.vm.dex2oat-filter=quicken \
    dalvik.vm.dex2oat-threads=8 \
    dalvik.vm.image-dex2oat-cpu-set=0,1,2,3,4,5,6,7 \
    dalvik.vm.image-dex2oat-filter=quicken \
    dalvik.vm.image-dex2oat-threads=8
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
	pm.dexopt.inactive=verify \
	pm.dexopt.shared=speed \
	dalvik.vm.dex2oat-resolve-startup-strings=true \
	dalvik.vm.dex2oat-max-image-block-size=524288 \
	dalvik.vm.minidebuginfo=true \
	dalvik.vm.dex2oat-minidebuginfo=true

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

PRODUCT_PRODUCT_PROPERTIES += \
	ro.treble.enabled=false

PRODUCT_PROPERTY_OVERRIDES += \
    ro.hardware.vulkan=adreno \
    ro.hardware.egl=adreno

# Enable iorapd perfetto tracing for app starts
PRODUCT_PROPERTY_OVERRIDES += \
    iorapd.perfetto.enable=true

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