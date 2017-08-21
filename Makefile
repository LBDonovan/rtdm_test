# If KERNELRELEASE is defined, we've been invoked from the
# kernel build system and can use its language.

ifneq ($(KERNELRELEASE),)
	obj-m := hello.o
	# Otherwise we were called directly from the command
	# line; invoke the kernel build system.
else
	KERNELDIR ?= /Volumes/standalone-env/bela_os/openadk/build_beaglebone-black_glibc_cortex_a8_hard_eabihf/linux
	PWD  := $(shell pwd)

default:
	$(MAKE) -C $(KERNELDIR) M=$(PWD) CROSS_COMPILE="/Volumes/standalone-env/bela_os/openadk/toolchain_beaglebone-black_glibc_cortex_a8_hard_eabihf/usr/bin/arm-openadk-linux-gnueabihf-" ARCH=arm modules

endif