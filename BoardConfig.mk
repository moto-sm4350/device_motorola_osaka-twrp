#
# Copyright (C) 2021 The TWRP Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

DEVICE_PATH := device/motorola/osaka

# For building with minimal manifest
ALLOW_MISSING_DEPENDENCIES := true

# Architecture
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_ABI2 :=
TARGET_CPU_VARIANT := generic
TARGET_CPU_VARIANT_RUNTIME := cortex-a55

TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv8-2a
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := generic
TARGET_2ND_CPU_VARIANT_RUNTIME := cortex-a55

# APEX image
DEXPREOPT_GENERATE_APEX_IMAGE := true

# Assert
TARGET_OTA_ASSERT_DEVICE := osaka

# A/B
AB_OTA_UPDATER := true

AB_OTA_PARTITIONS := \
    boot \
    dtbo \
    product \
    system \
    system_ext \
    vbmeta \
    vbmeta_system \
    vendor \
    vendor_boot

# Kernel
BOARD_KERNEL_BASE := 0x00000000
BOARD_KERNEL_IMAGE_NAME := Image
BOARD_KERNEL_PAGESIZE := 4096

BOARD_INCLUDE_DTB_IN_BOOTIMG := true
BOARD_KERNEL_SEPARATED_DTBO := true
BOARD_BOOT_HEADER_VERSION := 3
BOARD_MKBOOTIMG_ARGS += --header_version $(BOARD_BOOT_HEADER_VERSION)
BOARD_MKBOOTIMG_ARGS += --dtb $(TARGET_PREBUILT_DTB)

BOARD_KERNEL_CMDLINE += log_buf_len=256k
BOARD_KERNEL_CMDLINE += firmware_class.path=/vendor/firmware_mnt/image
BOARD_KERNEL_CMDLINE += androidboot.bootdevice.4804000.ufshc
BOARD_KERNEL_CMDLINE += androidboot.console=MSM 
BOARD_KERNEL_CMDLINE += androidboot.hardware=qcom 
BOARD_KERNEL_CMDLINE += androidboot.hwrev=0xC000 
BOARD_KERNEL_CMDLINE += androidboot.memcg=1 
BOARD_KERNEL_CMDLINE += androidboot.selinux=permissive 
BOARD_KERNEL_CMDLINE += androidboot.usbcontroller=4e00000.dwc3 
BOARD_KERNEL_CMDLINE += cgroup.memory=nokmem,nosocket
BOARD_KERNEL_CMDLINE += androidboot.force_normal_boot=1
BOARD_KERNEL_CMDLINE += storage_mfrid=0x1AD
BOARD_KERNEL_CMDLINE += ip6table_raw.raw_before_defrag=1
BOARD_KERNEL_CMDLINE += iptable_raw.raw_before_defrag=1
BOARD_KERNEL_CMDLINE += lpm_levels.sleep_disabled=1
BOARD_KERNEL_CMDLINE += msm_rtb.filter=0x237
BOARD_KERNEL_CMDLINE += swiotlb=0
BOARD_KERNEL_CMDLINE += msm_drm.dsi_display0=qcom,mdss_dsi_nt36675_boe_video:
BOARD_KERNEL_CMDLINE += rootwait ro init=/init
BOARD_KERNEL_CMDLINE += androidboot.write_protect=0
BOARD_KERNEL_CMDLINE += androidboot.dtbo_idx=4
BOARD_KERNEL_CMDLINE += androidboot.dtb_idx=0
BOARD_KERNEL_CMDLINE += androidboot.ssm_data=00000000000F5551

KERNEL_LD := LLVM=1
TARGET_KERNEL_ADDITIONAL_FLAGS := DTC_EXT=$(shell pwd)/prebuilts/misc/linux-x86/dtc/dtc
TARGET_KERNEL_CLANG_COMPILE := true
TARGET_KERNEL_CONFIG := vendor/osaka_defconfig
TARGET_KERNEL_SOURCE := kernel/motorola/osaka

# Metadata
BOARD_USES_METADATA_PARTITION := true
BOARD_USES_QCOM_FBE_DECRYPTION := true

# Partitions
BOARD_FLASH_BLOCK_SIZE := 131072
BOARD_BOOTIMAGE_PARTITION_SIZE := 100663296

BOARD_SUPER_PARTITION_GROUPS := mot_dynamic_partitions
BOARD_SUPER_PARTITION_SIZE := 13958643712
BOARD_MOT_DYNAMIC_PARTITIONS_PARTITION_LIST := odm product system system_ext vendor
BOARD_MOT_DYNAMIC_PARTITIONS_SIZE := 6977224704 # (BOARD_SUPER_PARTITION_SIZE - 4MB) / 2
BOARD_DTBOIMG_PARTITION_SIZE := 25165824 # (0x1800000)
BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE := ext4

BOARD_VENDOR_BOOTIMAGE_PARTITION_SIZE := 100663296
TARGET_COPY_OUT_VENDOR := vendor

BOARD_ROOT_EXTRA_FOLDERS := bluetooth dsp firmware persist
BOARD_SUPPRESS_SECURE_ERASE := true

# Platform
BOARD_USES_QCOM_HARDWARE := true
TARGET_BOARD_PLATFORM := holi

# Properties
TARGET_SYSTEM_PROP += $(DEVICE_PATH)/system.prop
TARGET_VENDOR_PROP += $(DEVICE_PATH)/vendor.prop

# Recovery
BOARD_USES_RECOVERY_AS_BOOT := true
TARGET_NO_RECOVERY := true
TARGET_RECOVERY_FSTAB := $(DEVICE_PATH)/recovery.fstab
TARGET_RECOVERY_PIXEL_FORMAT := "RGBX_8888"
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true

# Verified Boot
BOARD_AVB_ENABLE := true
BOARD_AVB_MAKE_VBMETA_IMAGE_ARGS += --flags 3
BOARD_AVB_VBMETA_SYSTEM := system system_ext product
BOARD_AVB_VBMETA_SYSTEM_KEY_PATH := external/avb/test/data/testkey_rsa2048.pem
BOARD_AVB_VBMETA_SYSTEM_ALGORITHM := SHA256_RSA2048
BOARD_AVB_VBMETA_SYSTEM_ROLLBACK_INDEX := $(PLATFORM_SECURITY_PATCH_TIMESTAMP)
BOARD_AVB_VBMETA_SYSTEM_ROLLBACK_INDEX_LOCATION := 1
