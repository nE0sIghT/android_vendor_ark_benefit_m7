LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)
LOCAL_MODULE := doogee_symlinks
LOCAL_MODULE_TAGS := optional

SYMLINKS := make_symlinks
$(SYMLINKS):
	mkdir -p $(PRODUCT_OUT)/system/app/Bluetooth/lib/arm \
	         $(PRODUCT_OUT)/system/priv-app/FmRadio/lib/arm
	ln -sf /system/lib/libbluetooth_jni.so \
	       $(PRODUCT_OUT)/system/app/Bluetooth/lib/arm/libbluetooth_jni.so
	ln -sf /system/lib/libfmjni.so \
	       $(PRODUCT_OUT)/system/priv-app/FmRadio/lib/arm/libfmjni.so

# We need this so that the installed files could be picked up based on the
# local module name
ALL_MODULES.$(LOCAL_MODULE).INSTALLED += $(SYMLINKS)

# Create the symlink when you run mm/mmm or "make <module_name>"
$(LOCAL_MODULE) : $(SYMLINKS)
