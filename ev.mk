# Inherit AOSP device configuration for inc.
$(call inherit-product, device/htc/rider/full_rider.mk)

# Inherit some common evervolv stuff.
$(call inherit-product, vendor/ev/config/common_full_phone.mk)

#
# Setup device specific product configuration.
#
PRODUCT_NAME := ev_rider
PRODUCT_BRAND := kt_kr
PRODUCT_DEVICE := rider
PRODUCT_MODEL := X515e
PRODUCT_MANUFACTURER := HTC
PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=htc_rider BUILD_ID=GRJ22 BUILD_FINGERPRINT=kt_kr/htc_rider/rider:2.3.4/GRJ22/156723.6:user/release-keys PRIVATE_BUILD_DESC="1.48.1010.6 CL156723 release-keys"

# Set up the product codename, build version & MOTD.
PRODUCT_CODENAME := Neco
PRODUCT_VERSION_DEVICE_SPECIFIC := p3

PRODUCT_MOTD :="\n\n\n--------------------MESSAGE---------------------\nThank you for choosing Evervolv for your HTC Evo 4G+\nPlease visit us at \#evervolv on irc.freenode.net\nFollow @preludedrew for the latest Evervolv updates\nGet the latest rom at evervolv.com\n------------------------------------------------\n"

#PRODUCT_PACKAGES += \
    Camera

# Copy compatible prebuilt files
PRODUCT_COPY_FILES +=  \
    vendor/ev/prebuilt/qhd/media/bootanimation.zip:system/media/bootanimation.zip

# USB
ADDITIONAL_DEFAULT_PROPERTIES += \
    persist.sys.usb.config=mass_storage

#ADDITIONAL_DEFAULT_PROPERTIES += persist.sys.usb.config=mtp,adb
