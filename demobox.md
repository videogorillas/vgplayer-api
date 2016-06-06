# DemoBox install guide

```
https://github.com/videogorillas/vgplayer-api/blob/master/deployment.md
https://github.com/videogorillas/vgplayer-api/blob/master/workers.md

https://www.virtualbox.org/wiki/Downloads
VirtualBox 5.0.18 for OS X hosts 
VirtualBox 5.0.18 Oracle VM VirtualBox Extension Pack
ubuntu server 14.04

openssh server
samba file server

sudo apt-get install avahi-daemon

vi /etc/avahi/avahi-daemon.conf

host-name=demobox
domain-name=local

sudo apt-get install nginx
sudo mkdir /usr/share/nginx/html/demo
sudo chown zhukov /usr/share/nginx/html/demo
echo "demo content here" > /usr/share/nginx/html/demo/index.html
curl http://demobox.local/demo/
```


# Workers 

```
# sudo apt-get install imagemagick
# sudo apt-get install fonts-liberation

# sudo su - 
# curl -sL https://deb.nodesource.com/setup_5.x | bash -
# sudo apt-get install nodejs
```

# FFmpeg

```
# sudo apt-get install unzip

# sudo add-apt-repository ppa:mc3man/trusty-media
# sudo apt-get update

# sudo apt-get install libxvidcore4 libx265-79 libx264-148 libvorbisenc2 libvidstab1.0 libspeex1 libsoxr0 libpulse0 libopus0 libopencore-amrwb0 libopencore-amrnb0 libmp3lame0 libfdk-aac0 libfaac0

scp ffmpeg-3.0.1.zip demobox.local:

sudo ln -s /usr/lib/x86_64-linux-gnu/libmp3lame.so.0 /usr/lib/x86_64-linux-gnu/libmp3lame.so

cd ~
mkdir ffmpeg-3.0.1
cd ffmpeg-3.0.1
unzip ~/ffmpeg-3.0.1.zip

mkdir sessions
mkdir logs
mkdir worker
mkdir worker_storage
mkdir storage
mkdir watermarks

vi config.json

{
  "redisDb": 0,
  "httpport": 8042,
  "httpsport": 8443,
  "redisHost": "localhost",
  "websiteDomain": "demobox.local:8042",
  "cloudfrontDomain": "demobox.local:8042",
  "logsDir": "/home/zhukov/logs",
  "sessionsDir": "/home/zhukov/sessions",
  "workerStorageDir": "/home/zhukov/worker_storage/",
  "prodStorageDir": "/home/zhukov/storage/",
  "watermarkStorageDir": "/home/zhukov/watermarks",
  "ffmpeg": "/home/zhukov/ffmpeg-3.0.1/local/bin/ffmpeg",
  "ffprobe": "/home/zhukov/ffmpeg-3.0.1/local/bin/ffprobe",
  "convert": "/usr/bin/convert",
  "wsurl": "ws://demobox.local:8042/ws/rtalk",
  "serverurl": "http://demobox.local:8042",
  "priorityAlgorithm": "faststart",
  "drawtext_fontfile": "/usr/share/fonts/truetype/liberation/LiberationSans-Regular.ttf",
  "fakem9k": true
}

ln -s ~/config.json ~/worker/
```

# Download worker

```
curl -vv -f -O -J -L http://localhost:8042/workersmain.js
rm workersmain.js
ln -s `ls -t w*js | head -1` workersmain.js

npm install websocket
```

# Start Scripts

```
scp cloud2398-webserver.conf demobox.local:
scp cloud2398-dispatcher.conf demobox.local:
# sudo cp cloud2398-*conf /etc/init
```

# Demo content

```
scp -r contexter demobox.local:/usr/share/nginx/html/demo/
scp -r testdiff demobox.local:

cd ~/Box Sync/pete/3min
scp * demobox.local:/usr/share/nginx/html/demo/pete
cd ~/Box Sync/pete
scp *stl demobox.local:/usr/share/nginx/html/demo/pete

scp cloud2398/testdata/watermarks/*png demobox.local:watermarks/
```

# Diff

```
ln -s testdiff/mrestore-upload ~/bigfoot-upload
ln -s testdiff/mrestore-projects ~/bigfoot-projects
ln -s testdiff/mrestore-upload ~/mrestore-upload
ln -s testdiff/mrestore-projects ~/mrestore-projects
```

# Debug

```
sudo tail -f /var/log/upstart/cloud2398-dispatcher.log
```