# Workers deployment

Linux and Mac OS X

```npm install websocket```

Mac OSX

```
brew install ffmpeg --with-freetype --with-fontconfig --with-faac
brew install imagemagick
brew install nodejs
```

Linux

Download and compile ffmpeg with `ffmpeg_build.sh` 

```
apt-get install imagemagick
apt-get install fonts-liberation
```

edit worker `config.json` 

Worker Config example
```json
{
  "redisDb": 0,
  "httpport": 8042,
  "httpsport": 8443,
  "redisHost": "zhuker.local",
  "websiteDomain": "zhuker.local:8042",
  "cloudfrontDomain": "zhuker.local:8042",
  "logsDir": "logs",
  "keystorePath": "c23.keystore",
  "keystorePassword": "123456",
  "sessionsDir": "sessions",
  "workerStorageDir": "/Users/zhukov/worker_storage/",
  "prodStorageDir": "/Users/zhukov/storage/",
  "ffmpeg": "/usr/local/bin/ffmpeg",
  "convert": "/usr/local/bin/convert",
  "ffprobe": "/usr/local/bin/ffprobe",
  "youtubedl": "/usr/local/bin/youtube-dl",
  "wsurl": "ws://zhuker.local:8042/ws/rtalk",
  "serverurl": "http://zhuker.local:8042",
  "cloudjar": "/Users/zhukov/git/cloud2398/cloud-uberjar.jar",
  "drawtext_fontfile": "/Library/Fonts/Arial.ttf",
  "fakem9k": true
}
```
Note: use `/usr/share/fonts/truetype/liberation/LiberationSans-Regular.ttf` for `drawtext_fontfile` on Ubuntu

## Download or Update Worker JS code

```curl -vv -f -O -J -L http://localhost:8042/workersmain.js```

## Launch Worker

```node workersmain.js```

### Launch Worker listening on `downloadQueue`

```node workersmain.js downloadQueue```

### Launch Worker with id

```node workersmain.js chunkQueue externalWorkerIdHere```

### Launch Latest Worker JS
```bash
latest=`ls -t workersmain*js`
node $latest
```
