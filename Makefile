include $(THEOS)/makefiles/common.mk

TWEAK_NAME = TrollLock
SDKVERSION = 11.4
ARCHS = arm64 arm64e
TrollLock_FILES = Tweak.xm
DEBUG=0
PACKAGE_VERSION=1.0.0
include $(THEOS_MAKE_PATH)/tweak.mk

internal-stage::
	#Filter plist
	$(ECHO_NOTHING)if [ -f Filter.plist ]; then mkdir -p $(THEOS_STAGING_DIR)/Library/MobileSubstrate/DynamicLibraries/; cp Filter.plist $(THEOS_STAGING_DIR)/Library/MobileSubstrate/DynamicLibraries/trolllock.plist; fi$(ECHO_END)
	#PreferenceLoader plist
	$(ECHO_NOTHING)if [ -f Preferences.plist ]; then mkdir -p $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences/trolllock; cp Preferences.plist $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences/trolllock/; fi$(ECHO_END)

after-install::
	install.exec "killall backboardd"
