obj-m += st_lms303d.o

KBASE  ?= /lib/modules/`uname -r`
KBUILD ?= $(KBASE)/build
MDEST  ?= $(KBASE)/kernel/drivers/iio/imu

all:
	${MAKE} -C $(KBUILD) M=$(PWD) modules
	xz -f st_lms303d.ko

clean:
	${MAKE} -C $(KBUILD) M=$(PWD) clean
	rm st_lms303d.ko.xz

install:
	install -D -m 644 st_lms303d.ko.xz $(MDEST)
	depmod -a
