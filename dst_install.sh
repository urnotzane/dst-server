#!/bin/bash

exclusive_user=steam_dst

echo "---------- 安装i386 ----------"
sudo dpkg --add-architecture i386
sudo apt-get update -y
sudo apt-get install libstdc++6:i386 libgcc1:i386 libcurl4-gnutls-dev:i386 -y

echo "---------- 创建专属用户,后续游戏文件将全部保存在此用户文件夹内 ----------"
useradd -m $exclusive_user

echo "---------- 获取当前目录 ----------"
cur_dir=$(pwd)
# chmod a+rwx ./start_server.sh
cp -f ./start_server.sh /home/$exclusive_user
chmod 777 /home/$exclusive_user/start_server.sh

echo "---------- 进入专属用户文件夹 ----------"
cd /home/$exclusive_user

echo "---------- 安装steamcmd ----------"
sudo apt install steamcmd

echo "---------- 如果是64位系统还需要以下命令 ----------"
sudo add-apt-repository multiverse -y
sudo apt update -y
sudo apt install lib32gcc1 steamcmd -y

echo "---------- 链接steamcmd命令 ----------"
ln -s /usr/games/steamcmd steamcmd

echo "---------- 安装依赖 ----------"
sudo apt-get install lib32gcc1 -y

echo "---------- 切换专属用户后继续执行EOF中间的命令 ----------"
su - $exclusive_user <<EOF

# cp -f $cur_dir/start_server.sh ./
echo "---------- 创建并跳转至Steam文件夹 ----------"
mkdir ~/Steam && cd ~/Steam

echo "---------- 下载steam_linux并解压 ----------"
wget "https://steamcdn-a.akamaihd.net/client/installer/steamcmd_linux.tar.gz"
tar -xvzf steamcmd_linux.tar.gz
rm -rf steamcmd_linux.tar.gz
EOF
