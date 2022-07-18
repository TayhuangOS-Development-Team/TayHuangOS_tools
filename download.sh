#!/bin/bash
#
# 仅支持某些发行版

echo "输入当前发行版的包管理器（仅输入序号）：
	1) apt
	2) pacman
	3) 其他"
read packman
case $packman in
	1) sudo apt install nasm make python3-pip grub2 ninja-build libsdl2-dev curl wget git
	curl https://mirrors.tuna.tsinghua.edu.cn/git/qemu/qemu.sh | bash
	cd ./qemu/
	mkdir ./build/
	cd ./build/
	../configure --enable-kvm --enable-debug --target-list="x86_64-softmmu"
	make -j8
	sudo make install
	cd ../
	;;
	2) sudo pacman -S nasm qemu make python-pip grub curl wget git
	;;
	*) echo "暂不支持该发行版，请手动安装nasm qemu qemu-system-x86 make python3-pip grub2（软件包名称可能因发行版而不同）并pip install opencv-python
（欢迎提交PR补充内容）"
	;;
esac

echo "downloading packages..."
curl https://mirrors.aliyun.com/gnu/mpfr/mpfr-4.1.0.tar.xz --output ./mpfr-4.1.0.tar.xz
curl https://mirrors.aliyun.com/gnu/mpc/mpc-1.2.1.tar.gz --output ./mpc-1.2.1.tar.gz
curl https://mirrors.aliyun.com/gnu/gmp/gmp-6.2.1.tar.xz --output ./gmp-6.2.1.tar.xz
curl https://mirrors.aliyun.com/gnu/binutils/binutils-2.33.1.tar.xz --output ./binutils-2.33.1.tar.xz
curl https://mirrors.aliyun.com/gnu/gcc/gcc-9.4.0/gcc-9.4.0.tar.xz--output ./gcc-9.4.0.tar.xz	
	
echo "
本系统依赖opencv-python包，输入想要的配置序号：
	1）仅为自己安装
	2）为所有用户安装
	3）自己手动安装
"
read use_sudo
case $use_sudo in
	1) echo "正在安装python包..."
	pip install -i https://pypi.tuna.tsinghua.edu.cn/simple opencv-python
	;;
	2) echo "正在安装python包..."
	sudo pip install -i https://pypi.tuna.tsinghua.edu.cn/simple opencv-python
	;;
esac
echo "安装完成"
