# libundirect/Makefile

include $(THEOS)/makefiles/common.mk

# ターゲット定義
ARCHS = arm64 arm64e
TARGET = iphone:clang:$(SDK_VERSION):14.0
SDK_VERSION ?= 18.6

# ライブラリ名
LIBRARY_NAME = libundirect

# ソースファイル
libundirect_FILES = $(wildcard *.m *.mm *.c)

# フラグ
libundirect_CFLAGS = -fobjc-arc -O2
libundirect_LDFLAGS = -undefined dynamic_lookup

# インストール先
THEOS_PACKAGE_DIR_NAME = lib

include $(THEOS_MAKE_PATH)/library.mk

after-install::
	@echo "libundirect built and installed to $(THEOS)/lib"
