FROM ubuntu:20.04
ENV DEBIAN_FRONTEND noninteractive

RUN   apt-get update && \
      apt-get -y upgrade && \
      apt-get install dosfstools kmod xxd curl squashfs-tools bc wget pv openssl libssl-dev bison flex git \
      make u-boot-tools libmpc-dev libgmp-dev python3-pip mtd-utils libncurses* mtools cpio rsync qemu-user-static binfmt-support -y

RUN python3 -m pip install pycryptodomex pyelftools Crypto
RUN ln -s /usr/bin/python3 /usr/bin/python

