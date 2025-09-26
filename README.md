
# How to Compile  

## Prerequisites  
Before compiling, ensure the following packages are installed:  
```bash  
sudo apt install bison flex git make mtd-utils mtools openssl pv python3-pip u-boot-tools dosfstools kmod xxd squashfs-tools bc wget
sudo apt install libncurses* libgmp-dev libmpc-dev libssl-dev coreutils
pip install crypto pycryptodomex pyelftools
```  

## Download the Source Code  
Clone the repository and initialize submodules:  
```bash  
git clone https://github.com/eYs3D/eCV5546_Platform.git
cd eCV5546_Platform
git submodule update --init --recursive
git submodule foreach git checkout master
```  

## Configure the Build  
Run the following command to configure the build:  
```bash  
sudo make config  
```  
**Note:** After completing `sudo make config`, if you want to adjust the kernel configuration, use:  
```bash  
sudo make kconfig  
```  
Do **not** manually enter the `linux/kernel` folder to run `sudo make menuconfig`.  

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

