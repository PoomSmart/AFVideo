SDKVERSION = 7.0
ARCHS = armv7 arm64

include theos/makefiles/common.mk
TWEAK_NAME = AFVideo
AFVideo_FILES = Tweak.xm

include $(THEOS_MAKE_PATH)/tweak.mk
