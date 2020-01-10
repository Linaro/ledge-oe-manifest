How to to set a multiconfig environment for ledge.

1. create you build environment:
--------------------------------
   $> MACHINE=ledge-qemuarm DISTRO=rpb source ./setup-environment build-rpb-mc
NOTE: for this step the machine name have not relevent.

2. Request a multiconfig build for armhf
----------------------------------------
	$> ./conf/multiconfig/launch_bitbake_multi_armhf.sh
	or
	$> export BBMULTICONFIG="qemuarm stm32mp157c-dk2 ti-am572x"
	$> sed -e "s%^BBMULTICONFIG ?= .*$%BBMULTICONFIG ?= \"${MULTICONFIG}\"%" -i conf/auto.conf
	$> MACHINE=ledge-qemuarm bitbake \
		mc:qemuarm:ledge-gateway \
		mc:qemuarm:ledge-iot \
		mc:stm32mp157c-dk2:u-boot-ledge mc:stm32mp157c-dk2:optee-os mc:stm32mp157c-dk2:arm-trusted-firmware-ledge \
		mc:ti-am572x:u-boot-ledge mc:ti-am572x:optee-os


2. Request a multiconfig build for arm64
----------------------------------------
	$> ./conf/multiconfig/launch_bitbake_multi_arm64.sh
	or
	$> export BBMULTICONFIG="qemuarm64"
	$> sed -e "s%^BBMULTICONFIG ?= .*$%BBMULTICONFIG ?= \"${MULTICONFIG}\"%" -i conf/auto.conf
	$> MACHINE=ledge-qemuarm64 bitbake \
		mc:ledge-qemuarm64:ledge-gateway \
		mc:ledge-qemuarm64:ledge-iot

3. launch a build for a specific machine
----------------------------------------
	$> unset BBMULTICONFIG
	$> MACHINE=ledge-stm32mp157c-dk2 bitbake ledge-gateway ledge-iot

