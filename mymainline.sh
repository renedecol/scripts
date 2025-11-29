#!/bin/bash

# sudo apt-get update && sudo apt-get install libssl-dev bison
# sudo apt install -y git build-essential kernel-package fakeroot libncurses5-dev libssl-dev ccache
# probably more are needed now
#

# get the latest stable version
VERSION=$(wget -qO- www.kernel.org | grep arrow | awk -F linux- '{ print $2 }' | awk -F .tar.xz '{ print $1 }')
KERNEL=linux-$VERSION

mkdir -p ${KERNEL}
cd ${KERNEL} 

# fetch the source
if [ ! -d ${KERNEL} ] 
then

  if [ ! -e ${KERNEL}.tar.xz ]
  then
	  wget https://cdn.kernel.org/pub/linux/kernel/v6.x/${KERNEL}.tar.xz
  fi

  tar xvfx ${KERNEL}.tar.xz
  cd ${KERNEL}
  
  # use the actual running config
  cp /boot/config-`uname -r` .config
  yes '' | make oldconfig
  make clean
else
  cd ${KERNEL}
fi

# some parameters 
scripts/config --set-str SYSTEM_TRUSTED_KEYS ""
scripts/config --disable CONFIG_SYSTEM_REVOCATION_KEYS
# scripts/config --disable DEBUG_INFO
# scripts/config --disable CC_STACKPROTECTOR_STRONG

make menuconfig

make -j $(nproc --all) bindeb-pkg

