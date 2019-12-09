Ledge-oe-manifest
=================
(derivated from https://github.com/96boards/oe-rpb-manifest)

LEGDE OE Repo manifest repository

These are the setup scripts for the LEDGE OE buildsystem. If you want to (re)build packages or images for OE LEGDE, this is the thing to use.
The OE LEDGE buildsystem is using various components from the Yocto Project, most importantly the Openembedded buildsystem, the bitbake task executor and various application and BSP layers.

To configure the scripts and download the build metadata, do:
```
mkdir ~/bin
PATH=~/bin:$PATH

curl http://commondatastorage.googleapis.com/git-repo-downloads/repo > ~/bin/repo
chmod a+x ~/bin/repo
```
Run repo init to bring down the latest version of Repo with all its most recent bug fixes. You must specify a URL for the manifest, which specifies where the various repositories included in the Android source will be placed within your working directory. To check out the current branch, specify it with -b:
```
repo init -u https://github.com/Linaro/ledge-oe-manifest.git -b master
```
When prompted, configure Repo with your real name and email address.

A successful initialization will end with a message stating that Repo is initialized in your working directory. Your client directory should now contain a .repo directory where files such as the manifest will be kept.

To pull down the metadata sources to your working directory from the repositories as specified in the default manifest, run
```
repo sync
```
When downloading from behind a proxy (which is common in some corporate environments), it might be necessary to explicitly specify the proxy that is then used by repo:
```
export HTTP_PROXY=http://<proxy_user_id>:<proxy_password>@<proxy_server>:<proxy_port>
export HTTPS_PROXY=http://<proxy_user_id>:<proxy_password>@<proxy_server>:<proxy_port>
```
More rarely, Linux clients experience connectivity issues, getting stuck in the middle of downloads (typically during "Receiving objects"). It has been reported that tweaking the settings of the TCP/IP stack and using non-parallel commands can improve the situation. You need root access to modify the TCP setting:
```
sudo sysctl -w net.ipv4.tcp_window_scaling=0
repo sync -j1
```
1. Setup Environment
-----------------

MACHINE values can be:
* ledge-ti-am572x
* ledge-stm32mp157c-dk2
* ledge-qemuarm
* ledge-qemuarm64
* ledge-qemux86-64
* ledge-hummingboard2
* ledge-espressobin

DISTRO values can be:
* rpb
* rpb-sota

bitbake targets can be:
* ledge-gateway
* ledge-iot

```
MACHINE=<machine> DISTRO=<distro> source ./setup-environment
```
example 
```
DISTRO=rpb MACHINE=ledge-ti-am572x source ./setup-environment
```

2. Build Image
-----------------
```
bitbake ledge-gateway
or
bitbake ledge-iot
```

3. SELinux
----------
All ledge-generated images enable SELinux by default on permissive mode
if you want to disable it use selinux=0 on the kernel cmdline

4. Run virtual machine with the image
-------------------------------------
```
Navigate to build image directory:
cd ./build-rpb/tmp-rpb-glibc/deploy/images/ledge-qemuarm64

Then run:
runqemu ledge-qemuarm64 wic

```
(you should see that tfa, optee, uboot, kernel then apps boots, then you will be able automaticaly login inside ledge rp.)

Note: On first boot SElinux re-labeling will force a reboot which currently hangs using TF-A.
Restart the QEMU process manually and the image will run properly.

5. fTPM in QEMU
Firmware TPM needs a dedicated storage. Since on current QEMU platforms that
storage is provided by the TEE supplicant, TPM is only operational when linux
has fully booted. Since the supplicant launches after loading the the fTPM
module an error will appear during boot. 

```
[   17.344677] ftpm-tee tpm@0: ftpm_tee_probe: tee_client_open_session failed, err=ffff000c
[   17.345126] ftpm-tee: probe of tpm@0 failed with error -22
```

To make TPM operational do: 
```
~ # rmmod tpm_ftpm_tee && modprobe tpm_ftpm_tee
~ # tpm2_getrandom 8
0x6A 0x4C 0x8E 0x47 0x30 0xBC 0x46 0xD3
~ #
```

Creating a local topic branch
-----------------------------

If you need to create local branches for all repos which then can be done e.g.
```
~/bin/repo start <new branch> --all
```

Updating
--------------------

If you need to bring changes from upstream then use following commands
```
repo sync
```
Rease your local committed changes
```
repo rebase
```
