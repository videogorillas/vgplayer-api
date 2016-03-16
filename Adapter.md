# VG Adapter API
 Check out http://docs.vgbrain.apiary.io/ for usage examples and code samples

# Post New Media

You may create your own media recognition tasks using this action. It takes a JSON object containing a media and a collection of commands to perform actions on media.

Request
```
POST /api/1/media

Content-Type:application/json

{
  "url": "https://www.dropbox.com/s/sdqg1a03vo2hggl/11043435_10152889047648640_3006656993036528196_o.jpg?dl=1",
  "commands": [ "nocache", "makehls1", "vgproxy", "makedash" ],
  "commandParams": {
   "makedash": {"watermarkText": "hello world"}
  }
}
```

Response
```json
{
  "type": "Media",
  "id": "m4",
  "url": "https://www.dropbox.com/s/sdqg1a03vo2hggl/11043435_10152889047648640_3006656993036528196_o.jpg?dl=1",
  "hasThumbnail": false,
  "commands": [ "nocache", "makehls1", "vgproxy", "makedash" ]
}
```

Note: **Media id** is `m4`

# Job Types

"download" - download original media and store it in block storage

"downloadProxy" - download original proxy and store it in format for fast proxy creation

"mal9k" - detect objects in video

"makehls1" - create HLS stream

"makedash" - create DASH stream and VG pro proxy (TODO: split into two different job types)

"mediainfo" - run mediainfo command on original media and make the result available via api 

"diff_proxy" - create proxy for differential analysis 

"diff_compare" - compare two proxies and make result json available via api

"nocache" - fake command to prevent original media download

"detectmusic" - detect music in all channels of media and make it available via api 

"detectscenes" - detect scenes in all channels of media and make it available via api

# Get Media Status

Request
```
GET /api/1/media/get/${MEDIA_ID_HERE}
```

Response
```json
{
  "type": "Media",
  "id": "m4",
  "url": "https://www.dropbox.com/s/sdqg1a03vo2hggl/11043435_10152889047648640_3006656993036528196_o.jpg?dl=1",
  "hasThumbnail": false,
  "commands": [ "nocache", "makehls1", "vgproxy", "makedash" ],
  "commandParams": {"makedash": {"watermarkText": "hello world"}},
  "makedashJobId": "v7",
  "vgproxyJobId": "v4"
}
```

Note: **Job ids** for `makedash` and `vgproxy`  are `v7` and `v4`

# Get Job Status

Request
```
GET /api/1/job/get/${JOB_ID_HERE}
```

Response
```json
{
  "type": "Job",
  "id": "v5565",
  "mediaId": "m2744",
  "command": "makehls1",
  "progress": 37,
  "durationSec": 36.44,
  "isFinished": true,
  "isStarted": false,
  "isBuried": false,
  "isCancelled": false,
  "ctime": 1454949545112,
  "finishedTime": 1454949556052,
  "startedTime": 1454949545184,
  "buries": 0,
  "diffCount": 0,
  "diffMatch": 0.0,
  "hlsDurationSec": 37,
  "resultUrls": [
    "http://kote.videogorillas.com:8042/api/1/storage/m2744/v5565/hls.m3u8",
    "http://kote.videogorillas.com:8042/api/1/storage/m2744/v5565/makehls1_inchunk_cq34114.js",
    "http://kote.videogorillas.com:8042/api/1/storage/m2744/v5565/hls00003.ts",
    "http://kote.videogorillas.com:8042/api/1/storage/m2744/v5565/hls00002.ts",
    "http://kote.videogorillas.com:8042/api/1/storage/m2744/v5565/hls00000.ts",
    "http://kote.videogorillas.com:8042/api/1/storage/m2744/v5565/hls00001.ts",
    "http://kote.videogorillas.com:8042/api/1/storage/m2744/v5565/hls00005.ts",
    "http://kote.videogorillas.com:8042/api/1/storage/m2744/v5565/hls00004.ts",
    "http://kote.videogorillas.com:8042/api/1/storage/m2744/v5565/hls00006.ts",
    "http://kote.videogorillas.com:8042/api/1/storage/m2744/v5565/hls00007.ts",
    "http://kote.videogorillas.com:8042/api/1/storage/m2744/v5565/cq34114.log"
  ],
  "url": "https://www.dropbox.com/s/sdqg1a03vo2hggl/11043435_10152889047648640_3006656993036528196_o.jpg?dl=1"
}
```
