ccflags-y :=  -O2 -std=gnu99 -Wno-declaration-after-statement

obj-m += gpio-cy8c95xx.o

RELEASE = $(shell uname -r)


all:
	$(MAKE) -C $(KERNEL_SRC) M=$(PWD) modules

clean:
	$(MAKE) -C $(KERNEL_SRC) M=$(PWD) clean

install:
	sudo install -m 644 -c gpio-cy8c95xx.ko /lib/modules/$(RELEASE)/extra
	sudo depmod
