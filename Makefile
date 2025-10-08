TARGET := iphone:clang:latest:15.0
ARCHS := arm64 arm64e

include $(THEOS)/makefiles/common.mk

LIBRARY_NAME = libundirect

libundirect_FILES = libundirect.m HookCompat.m
libundirect_CFLAGS = -fobjc-arc
ifeq ($(THEOS_PACKAGE_SCHEME),rootless)
libundirect_LDFLAGS += -install_name @rpath/libundirect.dylib -not_for_dyld_shared_cache
endif
libundirect_INSTALL_PATH = /usr/lib
libundirect_EXTRA_FRAMEWORKS = CydiaSubstrate

include $(THEOS_MAKE_PATH)/library.mk
