#
# Copyright (C) 2021 AICP
#
# SPDX-License-Identifier: Apache-2.0
#
# Graphics
PRODUCT_PROPERTY_OVERRIDES += \
	debug.renderengine.backend=skiaglthreaded \
    renderthread.skia.reduceopstasksplitting=true \
	ro.opengles.version=196610 \
	ro.hardware.keystore_desede=true \
	debug.sf.hw=0 \
	debug.egl.hw=0 \
    ro.hardware.vulkan=adreno \
    ro.hardware.egl=adreno

# PASR
PRODUCT_PROPERTY_OVERRIDES += \
	vendor.power.pasr.enabled=true

# Keyguard
PRODUCT_PROPERTY_OVERRIDES += \
	keyguard.no_require_sim=true

# IOCGRP
PRODUCT_PROPERTY_OVERRIDES += \
	ro.vendor.iocgrp.config=1

# Display
PRODUCT_PROPERTY_OVERRIDES += \
	ro.vendor.display.cabl=2 \
	vendor.display.enable_default_color_mode=1 \
	persist.sys.sf.native_mode=0

# Perf Dummy
PRODUCT_PROPERTY_OVERRIDES += \
	ro.vendor.extension_library=libqti-perfd-client.so

# App launch prefetching (IORapd)
PRODUCT_PROPERTY_OVERRIDES += \
	ro.iorapd.enable=false \
	iorapd.perfetto.enable=false \
	iorapd.readahead.enable=false \
	persist.device_config.runtime_native_boot.iorap_readahead_enable=false

# Radio
PRODUCT_PROPERTY_OVERRIDES += \
	ro.com.android.dataroaming=false \
	persist.radio.multisim.config=dsds \
	ro.carrier=unknown \
	persist.vendor.radio.apm_sim_not_pwdn=1 \
	persist.vendor.radio.sib16_support=1 \
	persist.vendor.radio.custom_ecc=1 \
	persist.vendor.radio.rat_on=combine \
	sys.vendor.shutdown.waittime=500 \
	persist.vendor.radio.procedure_bytes=SKIP

# Factory Reset Protection
PRODUCT_PROPERTY_OVERRIDES += \
	ro.frp.pst=/dev/block/bootdevice/by-name/frp

# Audio
PRODUCT_PROPERTY_OVERRIDES += \
	ro.config.vc_call_vol_steps=6 \
	persist.vendor.audio.fluence.speaker=false \
	persist.vendor.audio.endcall.delay=600 \
	af.fast_track_multiplier=1 \
	vendor.audio_hal.period_size=192 \
	persist.vendor.audio.ambisonic.capture=false \
	persist.vendor.audio.ambisonic.auto.profile=false \
	ro.vendor.audio.sdk.fluencetype=fluence \
	persist.vendor.audio.fluence.tmic.enabled=false \
	vendor.audio.apptype.multirec.enabled=false \
	vendor.audio.record.multiple.enabled=false \
	persist.vendor.audio.spv3.enable=true \
	persist.vendor.audio.avs.afe_api_version=2 \
	vendor.audio.tunnel.encode=false \
	persist.vendor.audio.ras.enabled=false \
	vendor.audio.offload.buffer.size.kb=256 \
	audio.offload.min.duration.secs=30 \
	audio.offload.video=true \
	vendor.audio.offload.track.enable=true \
	audio.deep_buffer.media=true \
	vendor.voice.path.for.pcm.voip=true \
	vendor.audio.offload.multiaac.enable=true \
	vendor.audio.dolby.ds2.enabled=false \
	vendor.audio.dolby.ds2.hardbypass=false \
	vendor.audio.offload.multiple.enabled=false \
	vendor.audio.offload.passthrough=false \
	ro.vendor.audio.sdk.ssr=false \
	vendor.audio.offload.gapless.enabled=true \
	vendor.audio.safx.pbe.enabled=false \
	vendor.audio.parser.ip.buffer.size=262144 \
	vendor.audio.flac.sw.decoder.24bit=true \
	vendor.audio.use.sw.alac.decoder=true \
	vendor.audio.use.sw.ape.decoder=true \
	vendor.audio.hw.aac.encoder=true \
	persist.vendor.audio.hifi.int_codec=true \
	ro.af.client_heap_size_kbyte=7168 \
	vendor.audio.keep_alive.disabled=false \
	vendor.audio.volume.headset.gain.depcal=true \
	vendor.audio.feature.a2dp_offload.enable=true \
	vendor.audio.feature.afe_proxy.enable=true \
	vendor.audio.feature.anc_headset.enable=true \
	vendor.audio.feature.battery_listener.enable=false \
	vendor.audio.feature.compr_cap.enable=false \
	vendor.audio.feature.compress_in.enable=false \
	vendor.audio.feature.compress_meta_data.enable=true \
	vendor.audio.feature.compr_voip.enable=false \
	vendor.audio.feature.concurrent_capture.enable=false \
	vendor.audio.feature.custom_stereo.enable=true \
	vendor.audio.feature.display_port.enable=true \
	vendor.audio.feature.dsm_feedback.enable=false \
	vendor.audio.feature.dynamic_ecns.enable=false \
	vendor.audio.feature.ext_hw_plugin.enable=false \
	vendor.audio.feature.external_dsp.enable=false \
	vendor.audio.feature.external_speaker.enable=false \
	vendor.audio.feature.external_speaker_tfa.enable=false \
	vendor.audio.feature.fluence.enable=true \
	vendor.audio.feature.fm.enable=true \
	vendor.audio.feature.hdmi_edid.enable=true \
	vendor.audio.feature.hdmi_passthrough.enable=true \
	vendor.audio.feature.hfp.enable=true \
	vendor.audio.feature.hifi_audio.enable=true \
	vendor.audio.feature.hwdep_cal.enable=false \
	vendor.audio.feature.incall_music.enable=false \
	vendor.audio.feature.multi_voice_session.enable=true \
	vendor.audio.feature.keep_alive.enable=false \
	vendor.audio.feature.kpi_optimize.enable=false \
	vendor.audio.feature.maxx_audio.enable=false \
	vendor.audio.feature.ras.enable=true \
	vendor.audio.feature.record_play_concurency.enable=false \
	vendor.audio.feature.src_trkn.enable=true \
	vendor.audio.feature.spkr_prot.enable=true \
	vendor.audio.feature.ssrec.enable=true \
	vendor.audio.feature.usb_offload.enable=true \
	vendor.audio.feature.usb_offload_burst_mode.enable=false \
	vendor.audio.feature.usb_offload_sidetone_volume.enable=false \
	vendor.audio.feature.deepbuffer_as_primary.enable=false \
	vendor.audio.feature.vbat.enable=true \
	vendor.audio.feature.wsa.enable=false \
	vendor.audio.feature.audiozoom.enable=false \
	vendor.audio.feature.snd_mon.enable=true \
	vendor.audio.hal.boot.timeout.ms=20000 \
	audio.sys.noisy.broadcast.delay=500 \
	audio.sys.mute.latency.factor=2 \
	audio.sys.routing.latency=0 \
	media.stagefright.audio.deep=false

# Bluetooth
PRODUCT_PROPERTY_OVERRIDES += \
	persist.vendor.qcom.bluetooth.soc=cherokee \
	sys.autosuspend.timeout=500000 \
	persist.vendor.qcom.bluetooth.enable.splita2dp=true \
	persist.vendor.qcom.bluetooth.a2dp_offload_cap=sbc-aptx-aptxtws-aptxhd-aac-ldac \
	ro.bluetooth.a2dp_offload.supported=true \
	persist.bluetooth.a2dp_offload.disabled=false \
	persist.bluetooth.a2dp_offload.cap=sbc-aptx-aptxtws-aptxhd-aac-ldac \
	ro.vendor.bluetooth.wipower=false \
	persist.vendor.qcom.bluetooth.aac_frm_ctl.enabled=true \
	persist.vendor.qcom.bluetooth.twsp_state.enabled=false \
	vendor.qcom.bluetooth.soc=cherokee

# Media
PRODUCT_PROPERTY_OVERRIDES += \
	debug.stagefright.omx_default_rank=0 \
	debug.stagefright.ccodec=1

# Network manager
PRODUCT_PROPERTY_OVERRIDES += \
	persist.vendor.data.iwlan.enable=true \
	ro.telephony.iwlan_operation_mode=legacy

# USB
PRODUCT_PROPERTY_OVERRIDES += \
	vendor.usb.diag.func.name=diag \
	vendor.usb.use_ffs_mtp=0

# VSync for CPU rendered app
PRODUCT_PROPERTY_OVERRIDES += \
	debug.cpurend.vsync=false

# Additional props
PRODUCT_PROPERTY_OVERRIDES += \
	persist.vendor.qti.inputopts.enable=true \
	persist.vendor.qti.inputopts.movetouchslop=0.6

# Camera
PRODUCT_PROPERTY_OVERRIDES += \
	log.tag.CHIUSECASE=ERROR \
	persist.vendor.camera.logInfoMask=false

# DPM
PRODUCT_PROPERTY_OVERRIDES += \
	persist.vendor.dpmhalservice.enable=1

# SoC
PRODUCT_PROPERTY_OVERRIDES += \
	ro.soc.manufacturer=Qualcomm \
	ro.soc.model=SDM710

# HEH filename encryption is being dropped
PRODUCT_PROPERTY_OVERRIDES += \
    ro.crypto.volume.filenames_mode=aes-256-cts

# Apex
PRODUCT_PROPERTY_OVERRIDES += \
	ro.apex.updatable=false
	

