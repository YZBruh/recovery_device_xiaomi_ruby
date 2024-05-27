#####################################
#                                   #
#         Include prebuilts         #
#                                   #
#####################################

#####
# Set some variables
#####

RUBY_SYSTEMLIB := root/system/lib64
RUBY_SYSTEMETC := root/system/etc
RUBY_SYSTEMBIN := root/system/bin
RUBY_VENDORLIB := root/vendor/lib64
RUBY_VENDORETC := root/vendor/etc
RUBY_VENDORTHH := root/vendor/thh/ta
RUBY_VENDORFRW := root/vendor/firmware

#####
# Include root directory files
#####

include $(CLEAR_VARS)
LOCAL_MODULE       := init.microtrust.rc
LOCAL_MODULE_TAGS  := optional
LOCAL_MODULE_CLASS := ETC
LOCAL_SRC_FILES    := root/init.microtrust.rc
LOCAL_MODULE_PATH  := $(TARGET_RECOVERY_ROOT_OUT)
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE       := init.recovery.mt6877.rc
LOCAL_MODULE_TAGS  := optional
LOCAL_MODULE_CLASS := ETC
LOCAL_SRC_FILES    := root/init.recovery.mt6877.rc
LOCAL_MODULE_PATH  := $(TARGET_RECOVERY_ROOT_OUT)
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE       := init.recovery.usb.rc
LOCAL_MODULE_TAGS  := optional
LOCAL_MODULE_CLASS := ETC
LOCAL_SRC_FILES    := root/init.recovery.usb.rc
LOCAL_MODULE_PATH  := $(TARGET_RECOVERY_ROOT_OUT)
include $(BUILD_PREBUILT)

#####
# Include first_stage_ramdisk files
#####

include $(CLEAR_VARS)
LOCAL_MODULE       := fstab.emmc
LOCAL_MODULE_TAGS  := optional
LOCAL_MODULE_CLASS := ETC
LOCAL_SRC_FILES    := root/first_stage_ramdisk/fstab.emmc
LOCAL_MODULE_PATH  := $(TARGET_RECOVERY_ROOT_OUT)/first_stage_ramdisk
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE       := fstab.mt6877
LOCAL_MODULE_TAGS  := optional
LOCAL_MODULE_CLASS := ETC
LOCAL_SRC_FILES    := root/first_stage_ramdisk/fstab.mt6877
LOCAL_MODULE_PATH  := $(TARGET_RECOVERY_ROOT_OUT)/first_stage_ramdisk
include $(BUILD_PREBUILT)

#####
# Include executable system files
#####

include $(CLEAR_VARS)
LOCAL_MODULE       := android.hardware.gatekeeper@1.0-service-ruby
LOCAL_MODULE_TAGS  := optional
LOCAL_MODULE_CLASS := EXECUTABLES
LOCAL_SRC_FILES    := $(RUBY_SYSTEMBIN)/android.hardware.gatekeeper@1.0-service
LOCAL_MODULE_STEM  := android.hardware.gatekeeper@1.0-service
LOCAL_MODULE_PATH  := $(TARGET_RECOVERY_ROOT_OUT)/system/bin
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE       := android.hardware.keymaster@4.1-service.beanpod
LOCAL_MODULE_TAGS  := optional
LOCAL_MODULE_CLASS := EXECUTABLES
LOCAL_SRC_FILES    := $(RUBY_SYSTEMBIN)/android.hardware.keymaster@4.1-service.beanpod
LOCAL_MODULE_PATH  := $(TARGET_RECOVERY_ROOT_OUT)/system/bin
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE       := teei_daemon
LOCAL_MODULE_TAGS  := optional
LOCAL_MODULE_CLASS := EXECUTABLES
LOCAL_SRC_FILES    := $(RUBY_SYSTEMBIN)/teei_daemon
LOCAL_MODULE_PATH  := $(TARGET_RECOVERY_ROOT_OUT)/system/bin
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE       := mtk_plpath_utils
LOCAL_MODULE_TAGS  := optional
LOCAL_MODULE_CLASS := EXECUTABLES
LOCAL_SRC_FILES    := $(RUBY_SYSTEMBIN)/mtk_plpath_utils
LOCAL_MODULE_PATH  := $(TARGET_RECOVERY_ROOT_OUT)/system/bin
include $(BUILD_PREBUILT)

#####
# Include shared system libraries
#####

include $(CLEAR_VARS)
LOCAL_MODULE       := libmtk_bsg.so
LOCAL_MODULE_TAGS  := optional
LOCAL_SRC_FILES    := $(RUBY_SYSTEMLIB)/libmtk_bsg.so
LOCAL_MODULE_PATH  := $(TARGET_RECOVERY_ROOT_OUT)/system/lib64
include $(PREBUILT_SHARED_LIBRARY)

include $(CLEAR_VARS)
LOCAL_MODULE       := android.hardware.boot@1.0-impl-1.2-mtkimpl.so
LOCAL_MODULE_TAGS  := optional
LOCAL_SRC_FILES    := $(RUBY_SYSTEMLIB)/android.hardware.boot@1.0-impl-1.2-mtkimpl.so
LOCAL_MODULE_PATH  := $(TARGET_RECOVERY_ROOT_OUT)/system/lib64/hw
include $(PREBUILT_SHARED_LIBRARY)

#####
# Include other system files
#####

include $(CLEAR_VARS)
LOCAL_MODULE       := ruby_task_profiles.json
LOCAL_MODULE_TAGS  := optional
LOCAL_MODULE_CLASS := ETC
LOCAL_SRC_FILES    := $(RUBY_SYSTEMETC)/task_profiles.json
LOCAL_MODULE_STEM  := task_profiles.json
LOCAL_MODULE_PATH  := $(TARGET_RECOVERY_ROOT_OUT)/system/etc
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE       := twrp.flags
LOCAL_MODULE_TAGS  := optional
LOCAL_MODULE_CLASS := ETC
LOCAL_SRC_FILES    := $(RUBY_SYSTEMETC)/twrp.flags
LOCAL_MODULE_PATH  := $(TARGET_RECOVERY_ROOT_OUT)/etc
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE       := manifest.xml
LOCAL_MODULE_TAGS  := optional
LOCAL_MODULE_CLASS := ETC
LOCAL_SRC_FILES    := $(RUBY_SYSTEMETC)/vintf/manifest.xml
LOCAL_MODULE_PATH  := $(TARGET_RECOVERY_ROOT_OUT)/system/etc
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE       := compatibility_matrix.device.xml
LOCAL_MODULE_TAGS  := optional
LOCAL_MODULE_CLASS := ETC
LOCAL_SRC_FILES    := $(RUBY_SYSTEMETC)/vintf/compatibility_matrix.device.xml
LOCAL_MODULE_PATH  := $(TARGET_RECOVERY_ROOT_OUT)/system/etc
include $(BUILD_PREBUILT)

#####
# Include executable vendor files
#####

include $(CLEAR_VARS)
LOCAL_MODULE       := vendor.xiaomi.hardware.vibratorfeature.service
LOCAL_MODULE_TAGS  := optional
LOCAL_MODULE_CLASS := EXECUTABLES
LOCAL_SRC_FILES    := $(RUBY_VENDORBIN)/hw/vendor.xiaomi.hardware.vibratorfeature.service
LOCAL_MODULE_PATH  := $(TARGET_RECOVERY_ROOT_OUT)/vendor/bin/hw
include $(BUILD_PREBUILT)

#####
# Include shared vendor libraries
#####

include $(CLEAR_VARS)
LOCAL_MODULE       := libTEECommon.so
LOCAL_MODULE_TAGS  := optional
LOCAL_SRC_FILES    := $(RUBY_VENDORLIB)/libTEECommon.so
LOCAL_MODULE_PATH  := $(TARGET_RECOVERY_ROOT_OUT)/vendor/lib64
include $(PREBUILT_SHARED_LIBRARY)

include $(CLEAR_VARS)
LOCAL_MODULE       := libteei_daemon_vfs.so
LOCAL_MODULE_TAGS  := optional
LOCAL_SRC_FILES    := $(RUBY_VENDORLIB)/libteei_daemon_vfs.so
LOCAL_MODULE_PATH  := $(TARGET_RECOVERY_ROOT_OUT)/vendor/lib64
include $(PREBUILT_SHARED_LIBRARY)

include $(CLEAR_VARS)
LOCAL_MODULE       := android.hardware.boot@1.0-impl-1.2-mtkimpl.so
LOCAL_MODULE_TAGS  := optional
LOCAL_SRC_FILES    := $(RUBY_VENDORLIB)/hw/android.hardware.boot@1.0-impl-1.2-mtkimpl.so
LOCAL_MODULE_PATH  := $(TARGET_RECOVERY_ROOT_OUT)/vendor/lib64/hw
include $(PREBUILT_SHARED_LIBRARY)

include $(CLEAR_VARS)
LOCAL_MODULE       := android.hardware.gatekeeper@1.0-impl.so
LOCAL_MODULE_TAGS  := optional
LOCAL_SRC_FILES    := $(RUBY_VENDORLIB)/hw/android.hardware.gatekeeper@1.0-impl.so
LOCAL_MODULE_PATH  := $(TARGET_RECOVERY_ROOT_OUT)/vendor/lib64/hw
include $(PREBUILT_SHARED_LIBRARY)

include $(CLEAR_VARS)
LOCAL_MODULE       := gatekeeper.beanpod.so
LOCAL_MODULE_TAGS  := optional
LOCAL_SRC_FILES    := $(RUBY_VENDORLIB)/hw/gatekeeper.beanpod.so
LOCAL_MODULE_PATH  := $(TARGET_RECOVERY_ROOT_OUT)/vendor/lib64/hw
include $(PREBUILT_SHARED_LIBRARY)

include $(CLEAR_VARS)
LOCAL_MODULE       := gatekeeper.default.so
LOCAL_MODULE_TAGS  := optional
LOCAL_SRC_FILES    := $(RUBY_VENDORLIB)/hw/gatekeeper.default.so
LOCAL_MODULE_PATH  := $(TARGET_RECOVERY_ROOT_OUT)/vendor/lib64/hw
include $(PREBUILT_SHARED_LIBRARY)

include $(CLEAR_VARS)
LOCAL_MODULE       := kmsetkey.beanpod.so
LOCAL_MODULE_TAGS  := optional
LOCAL_SRC_FILES    := $(RUBY_VENDORLIB)/hw/kmsetkey.beanpod.so
LOCAL_MODULE_PATH  := $(TARGET_RECOVERY_ROOT_OUT)/vendor/lib64/hw
include $(PREBUILT_SHARED_LIBRARY)

include $(CLEAR_VARS)
LOCAL_MODULE       := libSoftGatekeeper.so
LOCAL_MODULE_TAGS  := optional
LOCAL_SRC_FILES    := $(RUBY_VENDORLIB)/hw/libSoftGatekeeper.so
LOCAL_MODULE_PATH  := $(TARGET_RECOVERY_ROOT_OUT)/vendor/lib64/hw
include $(PREBUILT_SHARED_LIBRARY)

include $(CLEAR_VARS)
LOCAL_MODULE       := libimsg_log.so
LOCAL_MODULE_TAGS  := optional
LOCAL_SRC_FILES    := $(RUBY_VENDORLIB)/libimsg_log.so
LOCAL_MODULE_PATH  := $(TARGET_RECOVERY_ROOT_OUT)/vendor/lib64/hw
include $(PREBUILT_SHARED_LIBRARY)

#####
# Include other vendor files
#####

include $(CLEAR_VARS)
LOCAL_MODULE       := ruby_ueventd.rc
LOCAL_MODULE_TAGS  := optional
LOCAL_MODULE_CLASS := ETC
LOCAL_SRC_FILES    := $(RUBY_VENDORETC)/ueventd.rc
LOCAL_MODULE_STEM  := ueventd.rc
LOCAL_MODULE_PATH  := $(TARGET_RECOVERY_ROOT_OUT)/vendor/etc
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE       := ruby_manifest.xml
LOCAL_MODULE_TAGS  := optional
LOCAL_MODULE_CLASS := ETC
LOCAL_SRC_FILES    := $(RUBY_VENDORETC)/vintf/manifest.xml
LOCAL_MODULE_STEM  := manifest.xml
LOCAL_MODULE_PATH  := $(TARGET_RECOVERY_ROOT_OUT)/vendor/etc/vintf
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE       := compatibility_matrix.xml
LOCAL_MODULE_TAGS  := optional
LOCAL_MODULE_CLASS := ETC
LOCAL_SRC_FILES    := $(RUBY_VENDORETC)/vintf/compatibility_matrix.xml
LOCAL_MODULE_PATH  := $(TARGET_RECOVERY_ROOT_OUT)/vendor/etc/vintf
include $(BUILD_PREBUILT)

#####
# Include vendor firmware files
#####

include $(CLEAR_VARS)
LOCAL_MODULE       := aw8697_haptic.bin
LOCAL_MODULE_TAGS  := optional
LOCAL_MODULE_CLASS := ETC
LOCAL_SRC_FILES    := $(RUBY_VENDORFRW)/firmware/aw8697_haptic.bin
LOCAL_MODULE_PATH  := $(TARGET_RECOVERY_ROOT_OUT)/vendor/firmware
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE       := aw8697_rtp_1.bin
LOCAL_MODULE_TAGS  := optional
LOCAL_MODULE_CLASS := ETC
LOCAL_SRC_FILES    := $(RUBY_VENDORFRW)/firmware/aw8697_rtp_1.bin
LOCAL_MODULE_PATH  := $(TARGET_RECOVERY_ROOT_OUT)/vendor/firmware
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE       := aw882xx_acf.bin
LOCAL_MODULE_TAGS  := optional
LOCAL_MODULE_CLASS := ETC
LOCAL_SRC_FILES    := $(RUBY_VENDORFRW)/firmware/aw882xx_acf.bin
LOCAL_MODULE_PATH  := $(TARGET_RECOVERY_ROOT_OUT)/vendor/firmware
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE       := aw882xx_acf_m16.bin
LOCAL_MODULE_TAGS  := optional
LOCAL_MODULE_CLASS := ETC
LOCAL_SRC_FILES    := $(RUBY_VENDORFRW)/firmware/aw882xx_acf_m16.bin
LOCAL_MODULE_PATH  := $(TARGET_RECOVERY_ROOT_OUT)/vendor/firmware
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE       := aw882xx_acf_m16u.bin
LOCAL_MODULE_TAGS  := optional
LOCAL_MODULE_CLASS := ETC
LOCAL_SRC_FILES    := $(RUBY_VENDORFRW)/firmware/aw882xx_acf_m16u.bin
LOCAL_MODULE_PATH  := $(TARGET_RECOVERY_ROOT_OUT)/vendor/firmware
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE       := focaltech_ts_fw.bin
LOCAL_MODULE_TAGS  := optional
LOCAL_MODULE_CLASS := ETC
LOCAL_SRC_FILES    := $(RUBY_VENDORFRW)/firmware/focaltech_ts_fw.bin
LOCAL_MODULE_PATH  := $(TARGET_RECOVERY_ROOT_OUT)/vendor/firmware
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE       := goodix_cfg_group_m16_GVO.bin
LOCAL_MODULE_TAGS  := optional
LOCAL_MODULE_CLASS := ETC
LOCAL_SRC_FILES    := $(RUBY_VENDORFRW)/firmware/goodix_cfg_group_m16_GVO.bin
LOCAL_MODULE_PATH  := $(TARGET_RECOVERY_ROOT_OUT)/vendor/firmware
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE       := goodix_cfg_group_m16_TM.bin
LOCAL_MODULE_TAGS  := optional
LOCAL_MODULE_CLASS := ETC
LOCAL_SRC_FILES    := $(RUBY_VENDORFRW)/firmware/goodix_cfg_group_m16_TM.bin
LOCAL_MODULE_PATH  := $(TARGET_RECOVERY_ROOT_OUT)/vendor/firmware
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE       := goodix_firmware_m16_GVO.bin
LOCAL_MODULE_TAGS  := optional
LOCAL_MODULE_CLASS := ETC
LOCAL_SRC_FILES    := $(RUBY_VENDORFRW)/firmware/goodix_firmware_m16_GVO.bin
LOCAL_MODULE_PATH  := $(TARGET_RECOVERY_ROOT_OUT)/vendor/firmware
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE       := goodix_firmware_m16_TM.bin
LOCAL_MODULE_TAGS  := optional
LOCAL_MODULE_CLASS := ETC
LOCAL_SRC_FILES    := $(RUBY_VENDORFRW)/firmware/goodix_firmware_m16_TM.bin
LOCAL_MODULE_PATH  := $(TARGET_RECOVERY_ROOT_OUT)/vendor/firmware
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE       := gt1151_default_firmware2.img
LOCAL_MODULE_TAGS  := optional
LOCAL_MODULE_CLASS := ETC
LOCAL_SRC_FILES    := $(RUBY_VENDORFRW)/firmware/gt1151_default_firmware2.img
LOCAL_MODULE_PATH  := $(TARGET_RECOVERY_ROOT_OUT)/vendor/firmware
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE       := gt9886_cfg_6781v01.bin
LOCAL_MODULE_TAGS  := optional
LOCAL_MODULE_CLASS := ETC
LOCAL_SRC_FILES    := $(RUBY_VENDORFRW)/firmware/gt9886_cfg_6781v01.bin
LOCAL_MODULE_PATH  := $(TARGET_RECOVERY_ROOT_OUT)/vendor/firmware
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE       := gt9886_cfg_6785v96.bin
LOCAL_MODULE_TAGS  := optional
LOCAL_MODULE_CLASS := ETC
LOCAL_SRC_FILES    := $(RUBY_VENDORFRW)/firmware/gt9886_cfg_6785v96.bin
LOCAL_MODULE_PATH  := $(TARGET_RECOVERY_ROOT_OUT)/vendor/firmware
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE       := gt9886_cfg_6785v99.bin
LOCAL_MODULE_TAGS  := optional
LOCAL_MODULE_CLASS := ETC
LOCAL_SRC_FILES    := $(RUBY_VENDORFRW)/firmware/gt9886_cfg_6785v99.bin
LOCAL_MODULE_PATH  := $(TARGET_RECOVERY_ROOT_OUT)/vendor/firmware
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE       := gt9886_cfg_6853v01.bin
LOCAL_MODULE_TAGS  := optional
LOCAL_MODULE_CLASS := ETC
LOCAL_SRC_FILES    := $(RUBY_VENDORFRW)/firmware/gt9886_cfg_6853v01.bin
LOCAL_MODULE_PATH  := $(TARGET_RECOVERY_ROOT_OUT)/vendor/firmware
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE       := gt9886_cfg_6873v01.bin
LOCAL_MODULE_TAGS  := optional
LOCAL_MODULE_CLASS := ETC
LOCAL_SRC_FILES    := $(RUBY_VENDORFRW)/firmware/gt9886_cfg_6873v01.bin
LOCAL_MODULE_PATH  := $(TARGET_RECOVERY_ROOT_OUT)/vendor/firmware
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE       := gt9886_cfg_6877v01.bin
LOCAL_MODULE_TAGS  := optional
LOCAL_MODULE_CLASS := ETC
LOCAL_SRC_FILES    := $(RUBY_VENDORFRW)/firmware/gt9886_cfg_6877v01.bin
LOCAL_MODULE_PATH  := $(TARGET_RECOVERY_ROOT_OUT)/vendor/firmware
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE       := gt9886_cfg_6885v01.bin
LOCAL_MODULE_TAGS  := optional
LOCAL_MODULE_CLASS := ETC
LOCAL_SRC_FILES    := $(RUBY_VENDORFRW)/firmware/gt9886_cfg_6885v01.bin
LOCAL_MODULE_PATH  := $(TARGET_RECOVERY_ROOT_OUT)/vendor/firmware
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE       := gt9886_cfg_6885v1.bin
LOCAL_MODULE_TAGS  := optional
LOCAL_MODULE_CLASS := ETC
LOCAL_SRC_FILES    := $(RUBY_VENDORFRW)/firmware/gt9886_cfg_6885v1.bin
LOCAL_MODULE_PATH  := $(TARGET_RECOVERY_ROOT_OUT)/vendor/firmware
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE       := gt9886_cfg_6885v9c.bin
LOCAL_MODULE_TAGS  := optional
LOCAL_MODULE_CLASS := ETC
LOCAL_SRC_FILES    := $(RUBY_VENDORFRW)/firmware/gt9886_cfg_6885v9c.bin
LOCAL_MODULE_PATH  := $(TARGET_RECOVERY_ROOT_OUT)/vendor/firmware
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE       := gt9886_cfg_6893v01.bin
LOCAL_MODULE_TAGS  := optional
LOCAL_MODULE_CLASS := ETC
LOCAL_SRC_FILES    := $(RUBY_VENDORFRW)/firmware/gt9886_cfg_6893v01.bin
LOCAL_MODULE_PATH  := $(TARGET_RECOVERY_ROOT_OUT)/vendor/firmware
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE       := gt9886_cfg_90hz6785.bin
LOCAL_MODULE_TAGS  := optional
LOCAL_MODULE_CLASS := ETC
LOCAL_SRC_FILES    := $(RUBY_VENDORFRW)/firmware/gt9886_cfg_90hz6785.bin
LOCAL_MODULE_PATH  := $(TARGET_RECOVERY_ROOT_OUT)/vendor/firmware
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE       := gt9886_cfg_90hz6877.bin
LOCAL_MODULE_TAGS  := optional
LOCAL_MODULE_CLASS := ETC
LOCAL_SRC_FILES    := $(RUBY_VENDORFRW)/firmware/gt9886_cfg_90hz6877.bin
LOCAL_MODULE_PATH  := $(TARGET_RECOVERY_ROOT_OUT)/vendor/firmware
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE       := gt9886_cfg_90hz6885.bin
LOCAL_MODULE_TAGS  := optional
LOCAL_MODULE_CLASS := ETC
LOCAL_SRC_FILES    := $(RUBY_VENDORFRW)/firmware/gt9886_cfg_90hz6885.bin
LOCAL_MODULE_PATH  := $(TARGET_RECOVERY_ROOT_OUT)/vendor/firmware
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE       := gt9886_cfg_gt9885v1.bin
LOCAL_MODULE_TAGS  := optional
LOCAL_MODULE_CLASS := ETC
LOCAL_SRC_FILES    := $(RUBY_VENDORFRW)/firmware/gt9886_cfg_gt9885v1.bin
LOCAL_MODULE_PATH  := $(TARGET_RECOVERY_ROOT_OUT)/vendor/firmware
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE       := gt9886_firmware_6781v01.bin
LOCAL_MODULE_TAGS  := optional
LOCAL_MODULE_CLASS := ETC
LOCAL_SRC_FILES    := $(RUBY_VENDORFRW)/firmware/gt9886_firmware_6781v01.bin
LOCAL_MODULE_PATH  := $(TARGET_RECOVERY_ROOT_OUT)/vendor/firmware
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE       := gt9886_firmware_6785a4.bin
LOCAL_MODULE_TAGS  := optional
LOCAL_MODULE_CLASS := ETC
LOCAL_SRC_FILES    := $(RUBY_VENDORFRW)/firmware/gt9886_firmware_6785a4.bin
LOCAL_MODULE_PATH  := $(TARGET_RECOVERY_ROOT_OUT)/vendor/firmware
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE       := gt9886_firmware_6785ae.bin
LOCAL_MODULE_TAGS  := optional
LOCAL_MODULE_CLASS := ETC
LOCAL_SRC_FILES    := $(RUBY_VENDORFRW)/firmware/gt9886_firmware_6785ae.bin
LOCAL_MODULE_PATH  := $(TARGET_RECOVERY_ROOT_OUT)/vendor/firmware
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE       := gt9886_firmware_6853v01.bin
LOCAL_MODULE_TAGS  := optional
LOCAL_MODULE_CLASS := ETC
LOCAL_SRC_FILES    := $(RUBY_VENDORFRW)/firmware/gt9886_firmware_6853v01.bin
LOCAL_MODULE_PATH  := $(TARGET_RECOVERY_ROOT_OUT)/vendor/firmware
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE       := gt9886_firmware_6873v01.bin
LOCAL_MODULE_TAGS  := optional
LOCAL_MODULE_CLASS := ETC
LOCAL_SRC_FILES    := $(RUBY_VENDORFRW)/firmware/gt9886_firmware_6873v01.bin
LOCAL_MODULE_PATH  := $(TARGET_RECOVERY_ROOT_OUT)/vendor/firmware
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE       := gt9886_firmware_6877af.bin
LOCAL_MODULE_TAGS  := optional
LOCAL_MODULE_CLASS := ETC
LOCAL_SRC_FILES    := $(RUBY_VENDORFRW)/firmware/gt9886_firmware_6877af.bin
LOCAL_MODULE_PATH  := $(TARGET_RECOVERY_ROOT_OUT)/vendor/firmware
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE       := gt9886_firmware_6877v01.bin
LOCAL_MODULE_TAGS  := optional
LOCAL_MODULE_CLASS := ETC
LOCAL_SRC_FILES    := $(RUBY_VENDORFRW)/firmware/gt9886_firmware_6877v01.bin
LOCAL_MODULE_PATH  := $(TARGET_RECOVERY_ROOT_OUT)/vendor/firmware
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE       := gt9886_firmware_6885a1.bin
LOCAL_MODULE_TAGS  := optional
LOCAL_MODULE_CLASS := ETC
LOCAL_SRC_FILES    := $(RUBY_VENDORFRW)/firmware/gt9886_firmware_6885a1.bin
LOCAL_MODULE_PATH  := $(TARGET_RECOVERY_ROOT_OUT)/vendor/firmware
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE       := gt9886_firmware_6885af.bin
LOCAL_MODULE_TAGS  := optional
LOCAL_MODULE_CLASS := ETC
LOCAL_SRC_FILES    := $(RUBY_VENDORFRW)/firmware/gt9886_firmware_6885af.bin
LOCAL_MODULE_PATH  := $(TARGET_RECOVERY_ROOT_OUT)/vendor/firmware
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE       := gt9886_firmware_6885b0.bin
LOCAL_MODULE_TAGS  := optional
LOCAL_MODULE_CLASS := ETC
LOCAL_SRC_FILES    := $(RUBY_VENDORFRW)/firmware/gt9886_firmware_6885b0.bin
LOCAL_MODULE_PATH  := $(TARGET_RECOVERY_ROOT_OUT)/vendor/firmware
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE       := gt9886_firmware_6885b1.bin
LOCAL_MODULE_TAGS  := optional
LOCAL_MODULE_CLASS := ETC
LOCAL_SRC_FILES    := $(RUBY_VENDORFRW)/firmware/gt9886_firmware_6885b1.bin
LOCAL_MODULE_PATH  := $(TARGET_RECOVERY_ROOT_OUT)/vendor/firmware
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE       := gt9886_firmware_6893v01.bin
LOCAL_MODULE_TAGS  := optional
LOCAL_MODULE_CLASS := ETC
LOCAL_SRC_FILES    := $(RUBY_VENDORFRW)/firmware/gt9886_firmware_6893v01.bin
LOCAL_MODULE_PATH  := $(TARGET_RECOVERY_ROOT_OUT)/vendor/firmware
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE       := gt9896s_firmware_6893v02.bin
LOCAL_MODULE_TAGS  := optional
LOCAL_MODULE_CLASS := ETC
LOCAL_SRC_FILES    := $(RUBY_VENDORFRW)/firmware/gt9896s_firmware_6893v02.bin
LOCAL_MODULE_PATH  := $(TARGET_RECOVERY_ROOT_OUT)/vendor/firmware
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE       := gt9896s_firmware_6893v03.bin
LOCAL_MODULE_TAGS  := optional
LOCAL_MODULE_CLASS := ETC
LOCAL_SRC_FILES    := $(RUBY_VENDORFRW)/firmware/gt9896s_firmware_6893v03.bin
LOCAL_MODULE_PATH  := $(TARGET_RECOVERY_ROOT_OUT)/vendor/firmware
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE       := gt9896s_firmware_6893v04.bin
LOCAL_MODULE_TAGS  := optional
LOCAL_MODULE_CLASS := ETC
LOCAL_SRC_FILES    := $(RUBY_VENDORFRW)/firmware/gt9896s_firmware_6893v04.bin
LOCAL_MODULE_PATH  := $(TARGET_RECOVERY_ROOT_OUT)/vendor/firmware
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE       := gt9896s_firmware_6893v05.bin
LOCAL_MODULE_TAGS  := optional
LOCAL_MODULE_CLASS := ETC
LOCAL_SRC_FILES    := $(RUBY_VENDORFRW)/firmware/gt9896s_firmware_6893v05.bin
LOCAL_MODULE_PATH  := $(TARGET_RECOVERY_ROOT_OUT)/vendor/firmware
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE       := gt9896s_firmware_6895v01.bin
LOCAL_MODULE_TAGS  := optional
LOCAL_MODULE_CLASS := ETC
LOCAL_SRC_FILES    := $(RUBY_VENDORFRW)/firmware/gt9896s_firmware_6895v01.bin
LOCAL_MODULE_PATH  := $(TARGET_RECOVERY_ROOT_OUT)/vendor/firmware
include $(BUILD_PREBUILT)

#####
# Include thh/ta vendor files
#####

include $(CLEAR_VARS)
LOCAL_MODULE       := 0102030405060708090a0b0c0d0e0f10.ta
LOCAL_MODULE_TAGS  := optional
LOCAL_MODULE_CLASS := ETC
LOCAL_SRC_FILES    := $(RUBY_VENDORTHH)/0102030405060708090a0b0c0d0e0f10.ta
LOCAL_MODULE_PATH  := $(TARGET_RECOVERY_ROOT_OUT)/vendor/thh/ta
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE       := 020f0000000000000000000000000000.ta
LOCAL_MODULE_TAGS  := optional
LOCAL_MODULE_CLASS := ETC
LOCAL_SRC_FILES    := $(RUBY_VENDORTHH)/020f0000000000000000000000000000.ta
LOCAL_MODULE_PATH  := $(TARGET_RECOVERY_ROOT_OUT)/vendor/thh/ta
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE       := 05120000000000000000000000000000.ta
LOCAL_MODULE_TAGS  := optional
LOCAL_MODULE_CLASS := ETC
LOCAL_SRC_FILES    := $(RUBY_VENDORTHH)/05120000000000000000000000000000.ta
LOCAL_MODULE_PATH  := $(TARGET_RECOVERY_ROOT_OUT)/vendor/thh/ta
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE       := 06090000000000000000000000000000.ta
LOCAL_MODULE_TAGS  := optional
LOCAL_MODULE_CLASS := ETC
LOCAL_SRC_FILES    := $(RUBY_VENDORTHH)/06090000000000000000000000000000.ta
LOCAL_MODULE_PATH  := $(TARGET_RECOVERY_ROOT_OUT)/vendor/thh/ta
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE       := 08010203000000000000000000000000.ta
LOCAL_MODULE_TAGS  := optional
LOCAL_MODULE_CLASS := ETC
LOCAL_SRC_FILES    := $(RUBY_VENDORTHH)/08010203000000000000000000000000.ta
LOCAL_MODULE_PATH  := $(TARGET_RECOVERY_ROOT_OUT)/vendor/thh/ta
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE       := 08030000000000000000000000000000.ta
LOCAL_MODULE_TAGS  := optional
LOCAL_MODULE_CLASS := ETC
LOCAL_SRC_FILES    := $(RUBY_VENDORTHH)/08030000000000000000000000000000.ta
LOCAL_MODULE_PATH  := $(TARGET_RECOVERY_ROOT_OUT)/vendor/thh/ta
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE       := 08040000000000000000000000003419.ta
LOCAL_MODULE_TAGS  := optional
LOCAL_MODULE_CLASS := ETC
LOCAL_SRC_FILES    := $(RUBY_VENDORTHH)/08040000000000000000000000003419.ta
LOCAL_MODULE_PATH  := $(TARGET_RECOVERY_ROOT_OUT)/vendor/thh/ta
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE       := 08050000000000000000000000003419.ta
LOCAL_MODULE_TAGS  := optional
LOCAL_MODULE_CLASS := ETC
LOCAL_SRC_FILES    := $(RUBY_VENDORTHH)/08050000000000000000000000003419.ta
LOCAL_MODULE_PATH  := $(TARGET_RECOVERY_ROOT_OUT)/vendor/thh/ta
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE       := 08110000000000000000000000000000.ta
LOCAL_MODULE_TAGS  := optional
LOCAL_MODULE_CLASS := ETC
LOCAL_SRC_FILES    := $(RUBY_VENDORTHH)/08110000000000000000000000000000.ta
LOCAL_MODULE_PATH  := $(TARGET_RECOVERY_ROOT_OUT)/vendor/thh/ta
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE       := 14498ace2a8f11e880c8509a4c146f4c.ta
LOCAL_MODULE_TAGS  := optional
LOCAL_MODULE_CLASS := ETC
LOCAL_SRC_FILES    := $(RUBY_VENDORTHH)/14498ace2a8f11e880c8509a4c146f4c.ta
LOCAL_MODULE_PATH  := $(TARGET_RECOVERY_ROOT_OUT)/vendor/thh/ta
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE       := 3d08821c33a611e6a1fa089e01c83aa2.ta
LOCAL_MODULE_TAGS  := optional
LOCAL_MODULE_CLASS := ETC
LOCAL_SRC_FILES    := $(RUBY_VENDORTHH)/3d08821c33a611e6a1fa089e01c83aa2.ta
LOCAL_MODULE_PATH  := $(TARGET_RECOVERY_ROOT_OUT)/vendor/thh/ta
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE       := 40188311faf343488db888ad39496f9a.ta
LOCAL_MODULE_TAGS  := optional
LOCAL_MODULE_CLASS := ETC
LOCAL_SRC_FILES    := $(RUBY_VENDORTHH)/40188311faf343488db888ad39496f9a.ta
LOCAL_MODULE_PATH  := $(TARGET_RECOVERY_ROOT_OUT)/vendor/thh/ta
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE       := 5020170115e016302017012521300000.ta
LOCAL_MODULE_TAGS  := optional
LOCAL_MODULE_CLASS := ETC
LOCAL_SRC_FILES    := $(RUBY_VENDORTHH)/5020170115e016302017012521300000.ta
LOCAL_MODULE_PATH  := $(TARGET_RECOVERY_ROOT_OUT)/vendor/thh/ta
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE       := 655a4b46cd7711eaaafbf382a6988e7b.ta
LOCAL_MODULE_TAGS  := optional
LOCAL_MODULE_CLASS := ETC
LOCAL_SRC_FILES    := $(RUBY_VENDORTHH)/655a4b46cd7711eaaafbf382a6988e7b.ta
LOCAL_MODULE_PATH  := $(TARGET_RECOVERY_ROOT_OUT)/vendor/thh/ta
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE       := 7778c03fc30c4dd0a319ea29643d4d4b.ta
LOCAL_MODULE_TAGS  := optional
LOCAL_MODULE_CLASS := ETC
LOCAL_SRC_FILES    := $(RUBY_VENDORTHH)/7778c03fc30c4dd0a319ea29643d4d4b.ta
LOCAL_MODULE_PATH  := $(TARGET_RECOVERY_ROOT_OUT)/vendor/thh/ta
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE       := 86f623f6a2994dfdb560ffd3e5a62c29.ta
LOCAL_MODULE_TAGS  := optional
LOCAL_MODULE_CLASS := ETC
LOCAL_SRC_FILES    := $(RUBY_VENDORTHH)/86f623f6a2994dfdb560ffd3e5a62c29.ta
LOCAL_MODULE_PATH  := $(TARGET_RECOVERY_ROOT_OUT)/vendor/thh/ta
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE       := 8888c03fc30c4dd0a319ea29643d4d4b.ta
LOCAL_MODULE_TAGS  := optional
LOCAL_MODULE_CLASS := ETC
LOCAL_SRC_FILES    := $(RUBY_VENDORTHH)/8888c03fc30c4dd0a319ea29643d4d4b.ta
LOCAL_MODULE_PATH  := $(TARGET_RECOVERY_ROOT_OUT)/vendor/thh/ta
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE       := 9073f03a9618383bb1856eb3f990babd.ta
LOCAL_MODULE_TAGS  := optional
LOCAL_MODULE_CLASS := ETC
LOCAL_SRC_FILES    := $(RUBY_VENDORTHH)/9073f03a9618383bb1856eb3f990babd.ta
LOCAL_MODULE_PATH  := $(TARGET_RECOVERY_ROOT_OUT)/vendor/thh/ta
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE       := 93feffccd8ca11e796c7c7a21acb4932.ta
LOCAL_MODULE_TAGS  := optional
LOCAL_MODULE_CLASS := ETC
LOCAL_SRC_FILES    := $(RUBY_VENDORTHH)/93feffccd8ca11e796c7c7a21acb4932.ta
LOCAL_MODULE_PATH  := $(TARGET_RECOVERY_ROOT_OUT)/vendor/thh/ta
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE       := abcd270ea5c44c58bcd3384a2fa2539e.ta
LOCAL_MODULE_TAGS  := optional
LOCAL_MODULE_CLASS := ETC
LOCAL_SRC_FILES    := $(RUBY_VENDORTHH)/abcd270ea5c44c58bcd3384a2fa2539e.ta
LOCAL_MODULE_PATH  := $(TARGET_RECOVERY_ROOT_OUT)/vendor/thh/ta
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE       := c09c9c5daa504b78b0e46eda61556c3a.ta
LOCAL_MODULE_TAGS  := optional
LOCAL_MODULE_CLASS := ETC
LOCAL_SRC_FILES    := $(RUBY_VENDORTHH)/c09c9c5daa504b78b0e46eda61556c3a.ta
LOCAL_MODULE_PATH  := $(TARGET_RECOVERY_ROOT_OUT)/vendor/thh/ta
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE       := c1882f2d885e4e13a8c8e2622461b2fa.ta
LOCAL_MODULE_TAGS  := optional
LOCAL_MODULE_CLASS := ETC
LOCAL_SRC_FILES    := $(RUBY_VENDORTHH)/c1882f2d885e4e13a8c8e2622461b2fa.ta
LOCAL_MODULE_PATH  := $(TARGET_RECOVERY_ROOT_OUT)/vendor/thh/ta
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE       := d78d338b1ac349e09f65f4efe179739d.ta
LOCAL_MODULE_TAGS  := optional
LOCAL_MODULE_CLASS := ETC
LOCAL_SRC_FILES    := $(RUBY_VENDORTHH)/d78d338b1ac349e09f65f4efe179739d.ta
LOCAL_MODULE_PATH  := $(TARGET_RECOVERY_ROOT_OUT)/vendor/thh/ta
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE       := d91f322ad5a441d5955110eda3272fc0.ta
LOCAL_MODULE_TAGS  := optional
LOCAL_MODULE_CLASS := ETC
LOCAL_SRC_FILES    := $(RUBY_VENDORTHH)/d91f322ad5a441d5955110eda3272fc0.ta
LOCAL_MODULE_PATH  := $(TARGET_RECOVERY_ROOT_OUT)/vendor/thh/ta
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE       := e5140b3376fa4c63ab18062caab2fb5c.ta
LOCAL_MODULE_TAGS  := optional
LOCAL_MODULE_CLASS := ETC
LOCAL_SRC_FILES    := $(RUBY_VENDORTHH)/e5140b3376fa4c63ab18062caab2fb5c.ta
LOCAL_MODULE_PATH  := $(TARGET_RECOVERY_ROOT_OUT)/vendor/thh/ta
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE       := e97c270ea5c44c58bcd3384a2fa2539e.ta
LOCAL_MODULE_TAGS  := optional
LOCAL_MODULE_CLASS := ETC
LOCAL_SRC_FILES    := $(RUBY_VENDORTHH)/e97c270ea5c44c58bcd3384a2fa2539e.ta
LOCAL_MODULE_PATH  := $(TARGET_RECOVERY_ROOT_OUT)/vendor/thh/ta
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE       := fc32e4da17d342449b01c992d56d71bf.ta
LOCAL_MODULE_TAGS  := optional
LOCAL_MODULE_CLASS := ETC
LOCAL_SRC_FILES    := $(RUBY_VENDORTHH)/fc32e4da17d342449b01c992d56d71bf.ta
LOCAL_MODULE_PATH  := $(TARGET_RECOVERY_ROOT_OUT)/vendor/thh/ta
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE       := isee_model.json
LOCAL_MODULE_TAGS  := optional
LOCAL_MODULE_CLASS := ETC
LOCAL_SRC_FILES    := $(RUBY_VENDORTHH)/isee_model.json
LOCAL_MODULE_PATH  := $(TARGET_RECOVERY_ROOT_OUT)/vendor/thh/ta
include $(BUILD_PREBUILT)

#####
# End of includes
#####
