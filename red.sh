#!/usr/bin/env bash 

#cloning trees
git clone https://github.com/lineage-redwood/android_device_xiaomi_redwood device/xiaomi/redwood
git clone https://github.com/lineage-redwood/android_device_xiaomi_sm8350-common device/xiaomi/sm8350-common
git clone https://github.com/lineage-redwood/android_vendor_xiaomi_redwood vendor/xiaomi/redwood
git clone https://github.com/lineage-redwood/android_vendor_xiaomi_sm8350-common vendor/xiaomi/sm8350-common
git clone https://github.com/lineage-redwood/android_kernel_xiaomi_sm8350 kernel/xiaomi/sm8350
git clone https://github.com/ArrowOS-Devices/android_hardware_xiaomi hardware/xiaomi

#ccache setup 
mkdir /home/$(whoami)/.ccache
sudo mkdir /mnt/ccache
sudo mount --bind /home/$(whoami)/.ccache /mnt/ccache
export USE_CCACHE=1
export CCACHE_EXEC=/usr/bin/ccache
export CCACHE_DIR=/mnt/ccache
ccache -M 100G && ccache -o compression=true && ccache -z

#start the build up 
. build/envsetup.sh
brunch redwood userdebug
