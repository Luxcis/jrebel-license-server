# JrebelLicenseServer

- 搭建jrebel激活服务; 欢迎star。
- 运行环境：java 1.8



# 使用教程

1. 准备工作，你需要一个后台一直运行的服务，可以在阿里云购买一台轻量级应用服务器，并且安装好java环境；

2. 克隆本项目，打成jar包，会生成jar包，或者到这里[直接下载](https://github.com/wyx176/jrebel-license-server/releases)也行（已经打好包了）

   ```
   mvn clean package
   ```

3. 把jar包传送到云服务器上，然后进入到jar包所在目录，执行以下命令：

   ```bash
   # nohup命令&：表示后台运行，这样保证ssh连接断开服务也是一直开着的
   nohup java -jar JrebelLicenseServer.jar -p 9009 &
   ```

4. 最后，可以检查下是否OK了，可以通过浏览器访问ip:9009或者使用命令查看：  `ps -ef | grep java`

5. 也可以直接使用docker-compose.yml
```yml
services:
   jrebel:
      image: wyx176/jrebel:latest
      container_name: jrebel
      ports:
         - "9009:9009"
      restart: unless-stopped
```

# Jrebel License Server for Java

A license server for Jrebel products, it also supports JRebel for Android and XRebel.

***

NOTE: This is provided for educational purposes only. Please support genuine.
***
## Setup
Run:
```
cd /path/to/project
mvn compile 
mvn exec:java -Dexec.mainClass="org.jrebel.server.MainServer" -Dexec.args="-p 9009"
```
Packing a runnable jar:
```
mvn package
```
then
```
 nohup java -jar JrebelLicenseServer.jar -p 9009 &
```
default port is 9009.

## Docker
Build image
```
mvn package 
docker build -t jrebel .
```

start container
```
docker run -d --name jrebel --restart always -e PORT=9009 -p 9009:9009 jrebel
```


Or Usage docker-compose.yml
```yml
services:
  jrebel:
    image: wyx176/jrebel:latest
    container_name: jrebel
    ports:
      - "9009:9009"
    restart: unless-stopped
```
default port is 9009,you can modify it
## Support

Jrebel

JRebel for Android

XRebel




