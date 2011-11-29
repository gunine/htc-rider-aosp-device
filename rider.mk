#
# Copyright (C) 2011 The Evervolv Project
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


PRODUCT_AAPT_CONFIG := normal hdpi
PRODUCT_AAPT_PREF_CONFIG := hdpi

# The gps config appropriate for this device
PRODUCT_COPY_FILES += \
    device/htc/rider/gps.conf:system/etc/gps.conf

## (1) First, the most specific values, i.e. the aspects that are specific to GSM
PRODUCT_PROPERTY_OVERRIDES += \
    ro.com.google.clientidbase=android-htc \
    ro.com.google.locationfeatures=1 \
    ro.com.google.networklocation=1 \
    ro.setupwizard.enable_bypass=1 \
    dalvik.vm.lockprof.threshold=500 \
    dalvik.vm.dexopt-flags=m=y

#TODO ---- What do we need to do to not use a static init & init.rc?
PRODUCT_COPY_FILES += \
    device/htc/rider/init:root/init \
    device/htc/rider/init.rc:root/init.rc \
    device/htc/rider/ueventd.rc:root/ueventd.rc \
    device/htc/rider/init.rider.rc:root/init.rider.rc \
    device/htc/rider/ueventd.rider.rc:root/ueventd.rider.rc

#Add toushcreen config file
PRODUCT_COPY_FILES += \
    device/htc/rider/atmel-touchscreen.idc:system/usr/idc/atmel-touchscreen.idc

## (2) Also get non-open-source GSM-specific aspects if available
$(call inherit-product-if-exists, vendor/htc/rider/rider-vendor.mk)

## (3)  Finally, the least specific parts, i.e. the non-GSM-specific aspects
PRODUCT_PROPERTY_OVERRIDES += \
    	ro.com.google.clientidbase=android-htc \
	ro.com.google.locationfeatures=1 \
	ro.setupwizard.enable_bypass=1 \
	ro.media.dec.jpeg.memcap=20000000 \
	dalvik.vm.lockprof.threshold=500 \
	dalvik.vm.dexopt-flags=m=y \
	ro.opengles.version=131072

DEVICE_PACKAGE_OVERLAYS += device/htc/rider/overlay

PRODUCT_COPY_FILES += \
    frameworks/base/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
    frameworks/base/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
    frameworks/base/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
    frameworks/base/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/base/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/base/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/base/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/base/data/etc/android.hardware.touchscreen.multitouch.distinct.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.distinct.xml \
    frameworks/base/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
    frameworks/base/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml

PRODUCT_PACKAGES += \
    librs_jni \
    libOmxVenc \
    libOmxVdec \
    com.android.future.usb.accessory
#    gps.rider \
#    librs_jni \
#    gralloc.msm8660 \
#    copybit.msm8660 \
#    overlay.default \
#    libOmxCore \
#    libaudio \


# Keylayouts
PRODUCT_COPY_FILES += \
    device/htc/rider/keychars/qwerty2.kcm.bin:system/usr/keychars/qwerty2.kcm.bin \
    device/htc/rider/keychars/qwerty.kcm.bin:system/usr/keychars/qwerty.kcm.bin \
    device/htc/rider/keychars/rider-keypad.kcm.bin:system/usr/keychars/rider-keypad.kcm.bin \
    device/htc/rider/keychars/BT_HID.kcm.bin:system/usr/keychars/BT_HID.kcm.bin \
    device/htc/rider/keylayout/h2w_headset.kl:system/usr/keylayout/h2w_headset.kl \
    device/htc/rider/keylayout/qwerty.kl:system/usr/keylayout/qwerty.kl \
    device/htc/rider/keylayout/rider-keypad.kl:system/usr/keylayout/rider-keypad.kl \
    device/htc/rider/keylayout/BT_HID.kl:system/usr/keylayout/BT_HID.kl \
    device/htc/rider/keylayout/AVRCP.kl:system/usr/keylayout/AVRCP.kl
# Firmware
PRODUCT_COPY_FILES += \
    device/htc/rider/firmware/BCM4329B1_002.002.023.0589.0633.hcd:system/etc/firmware/BCM4329B1_002.002.023.0589.0633.hcd \
    device/htc/rider/firmware/fw_bcm4329.bin:system/etc/firmware/fw_bcm4329.bin \
    device/htc/rider/firmware/fw_bcm4329_apsta.bin:system/etc/firmware/fw_bcm4329_apsta.bin \
    device/htc/rider/firmware/vidc_1080p.fw:system/etc/firmware/vidc_1080p.fw \
    device/htc/rider/firmware/leia_pfp_470.fw:system/etc/firmware/leia_pfp_470.fw \
    device/htc/rider/firmware/leia_pm4_470.fw:system/etc/firmware/leia_pm4_470.fw
    
# Audio DSP Profiles
PRODUCT_COPY_FILES += \
    device/htc/rider/dsp/AIC3254_REG.csv:system/etc/AIC3254_REG.csv \
    device/htc/rider/dsp/AIC3254_REG_DualMic.csv:system/etc/AIC3254_REG_DualMic.csv \
    device/htc/rider/dsp/AdieHWCodec.csv:system/etc/AdieHWCodec.csv \
    device/htc/rider/dsp/AudioBTID.csv:system/etc/AudioBTID.csv \
    device/htc/rider/dsp/CodecDSPID.txt:system/etc/CodecDSPID.txt \
    device/htc/rider/dsp/TPA2051_CFG.csv:system/etc/TPA2051_CFG.csv \
    device/htc/rider/dsp/soundimage/Sound_Original_MFG.txt:system/etc/soundimage/Sound_Original_MFG.txt \
    device/htc/rider/dsp/soundimage/Sound_Original_Recording.txt:system/etc/soundimage/Sound_Original_Recording.txt \
    device/htc/rider/dsp/soundimage/Sound_Original_SPK.txt:system/etc/soundimage/Sound_Original_SPK.txt \
    device/htc/rider/dsp/soundimage/Sound_Original.txt:system/etc/soundimage/Sound_Original.txt \
    device/htc/rider/dsp/soundimage/Sound_Phone_Original.txt:system/etc/soundimage/Sound_Phone_Original.txt \
    device/htc/rider/dsp/soundimage/Sound_Phone_Original_HP.txt:system/etc/soundimage/Sound_Phone_Original_HP.txt \
    device/htc/rider/dsp/soundimage/Sound_Phone_Original_REC.txt:system/etc/soundimage/Sound_Phone_Original_REC.txt \
    device/htc/rider/dsp/soundimage/Sound_Phone_Original_SPK.txt:system/etc/soundimage/Sound_Phone_Original_SPK.txt \
    device/htc/rider/dsp/soundimage/Sound_Rec_Landscape.txt:system/etc/soundimage/Sound_Rec_Landscape.txt \
    device/htc/rider/dsp/soundimage/Sound_Rec_Portrait.txt:system/etc/soundimage/Sound_Rec_Portrait.txt \
    device/htc/rider/dsp/soundimage/Sound_Recording.txt:system/etc/soundimage/Sound_Recording.txt \
    device/htc/rider/dsp/soundimage/srs_geq10.cfg:system/etc/soundimage/srs_geq10.cfg \
    device/htc/rider/dsp/soundimage/srsfx_trumedia_51.cfg:system/etc/soundimage/srsfx_trumedia_51.cfg \
    device/htc/rider/dsp/soundimage/srsfx_trumedia_movie.cfg:system/etc/soundimage/srsfx_trumedia_movie.cfg \
    device/htc/rider/dsp/soundimage/srsfx_trumedia_music.cfg:system/etc/soundimage/srsfx_trumedia_music.cfg \
    device/htc/rider/prebuilt/snd3254:system/bin/snd3254

# Kernel Module
PRODUCT_COPY_FILES += \
    device/htc/rider/modules/bcm4329.ko:system/lib/modules/bcm4329.ko \
    device/htc/rider/modules/sequans_sdio.ko:system/lib/modules/sequans_sdio.ko \
    device/htc/rider/modules/auth_rpcgss.ko:system/lib/modules/auth_rpcgss.ko \
    device/htc/rider/modules/cifs.ko:system/lib/modules/cifs.ko \
    device/htc/rider/modules/lockd.ko:system/lib/modules/lockd.ko \
    device/htc/rider/modules/nfs.ko:system/lib/modules/nfs.ko \
    device/htc/rider/modules/nls_utf8.ko:system/lib/modules/nls_utf8.ko \
    device/htc/rider/modules/rpcsec_gss_krb5.ko:system/lib/modules/rpcsec_gss_krb5.ko \
    device/htc/rider/modules/sunrpc.ko:system/lib/modules/sunrpc.ko \
    device/htc/rider/modules/tun.ko:system/lib/modules/tun.ko \
    device/htc/rider/modules/wimaxdbg.ko:system/lib/modules/wimaxdbg.ko \
    device/htc/rider/modules/wimaxuart.ko:system/lib/modules/wimaxuart.ko

# we have enough storage space to hold precise GC data
PRODUCT_TAGS += dalvik.gc.type-precise


PRODUCT_LOCALES += ko

PRODUCT_COPY_FILES += \
    device/htc/rider/vold.fstab:system/etc/vold.fstab \
    device/htc/rider/apns-conf.xml:system/etc/apns-conf.xml

$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

DEVICE_PACKAGE_OVERLAYS += device/htc/rider/overlay


ifeq ($(TARGET_PREBUILT_KERNEL),)
	LOCAL_KERNEL := device/htc/rider/zImage
else
	LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

PRODUCT_COPY_FILES += \
    $(LOCAL_KERNEL):kernel

# media profiles and capabilities spec
$(call inherit-product, device/htc/rider/media_a1026.mk)

# htc audio settings
$(call inherit-product, device/htc/rider/media_htcaudio.mk)

# stuff common to all HTC phones
$(call inherit-product, device/htc/common/common.mk)

$(call inherit-product, build/target/product/full_base.mk)

PRODUCT_NAME := full_rider
PRODUCT_DEVICE := rider
PRODUCT_MODEL := HTC 4G+
PRODUCT_MANUFACTURER := HTC
