# How to Compile  

## Prerequisites
Before compiling, ensure the following packages are installed:
```bash
sudo apt install bison flex git make mtd-utils mtools openssl pv python3-pip u-boot-tools dosfstools kmod xxd squashfs-tools bc wget
sudo apt install libncurses* libgmp-dev libmpc-dev libssl-dev
sudo apt install qemu-user-static binfmt-support
sudo pip install crypto pycryptodomex pyelftools
```  

### Setup ARM64 Emulation
Enable ARM64 binary emulation for cross-architecture operations:
```bash
sudo systemctl start binfmt-support
sudo update-binfmts --enable qemu-aarch64
```

## Download the Source Code  
Clone the repository and initialize submodules:  
```bash  
git clone https://github.com/eYs3D/eCV5546_Platform.git
cd eCV5546_Platform
git submodule update --init --recursive
git submodule foreach git checkout master
```  

## Configure the Build on `x86_64`
Run the following command to configure the build:  
```bash  
sudo make config  
```  
**Note:** After completing `sudo make config`, if you want to adjust the kernel configuration, use:  
```bash  
sudo make kconfig  
```  
Do **not** manually enter the `linux/kernel` folder to run `make menuconfig`.  

## Build the Project  
To build all components, execute:  
```bash  
sudo make  
```  
If your local `LANG` environment variable is not set to English, use:  
```bash  
LANG=C make  
```  

When the build completes, the output image file will be located in the `out` folder.  

## Configure the Build on `x86_64` docker environment

```bash
# Host computer build docker ubuntu 20.04 environment with tag u20
docker build -t u20 .

# Mount the current BSP folder `./` into the `/code` in the container
docker run --privileged -v .:/code -it u20 /bin/bash
```

```bash
#Inside the container
root@f2db90e55ce6:/# update-binfmts --enable qemu-aarch64

root@f2db90e55ce6:/# cd code/

root@f2db90e55ce6:/# make config

root@f2db90e55ce6:/# make
```
