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
   "makedash": {"watermarktext": "hello world"},
   "vgproxy": {"watermarktext": "hello world"},
   "makehls1": {"watermarktext": "hello world"}
  }
};

var request = new XMLHttpRequest();

request.open('POST', 'http://vg.adapter.host:8042/api/2/media');

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
POST /api/2/media

Content-Type:application/json

{
  "url": "http://server.com/path/to/video.mp4",
  "commands": [ "nocache", "makehls1", "vgproxy", "makedash" ],
  "commandParams": {
   "makedash": {"watermarktext": "hello world"},
   "vgproxy": {"watermarktext": "hello world"},
   "makehls1": {"watermarktext": "hello world"}
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
   "makedash": {"watermarktext": "hello world"},
   "vgproxy": {"watermarktext": "hello world"},
   "makehls1": {"watermarktext": "hello world"}
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

request.open('GET', 'http://vg.adapter.host:8042/api/2/media/get/'+mediaId);

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
GET /api/2/media/get/${MEDIA_ID_HERE}
```

Response
```json
{
  "type": "Media",
  "id": "m4",
  "hasThumbnail": true,
  "commands": [
    "vgproxy",
    "makedash",
    "makehls1"
  ],
  "commandParams": {
    "makedash": {
      "watermarktext": "hello world"
    },
    "makehls1": {
      "watermarktext": "hello world"
    },
    "vgproxy": {
      "watermarktext": "hello world"
    }
  },
  "jobIds": {
    "v30": "vgaudio",
    "v32": "high23",
    "v31": "makedash",
    "v34": "makehls1",
    "v33": "aacpassthru",
    "v27": "iframes24",
    "v26": "vgproxy",
    "v29": "thumbs",
    "v28": "thumbshq"
  },
  "filename": "maleficient.mp4",
  "durationSec": 121.51
}
```

Note: **Job ids** for `makedash` and `vgproxy`  are `v31` and `v26`

# Get Job Status

Request
```
GET /api/1/job/get/${JOB_ID_HERE}
```

Response
```json
{
  "type": "Job",
  "id": "v34",
  "mediaId": "m4",
  "command": "makehls1",
  "progress": 120,
  "durationSec": 121.51,
  "hasResult": false,
  "isFinished": true,
  "isStarted": false,
  "isBuried": false,
  "isCancelled": false,
  "ctime": 1467279867904,
  "finishedTime": 0,
  "startedTime": 0,
  "buries": 0,
  "diffCount": 0,
  "diffMatch": 0.0,
  "params": {
    "watermarktext": "hello world"
  },
  "resultUrls": [
    "/api/1/storage/m4/v34/hls.m3u8"
  ],
  "url": "http://server.com/path/to/video.mp4",
  "linkedJobIds": [
    "v32",
    "v33",
    "v28"
  ],
  "segmentsAvailable": false,
  "segmentsReady": true
}
```

Note: HLS url for player is in **resultUrls** array `/api/1/storage/m4/v34/hls.m3u8`

# Get Completed Chunks of a Job

Available since version 0.2

Note: Completed Chunks available only for **linkedJobIds** array, **linkedJobIds** for this example is `v32, v33, v28`

Request
```
GET /api/1/job/getCompletedChunks/${JOB_ID_HERE}
```

Response
```json
[
  {
    "_rev": 2,
    "id": "c383",
    "command": "thumbshq",
    "jobId": "v28",
    "mediaId": "m4",
    "mseq": 0,
    "status": "DONE",
    "startSec": 0.0,
    "duration": 6.00600004196167,
    "videoUrl": "/api/1/storage/m4/segments/v00_0000.mov",
    "resultUrls": [
      "http://vg.adapter.host:8042/api/1/storage/m4/v28/thumbshq_c383.mp4"
    ],
    "params": {
      "watermarktext": "hello world"
    },
    "type": "Chunk"
  },
  {
    "_rev": 2,
    "id": "c388",
    "command": "thumbshq",
    "jobId": "v28",
    "mediaId": "m4",
    "mseq": 1,
    "status": "DONE",
    "startSec": 6.00600004196167,
    "duration": 4.462791919708252,
    "videoUrl": "/api/1/storage/m4/segments/v00_0001.mov",
    "resultUrls": [
      "http://vg.adapter.host:8042/api/1/storage/m4/v28/thumbshq_c388.mp4"
    ],
    "params": {
      "watermarktext": "hello world"
    },
    "type": "Chunk"
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

```javascript
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

```javascript
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
```javascript
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
