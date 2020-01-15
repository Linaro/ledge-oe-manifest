How to to set a multiconfig environment for ledge.

armv7:
 MACHINE=ledge-multi-armv7 DISTRO=rpb source ./setup-environment build-rpb-mc
 bitbake mc:qemuarm:ledge-iot ${FIRMWARE}

armv8:
 MACHINE=ledge-multi-armv8 DISTRO=rpb source ./setup-environment build-rpb-mc
 bitbake mc:qemuarm:ledge-iot ${FIRMWARE}
