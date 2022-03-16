# ledge-oe-manifest

This is the main manifest file to build the LEDGE Reference Platform from
source. For detailed build environment and build instructions please refer
to ledge-dev-howto.pdf (generated from https://github.com/Linaro/ledge-doc
sources).

For advanced users quick steps to build are:
1. `repo init -u https://github.com/Linaro/ledge-oe-manifest.git -b master`
2. `MACHINE=ledge-multi-armv7 DISTRO=rpb source ./setup-environment
   build-rpb-mc`
3. Follow printed instructions to build `bitbake ledge-iot` and `bitbake
   ledge-gateway` images.

Note: supported MACHINEs are: ledge-multi-armv7, ledge-multi-armv8,
ledge-qemux86-64.

User guide to run pre-built binaries is at ledge-user-guide.pdf (generated
from https://github.com/Linaro/ledge-doc).

CI system is located at https://ci.linaro.org/job/ledge-oe

This manifest is usually used in conjunction with trusted substrate generated
firmware. More info on trusted substrate can be found
https://git.codelinaro.org/linaro/dependable-boot/meta-ts

Mailing list: team-ledge@linaro.org
