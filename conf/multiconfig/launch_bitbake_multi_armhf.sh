#!/bin/bash -

export MULTICONFIG="qemuarm stm32mp157c-dk2 ti-am572x"
sed -e "s%^BBMULTICONFIG ?= .*$%BBMULTICONFIG ?= \"${MULTICONFIG}\"%" -i conf/auto.conf
MACHINE=ledge-qemuarm BBMULTICONFIG=$BBMULTICONFIG bitbake \
	mc:qemuarm:ledge-gateway \
	mc:qemuarm:ledge-iot \
	mc:stm32mp157c-dk2:u-boot-ledge mc:stm32mp157c-dk2:optee-os mc:stm32mp157c-dk2:arm-trusted-firmware-ledge \
	mc:ti-am572x:u-boot-ledge mc:ti-am572x:optee-os

