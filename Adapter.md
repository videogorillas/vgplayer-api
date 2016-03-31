# VG Adapter API
 Check out http://docs.vgbrain.apiary.io/ for usage examples and code samples

# Post New Media

You may create your own media recognition tasks using this action. It takes a JSON object containing a media and a collection of commands to perform actions on media.

JavaScript example
```js

var videoUrl = "http://server.com/path/to/video.mp4";
var mediaRequest = {
  'url': videoUrl,
  "commands": [ "nocache", "makehls1", "vgproxy", "makedash" ],
  "commandParams": {
   "makedash": {"watermarkText": "hello world"},
   "vgproxy": {"watermarkText": "hello world"},
   "makehls1": {"watermarkText": "hello world"}
  }
};

var request = new XMLHttpRequest();

request.open('POST', 'http://kote.videogorillas.com:8042/api/1/media');

request.setRequestHeader('Content-Type', 'application/json');

request.onreadystatechange = function () {
  if (this.readyState === 4) {
    console.log('Status:', this.status);
    console.log('Headers:', this.getAllResponseHeaders());
    var mediaResponse = JSON.parse(this.responseText);
    console.log('Media Response:', mediaResponse);
  }
};

request.send(JSON.stringify(mediaRequest));
```

Request
```
POST /api/1/media

Content-Type:application/json

{
  "url": "http://server.com/path/to/video.mp4",
  "commands": [ "nocache", "makehls1", "vgproxy", "makedash" ],
  "commandParams": {
   "makedash": {"watermarkText": "hello world"},
   "vgproxy": {"watermarkText": "hello world"},
   "makehls1": {"watermarkText": "hello world"}
  }
}
```

Response
```json
{
  "type": "Media",
  "id": "m4",
  "url": "http://server.com/path/to/video.mp4",
  "hasThumbnail": false,
  "commands": [ "nocache", "makehls1", "vgproxy", "makedash" ],
  "commandParams": {
   "makedash": {"watermarkText": "hello world"},
   "vgproxy": {"watermarkText": "hello world"},
   "makehls1": {"watermarkText": "hello world"}
  }
}
```

Note: **Media id** is `m4`

# Job Types

"makehls1" - create HLS stream

"makedash" - create DASH stream 

"vgproxy" - create VG pro proxy

"nocache" - fake command to prevent original media download

"download" - download original media and store it in block storage

"downloadProxy" - download original proxy and store it in format for fast proxy creation

"mal9k" - detect objects in video

"mediainfo" - run mediainfo command on original media and make the result available via api 

"diff_proxy" - create proxy for differential analysis 

"diff_compare" - compare two proxies and make result json available via api

"detectmusic" - detect music in all channels of media and make it available via api 

"detectscenes" - detect scenes in all channels of media and make it available via api

# Get Media Status


```js

var mediaId = "m4242"

var request = new XMLHttpRequest();

request.open('GET', 'http://kote.videogorillas.com:8042/api/1/media/get/'+mediaId);

request.onreadystatechange = function () {
  if (this.readyState === 4) {
    console.log('Status:', this.status);
    console.log('Headers:', this.getAllResponseHeaders());
    
    var media = JSON.parse(this.responseText);
    
  }
};

request.send();
```

Request
```
GET /api/1/media/get/${MEDIA_ID_HERE}
```

Response
```json
{
  "type": "Media",
  "id": "m4",
  "url": "http://server.com/path/to/video.mp4",
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
    "/api/1/storage/m2744/v5565/hls.m3u8",
    "/api/1/storage/m2744/v5565/makehls1_inchunk_cq34114.js",
    "/api/1/storage/m2744/v5565/hls00003.ts",
    "/api/1/storage/m2744/v5565/hls00002.ts",
    "/api/1/storage/m2744/v5565/hls00000.ts",
    "/api/1/storage/m2744/v5565/hls00001.ts",
    "/api/1/storage/m2744/v5565/hls00005.ts",
    "/api/1/storage/m2744/v5565/hls00004.ts",
    "/api/1/storage/m2744/v5565/hls00006.ts",
    "/api/1/storage/m2744/v5565/hls00007.ts",
    "/api/1/storage/m2744/v5565/cq34114.log"
  ],
  "url": "https://www.dropbox.com/s/sdqg1a03vo2hggl/11043435_10152889047648640_3006656993036528196_o.jpg?dl=1"
}
```

Note: HLS url for player is in **resultUrls** array `/api/1/storage/m2744/v5565/hls.m3u8`

# Get Completed Chunks of a Job

Available since version 0.2

Request
```
GET /api/1/job/getCompletedChunks/${JOB_ID_HERE}
```

Response
```json
[
  {
    "id": "cq9608",
    "command": "thumbshq",
    "jobId": "v1161",
    "mediaId": "m331",
    "mseq": 0,
    "startSec": 0.0,
    "duration": 19.978708267211914,
    "videoUrl": "/api/1/storage/m331/segments/v00_0000.mp4",
    "workerId": "worker-42",
    "resultUrls": [
      "http://zhuker.local:8042/api/1/storage/m331/v1161/thumbshq_cq9608.mp4"
    ]
  },
  {
    "id": "cq9613",
    "command": "thumbshq",
    "jobId": "v1161",
    "mediaId": "m331",
    "mseq": 1,
    "startSec": 19.97800064086914,
    "duration": 3.96270751953125,
    "videoUrl": "/api/1/storage/m331/segments/v00_0001.mp4",
    "workerId": "worker-43",
    "resultUrls": [
      "http://zhuker.local:8042/api/1/storage/m331/v1161/thumbshq_cq9613.mp4"
    ]
  }
  ]
  ```

# WebSocket live update api

`/ws/api` - websocket endpoint for all job and media updates

Example code 

```javascript
ws = new WebSocket("ws://localhost:8042/ws/api");
ws.onmessage = function(e){
    if (debug) {
        console.log(e);
    }
    var obj = JSON.parse(e.data);
    if (obj["type"] == "Media") {
        console.log("media update", obj);
    }
    if (obj["type"] == "Job") {
        console.log("job update", obj);
    }
};
```

`/ws/1/chunks` - websocket endpoint for all chunk updates

Example code 

```javascript
ws = new WebSocket("ws://localhost:8042/ws/1/chunks");
ws.onmessage = function(e){
    if (debug) {
        console.log(e);
    }
    var obj = JSON.parse(e.data);
    if (obj["type"] == "Chunk") {
        var chunk = obj;
        console.log("chunk update", chunk);
    }
};
```

## Example Chunk Updates

### Chunk Reserved by a worker 

tube: `chunkQueue`
action: `RESERVED`
Note: workerId is not present

```json
{ command: 'iframes24',
  jobId: 'v1315',
  mediaId: 'm349',
  mseq: 0,
  startSec: 0,
  duration: 10.052166938781738,
  videoUrl: '/api/1/storage/m349/segments/v00_0000.mp4',
  params: { watermarktext: 'ga ag ga IP: 104.175.210.107' },
  id: 'cq12000',
  type: 'Chunk',
  tube: 'chunkQueue',
  action: 'RESERVED' }
```

### Chunk Completed by worker with id

`INSERTED` into `chunkQueue.done` and `DELETED` from `chunkQueue`

Note: workerId is `worker1`

```json
{ command: 'iframes24',
  jobId: 'v1315',
  mediaId: 'm349',
  mseq: 0,
  startSec: 0,
  duration: 10.052166938781738,
  videoUrl: '/api/1/storage/m349/segments/v00_0000.mp4',
  params: { watermarktext: 'ga ag ga IP: 104.175.210.107' },
  workerId: 'worker1',
  id: 'cq12000',
  resultUrls: [ 'http://zhuker.local:8042/api/1/storage/m349/v1315/iframes24_cq12000.mp4' ],
  type: 'Chunk',
  tube: 'chunkQueue.done',
  action: 'INSERTED' }
```
```json
{ command: 'iframes24',
  jobId: 'v1315',
  mediaId: 'm349',
  mseq: 0,
  startSec: 0,
  duration: 10.052166938781738,
  videoUrl: '/api/1/storage/m349/segments/v00_0000.mp4',
  params: { watermarktext: 'ga ag ga IP: 104.175.210.107' },
  id: 'cq12000',
  type: 'Chunk',
  tube: 'chunkQueue',
  action: 'DELETED' }
```
