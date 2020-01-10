#!/bin/bash -

export MULTICONFIG="qemuarm64"
sed -e "s%^BBMULTICONFIG ?= .*$%BBMULTICONFIG ?= \"${MULTICONFIG}\"%" -i conf/auto.conf
MACHINE=ledge-qemuarm64 bitbake \
	mc:qemuarm64:ledge-gateway \
	mc:qemuarm64:ledge-iot
