# 可能用到的命令

echo "---------- 拉取服务器基础配置 ----------"
git clone https://github.com/urnotzane/dst-server.git

echo "---------- 创建服务器文件夹 ----------"
mkdir -p .klei/DoNotStarveTogether/MyDediServer
cp -rf ./dst-server/ .klei/DoNotStarveTogether/MyDediServer
cp -f ./dst-server/start_server.sh ./

echo "---------- 后台运行服务器 ----------"
nohup ./start_server.sh & echo $! > pidfile.txt

echo "---------- `cat pidfile.txt` ----------"
