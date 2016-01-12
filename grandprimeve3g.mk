LOCAL_PATH := device/samsung/grandprimeve3g

# Хакатон для билда
$(shell mkdir -p $(OUT)/obj/KERNEL_OBJ/usr)

DEVICE_PACKAGE_OVERLAYS += $(LOCAL_PATH)/overlay

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0

ifeq ($(TARGET_PREBUILT_KERNEL),)
	LOCAL_KERNEL := $(LOCAL_PATH)/kernel
else
	LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

PRODUCT_PACKAGES += \
    	libkeyutils \
    	libexifa \
    	libjpega \
    	e2fsck 	


PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/kernel:kernel \
    $(LOCAL_PATH)/dt.img:dt.img \
    $(LOCAL_PATH)/fstab.sc8830:root/fstab.sc8830 \
    $(LOCAL_PATH)/recovery.fstab:recovery/root/etc/recovery.fstab \
    $(LOCAL_PATH)/ramdisk/init.sc8830.rc:root/init.sc8830.rc \
    $(LOCAL_PATH)/ramdisk/init.wifi.rc:root/init.wifi.rc \
    $(LOCAL_PATH)/ramdisk/init.grandprimeve3g_base.rc:root/init.grandprimeve3g_base.rc \
    $(LOCAL_PATH)/ramdisk/init.grandprimeve3g.rc:root/init.grandprimeve3g.rc \
    $(LOCAL_PATH)/ramdisk/init.sc8830_ss.rc:root/init.sc8830_ss.rc \
    $(LOCAL_PATH)/ramdisk/init.sc8830.usb.rc:root/init.sc8830.usb.rc \
    $(LOCAL_PATH)/ramdisk/ueventd.sc8830.rc:root/ueventd.sc8830.rc \
    $(LOCAL_PATH)/ramdisk/init.recovery.usb.rc:root/init.recovery.usb.rc \
    $(LOCAL_PATH)/ramdisk/lib/modules/autotst.ko:root/lib/modules/autotst.ko \
    $(LOCAL_PATH)/ramdisk/lib/modules/mmc_test.ko:root/lib/modules/mmc_test.ko \
    $(LOCAL_PATH)/ramdisk/lib/modules/mali.ko:system/lib/modules/mali.ko

DEFAULT_PROPERTY_OVERRIDES += \
    ro.secure=0 \
    ro.allow.mock.location=1 \
    ro.debuggable=1 \
    persist.service.adb.enable=1 \
    persist.sys.usb.config=mtp,adb 

#TWRP
#PRODUCT_COPY_FILES += \
#	$(LOCAL_PATH)/fstab.grandprimeve3g:recovery/root/fstab.grandprimeve3g \
#	$(LOCAL_PATH)/init.rc:recovery/root/init.rc \
#	$(LOCAL_PATH)/init.usb.rc:recovery/root/init.usb.rc \
#	$(LOCAL_PATH)/default.prop:recovery/root/default.prop

PRODUCT_AAPT_CONFIG := ldpi mdpi hdpi xhdpi
PRODUCT_AAPT_PREF_CONFIG := mdpi
PRODUCT_CHARACTERISTICS := phone

$(call inherit-product, build/target/product/full.mk)
$(call inherit-product, build/target/product/languages_small.mk)
$(call inherit-product, build/target/product/locales_full.mk)
$(call inherit-product-if-exists, vendor/samsung/grandprimeve3g/Android.mk)
