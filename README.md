oe-lite-manifest
=================
(derivated from https://github.com/96boards/oe-rpb-manifest)

LITE OE Repo manifest repository

These are the setup scripts for the OE LITE buildsystem. If you want to (re)build packages or images for OE LITE, this is the thing to use.
The OE LITE buildsystem is using various components from the Yocto Project, most importantly the Openembedded buildsystem, the bitbake task executor and various application and BSP layers.

To configure the scripts and download the build metadata, do:
```
mkdir ~/bin
PATH=~/bin:$PATH

curl http://commondatastorage.googleapis.com/git-repo-downloads/repo > ~/bin/repo
chmod a+x ~/bin/repo
```
Run repo init to bring down the latest version of Repo with all its most recent bug fixes. You must specify a URL for the manifest, which specifies where the various repositories included in the Android source will be placed within your working directory. To check out the current branch, specify it with -b:
```
repo init -u https://git.linaro.org/people/christophe.priouzeau/oe-lite-manifest.git -b master
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
Setup Environment
-----------------

MACHINE values can be:
* lite-hummingboard2

DISTRO values can be:
* lite-gw

```
. setup-environment
MACHINE=<machine> DISTRO=<distro> bitbake rpb-ltd-gateway-image
```
e.g. DISTRO=lite-gw MACHINE=lite-hummingboard2 bitbake source ./setup-environment
     bitbake lite-gateway-image

Creating a local topic branch
-----------------------------

If you need to create local branches for all repos which then can be done e.g.
```
~/bin/repo start myangstrom --all
```
Where 'myangstrom' is the name of branch you choose

Updating the sandbox
--------------------

If you need to bring changes from upstream then use following commands
```
repo sync
```
Rease your local committed changes
```
repo rebase
```
