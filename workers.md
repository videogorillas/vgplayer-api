# Workers deployment

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
