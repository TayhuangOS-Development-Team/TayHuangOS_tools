#!/bin/bash
#
# 仅支持某些发行版

echo "输入当前发行版的包管理器（仅输入序号）：
	1) apt
	2) pacman
	3) 其他"
read packman
case $packman in
	1) sudo apt install nasm qemu qemu-system-x86 make python3-pip grub2
	;;
	2) sudo pacman -S nasm qemu make python-pip grub
	;;
	*) echo "暂不支持该发行版，请手动安装nasm qemu qemu-system-x86 make python3-pip grub2（软件包名称可能因发行版而不同）并pip install opencv-python
（欢迎提交PR补充内容）"
	;;
esac

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
