LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)
LOCAL_MODULE := remove_packages
LOCAL_MODULE_CLASS := APPS
LOCAL_MODULE_TAGS := optional
LOCAL_OVERRIDES_PACKAGES := CalculatorGooglePrebuilt CalendarGooglePrebuilt FlipendoPrebuilt TurboPrebuilt DevicePersonalizationPrebuiltPixel2021 DeviceIntelligenceNetworkPrebuilt Eleven AudioFX Updater OPWidget
LOCAL_UNINSTALLABLE_MODULE := true
LOCAL_CERTIFICATE := PRESIGNED
LOCAL_SRC_FILES := /dev/null
include $(BUILD_PREBUILT)