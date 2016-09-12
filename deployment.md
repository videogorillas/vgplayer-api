
# Package contents

1.`cloud-1234-uberjar.jar` file.
 
This is `VGPlayer Adapter` application package. Version "1234".

It implements such services:
   - Queue Manager Service
   - Dispatcher Service
   - HTTP Live Streaming (HLS) Service



# Workflow Overview

Media url is submitted to Queue Manager via a RESTful API.
Media job is picked up by Dispatcher.
Dispatcher splits Media Job into multiple chunks: e.g. 10 minute video will be split into 120 chunks each five second long.
Chunks are picked up from chunk queue by Workers.
When workers are done the results are submitted to Queue and Cache Manager.

# Deployment Diagram

![](Deployment.png "Deployment")

# Logical Workflow Diagram

![](LogicalFlow.png "Logical")

# Environment

* Ubuntu 14.04 LTS 64bit
* Available Storage approx 2MB per second of content
* Shared Database and Storage access for Queue Manager and Chunk Dispatcher
* No root access required
* Open port 8042 (configurable)

# Queue Manager Node

* Ubuntu 14.04 LTS 64bit
* Redis 3+
* Java 8
* Ffmpeg 2.8+ with SSL support

# Worker Nodes

* Ubuntu 14.04 LTS 64bit
* NodeJS 5.9+
* Ffmpeg 2.8+ with SSL support

# Queue Manager Node Setup

## Install java8

```
# sudo apt-add-repository ppa:webupd8team/java
# sudo apt-get update
# sudo apt-get install oracle-java8-installer
```

## Install Redis

Redis server should be of version 2.8.7 or higher (BITPOS command support) The one that comes with stock ubuntu 14.04 is outdated

```
# sudo add-apt-repository ppa:chris-lea/redis-server
# sudo apt-get update
# sudo apt-get install redis-server
```

## Install ffmpeg 

Download ffmpeg 2.8+ sources http://ffmpeg.org/download.html

Edit [`ffmpeg_build.sh`](ffmpeg_build.sh) script to point to ffmpeg souce folder.

Build ffmpeg:

```
# ./ffmpeg_build.sh
```


# Download Application jar

cloud-0.1-uberjar.jar

# Create config file

`# vi config.json`

```json
{
  "redisDb": 0,
  "httpport": 8042,
  "httpsport": 8443,
  "redisHost": "localhost",
  "websiteDomain": "zhuker.local:8042",
  "cloudfrontDomain": "zhuker.local:8042",
  "logsDir": "logs",
  "keystorePath": "c23.keystore",
  "keystorePassword": "123456",
  "sessionsDir": "sessions",
  "workerStorageDir": "/Users/zhukov/worker_storage/",
  "prodStorageDir": "/Users/zhukov/storage/",
  "watermarkStorageDir": "/Users/zhukov/watermarks", 
  "priorityAlgorithm": "faststart", 
  "ffmpeg": "/usr/local/bin/ffmpeg",
  "convert": "/usr/local/bin/convert",
  "ffprobe": "/usr/local/bin/ffprobe",
  "youtubedl": "/usr/local/bin/youtube-dl",
  "wsurl": "ws://zhuker.local:8042/ws/rtalk",
  "serverurl": "http://zhuker.local:8042",
  "cloudjar": "/Users/zhukov/git/cloud2398/cloud-uberjar.jar",
  "drawtext_fontfile": "/Library/Fonts/Arial.ttf",
  "fakem9k": true,
  "s3Enabled": "false",
  "s3AccessKey": "ACCESS_KEY",
  "s3SecretKey": "SECRET_KEY",
  "s3LinksExpireTime": "1005000",
  "s3Bucket": "coolbucket"
}
```

## Config FAQ

Q: What is `"redisDb": 0`?

A: Redis has a notion of multiple separate database instances within one redis process, this config setting tells webserver to use specific redis db number

Q: What is `keystorePath` supposed to point to?

A: Only needed if you want web server to take care of SSL

Q: What is supposed to install `convert`

A: `convert` is a part of `imagemagick` package it should be installed on worker nodes

Q: Where does youtubedl come from?

A: For testing purposes only, you may disregard/delete this setting from `config.json` file

Q: What is `drawtext_fontfile` used for, where does it come from on a Ubuntu machine?

A: This is the path to TTF file to render on demand watermark. 

On Ubuntu fonts come in separate packages. We recommend using Liberation font family if you want a simple sans serif font.

Install package with 

```
sudo apt-get install fonts-liberation
```

And Configure 
```
drawtext_fontfile=/usr/share/fonts/truetype/liberation/LiberationSans-Regular.ttf
```

Q: What is fakem9k?

A: Disregard this config option, it is used for testing VG neural network object recognition framework.

Q: What are the persistence expectations of any of the ${x}Dir locations?

A: `watermarkStorageDir` - your watermark image logos are stored here, so this one should be persistent

`prodStorageDir` - worker results can be uploaded to S3 or to this storage dir, when you don't need a perticular media you can delete  `prodStorageDir/$MEDIAID` folder

`workerStorageDir` - workers keep their temporary files here, after worker node is done with a chunk this folder can be safely deleted.

Q: In what unit are s3linksexpiretime?
A: In seconds. Please note, this value should be less than 7 days (604800)


# S3 Enabled
Worked for DASH stream. If option "s3Enabled" is enabled, files stores to s3 instead of local storage.
Steps to activate s3 storage support:
 - option s3Enabled in config file should be true
 - add access, secret key and bucket in config file

# Start Queue Manager

```
# java -cp cloud-717-uberjar.jar -Dffmpeg=/home/ubuntu/cloud2398/ffmpeg-3.0.1/ffmpeg -Dffprobe=/home/ubuntu/cloud2398/ffmpeg-3.0.1/ffprobe com.vg.cloud.CloudWebServerMain
```

# Start Dispatcher

```
# java -cp cloud-717-uberjar.jar -Dffmpeg=/home/ubuntu/cloud2398/ffmpeg-3.0.1/ffmpeg -Dffprobe=/home/ubuntu/cloud2398/ffmpeg-3.0.1/ffprobe  com.vg.cloud.DispatcherMain
```

# Start Workers

See [Worker Guide](workers.md)

