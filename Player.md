# <a id="Player"></a>`Player` class #

## `Player Constructor` ##
- [`constructor`](#Player_constructor)

## `Player Instance Methods` ##

### Initialization Methods

- [`load`](#Player_load)
- [`loadUrl`](#Player_loadUrl)
- [`loadAudioTrack`](#Player_loadAudioTrack)
- [`close`](#Player_close)
- [`addAudioTrack`](#Player_addAudioTrack)
- [`addAudioTrackWithId`](#Player_addAudioTrackWithId)
- [`audioAddHandler`](#Player_audioAddHandler)
- [`setAudioTrackUrl`](#Player_setAudioTrackUrl)
- [`conformAudioTrack`](#Player_conformAudioTrack)
- [`getAudioTrack`](#Player_getAudioTrack)
- [`addCaptions`](#Player_addCaptions)
- [`addCaptionsHandler`](#Player_addCaptionsHandler)
- [`disableHotKeys`](#Player_disableHotKeys)
- [`enableHotKeys`](#Player_enableHotKeys)
- [`setStartTapeTimecode`](#Player_setStartTapeTimecode)
- [`setStartUTCTimestamp`](#Player_setStartUTCTimestamp)
- [`addEventListener`](#Player_addEventListener)
- [`removeEventListener`](#Player_removeEventListener)
- [`getFilmStripDrawer`](#Player_getFilmStripDrawer)
- [`getCaptionsList`](#Player_getCaptionsList)
- [`getAudioTracks`](#Player_getAudioTracks)
- [`registerPlugin`](#Player_registerPlugin)
- [`setLogLevel`](#Player_setLogLevel)

### Playback Control Methods

- [`play`](#Player_play)
- [`playAtRate`](#Player_playAtRate)
- [`playFaster`](#Player_faster)
- [`playFasterBackwards`](#Player_fasterBackwards)
- [`pause`](#Player_pause)
- [`togglePlay`](#Player_togglePlay)
- [`setVolume`](#Player_setVolume)
- [`getVolume`](#Player_getVolume)
- [`seek`](#Player_seek)
- [`seekFrame`](#Player_seekFrame)
- [`seekSec`](#Player_seekSec)
- [`seekUTCTimestamp`](#Player_seekUTCTimestamp)
- [`nextFrame`](#Player_nextFrame)
- [`previousFrame`](#Player_previousFrame)
- [`nextSec`](#Player_nextSec)
- [`previousSec`](#Player_previousSec)
- [`getCurrentAudioTrack`](#Player_getCurrentAudioTrack)
- [`setCurrentAudioTrack`](#Player_setCurrentAudioTrack)
- [`setRange`](#Player_setRange)
- [`cancelRange`](#Player_cancelRange)
- [`hasRange`](#Player_hasRange)
- [`setLoop`](#Player_setLoop)
- [`setPauseOnLoop`](#Player_setPauseOnLoop)
- [`enterFullscreen`](#Player_enterFullscreen)
- [`exitFullscreen`](#Player_exitFullscreen)
- [`muteAudioTrack`](#Player_muteAudioTrack)
- [`setVideoQuality`](#Player_setVideoQuality)

### Player Status Methods

- [`isPlaying`](#Player_isPlaying)
- [`getPlaybackRate`](#Player_getPlaybackRate)
- [`getCurrentTime`](#Player_getCurrentTime)
- [`getCurrentTimeValue`](#Player_getCurrentTimeValue)
- [`getCurrentTapeTimecode`](#Player_getCurrentTapeTimecode)
- [`getCurrentStandardTimecode`](#Player_getCurrentStandardTimecode)
- [`getCurrentFrame`](#Player_getCurrentFrame)
- [`getCurrentUTCTimestamp`](#Player_getCurrentUTCTimestamp)
- [`getTimeSample`](#Player_getTimeSample)
- [`getDurationSec`](#Player_getDurationSec)
- [`getSeekableDurationSec`](#Player_getSeekableDurationSec)
- [`getStartTapeTimecode`](#Player_getStartTapeTimecode)
- [`getStartUTCTimestamp`](#Player_getStartUTCTimestamp)
- [`getTimeline`](#Player_getTimeline)
- [`isAudioMutable`](#Player_isAudioMutable)
- [`getBuffered`](#Player_getBuffered)
- [`isLive`](#Player_isLive)


## _Player Constructor_ ##
### <a id="Player_constructor"></a>`Player()`
Constructs new Player object.


#### Arguments
1. `container` *(HTML Element)*: The container element where the player is to be created.
2. `options` *(Object)*: options map.

Options:
- `hotkeys` *(Boolean)*: - enable standard Player hotkeys. See [Hotkeys](hotkeys.md). Default is `false`
- `serverUrl` *(String)*: URL - back-end URL
- `skinless` *(Boolean)*: `true` for skinless mode (no controls at all), `false` for controls shown. Default is `false`
- `search` *(Boolean)*: `true` enable search field for caption tracks. Default is `false`
- `enableCORS` *(Boolean)*: `true` enable CORS requests for video elements. Default is `false`
- `preservePlaybackRate` *(Boolean)*: `true` never reset playback rate to 1x in [`play()`](#Player_play) and [`togglePlay()`](#Player_togglePlay), `false` reset rate to 1x. Default is `false`
- `allowCrossSiteCredentials` *(Boolean)*: `true` send cookies in cross-domain requests. Default is `false`
- `drm` *(Object)*: DRM options
- `logLevel` *([`LogLevel`](LogLevel.md))*: logging level. See [`LogLevel`](LogLevel.md). Default is `INFO`

DRM Options:
- `widevine` *(Object)*: widevine specific options
- `playready` *(Object)*: playready specific options
- `fairplay` *(Object)*: fairplay specific options

Widevine/Playready specific options:
- `laUrl` *(String)*: license acquisition url

Fairplay specific options:
- `laUrl` *(String)*: license acquisition url
- `certUrl` *(String)*: fairplay certificate url

#### Example

The following example shows the basic usage of the player.

```js
    var container = document.getElementById("playerContainer");
    var options = {
        hotkeys: true,
        serverUrl: "http://some.server.com:4242/",
        drm: {
            widevine: {
                laUrl: "http://widevine-proxy.appspot.com/proxy"
            }
        }
    };
    var player = new VG.Player(container, options);
```

* * *

## _Player Instance Methods_ ##

### <a id="Player_load"></a>`Player.prototype.load(proxyIdOrURL, onDone)`
Load VG-proxy or file or stream into the player. `proxyIdOrURL` is treated as URL and passed to [`loadUrl`](#Player_loadUrl) in these cases:

- option `serverUrl` was not passed to the constructor
- `proxyIdOrURL` is an absolute URL

In every other case `proxyIdOrURL` is treated as VG-proxy id.

`onDone` is called when the player is ready to use.

#### Arguments
1. `proxyIdOrURL` *(String)*: ID of the proxy or URL of the file/stream to open.
2. `onDone` *(Function)*: callback function to execute when the proxy is loaded, takes one argument `error`.

#### Example

```js
player.load("PROXY_ID", function(err) {
    if (!err) {
        console.log("everything loaded just fine");
        console.log("duration", player.getDurationSec());
    } else {
        console.error(err);
    }
});
```

---

### <a id="Player_loadUrl"></a>`Player.prototype.loadUrl(url, onDone)`
Load file or stream into the player. `onDone` is called when the player is ready to use.
#### Arguments
1. `url` *(String)*: url of the file/stream to open.
2. `onDone` *(Function)*: callback function to execute when the video is loaded, takes one argument `error`.

#### Example

```js
player.loadUrl("http://some.host.com/path/something.mpd", function(err) {
    if (!err) {
        console.log("everything loaded just fine");
        console.log("duration", player.getDurationSec());
    } else {
        console.error(err);
    }
});
```

---

### <a id="Player_loadAudioTrack"></a>`Player.prototype.loadAudioTrack(url, displayName, onDone)`
Add audio file as a new audio track. Use in `player.load` callback. File can be mpeg-dash descriptor or mp4. If the file contains several audio tracks only the first one will be loaded.

#### Arguments
1. `url` *(String)*: the url of audio file
2. `displayName` *(String)*: display name to show
3. `onDone` *(Function)*: callback function to execute when the track is loaded, takes one argument `error`

#### Example
```js
player.load("PROXY_ID", function (err) {
    if (!err) {
        var url = "http://some.host.com/sometrack.mpd";
        player.loadAudioTrack(url, "TRACK_NAME", function(error) {
            if (error) {
                console.log("track not loaded", error);
            } else {
                console.log("track loaded");
                player.setCurrentAudioTrack(url);
            }
        });
    }
});
```

---

### <a id="Player_close"></a>`Player.prototype.close()`
Close the video and clear player view. Also remove all event listeners added with [`addEventListener`](#Player_addEventListener).

---

### <a id="Player_addAudioTrack"></a>`Player.prototype.addAudioTrack(displayName, channelNames)`
Add audio track stub. Real audio stream can be associated with this stub later using [`setAudioTrackUrl`](#Player_setAudioTrackUrl).
Random id will be generated for this track.
Use in `player.load` callback.

#### Arguments
1. `displayName` *(String)*: display name of the track
2. `channelNames` *(Array)*: display names of audio channels in this track
String displayName, Array<String> channelNames

#### Returns
*(String)*: track id

#### Example
```js
player.load("PROXY_ID", function (err) {
    if (!err) {
        player.addAudioTrack("FILENAME", ["Left", "Right"]);
    }
});
```

---

### <a id="Player_addAudioTrackWithId"></a>`Player.prototype.addAudioTrackWithId(id, displayName, channelNames)`
Add audio track stub with id=`id`. Real audio stream can be associated with this stub later using [`setAudioTrackUrl`](#Player_setAudioTrackUrl).
Use in `player.load` callback.
#### Arguments
1. `id` *(String)*: id of the track
2. `displayName` *(String)*: display name of the track
3. `channelNames` *(Array)*: display names of audio channels in this track
String displayName, Array<String> channelNames

#### Returns
*(String)*: track id

#### Example
```js
player.load("PROXY_ID", function (err) {
    if (!err) {
        player.addAudioTrackWithId("0128749164813674", "FILENAME", ["Left", "Right"]);
    }
});
```

---

### <a id="Player_audioAddHandler"></a>`Player.prototype.audioAddHandler(callback)`
Show "add audio track" button in the player UI. `callback` function is called on click.
Use in `player.load` callback with `player.loadAudioTrack` to add new audio track.
#### Arguments
1. `callback` *(Function)*: event handler

#### Example
```js
player.load("PROXY_ID", function (err) {
    if (!err) {
        player.audioAddHandler(function (e) {
            /*any additional code*/
            player.loadAudioTrack("URL", "TRACK_NAME", callback);
        });
    }
});
```

---

### <a id="Player_setAudioTrackUrl"></a>`Player.prototype.setAudioTrackUrl(trackId, url)`
Set audio stream url in audio track stub. Used with audio track stubs previously created with `player.addAudioTrack`.
#### Arguments
1. `trackId` *(String)*: track id
2. `url` *(String)*: audio stream url

#### Example
```js
player.load("PROXY_ID", function (err) {
    if (!err) {
        /* create stub on UI indicating that track is being loaded */
        var trackId = player.addAudioTrack("mytrack", ["Left", "Right"]);
        /* wait for adapter to transcode the audio and give us trackUrl */
        player.setAudioTrackUrl(trackId, trackUrl)
    }
});
```

---

### <a id="Player_conformAudioTrack"></a>`Player.prototype.conformAudioTrack(trackId, offset)`
Offset audio track by `offset` seconds. Audio track duration is set to the video track duration
if the audio track after offsetting is still shorter than the video track.

Limitations:
- `offset` must be >= 0
- track must not be current track
- track must be successfully loaded

#### Arguments
1. `trackId` *(String)*: track id
2. `offset` *(Number)*: offset in seconds

#### Example
```js
var url = "http://some.host.com/sometrack.mpd";
player.loadAudioTrack(url, "TRACK_NAME", function(error) {
    if (!error) {
        player.conformAudioTrack(url, 12.3);
        player.setCurrentAudioTrack(url);
    }
});
```

---

### <a id="Player_getAudioTrack"></a>`Player.prototype.getAudioTrack(trackId)`
Get audio track.
#### Arguments
1. `trackId` *(String)*: track id

#### Returns
*(PlayerAudioTrack)*: audio track. See [`PlayerAudioTrack`](PlayerAudioTrack.md)

#### Example
```js
var track = player.getAudioTrack("my_track_id_123");
```

---

### <a id="Player_addCaptions"></a>`Player.prototype.addCaptions(captions)`
Add captions/subtitles track.
#### Arguments
1. `captions` *([`Subtitles`](Captions.md#Subtitles))*: parsed captions

#### Example
```js
player.addCaptions(mySubtitles);
```

---

### <a id="Player_addCaptionsHandler"></a>`Player.prototype.addCaptionsHandler(callback)`
Show "add captions track" button in the player UI. `callback` function is called on click.
Use in `player.load` callback with `player.addCaptions`.
#### Arguments
1. `callback` *(Function)*: event handler

#### Example
```js
player.load("PROXY_ID", function (err) {
    if (!err) {
        player.addCaptionsHandler(function (e) {
            /*load and parse some captions here*/
            player.addCaptions(myParsedCaptions);
        });
    }
});
```

---

### <a id="Player_disableHotKeys"></a>`Player.prototype.disableHotKeys()`
Disable hot keys handling.

---

### <a id="Player_enableHotKeys"></a>`Player.prototype.enableHotKeys()`
Enable hot keys handling.

---

### <a id="Player_setStartTapeTimecode"></a>`Player.prototype.setStartTapeTimecode(timecode)`
Set start tape timecode. I.e. timecode of frame #0. New timecode overrides start timecode obtained from video stream.
Use in `player.load` callback.
#### Arguments
1. `timecode` *(String)*: start tape timecode

#### Example
```js
player.load("PROXY_ID", function (err) {
    if (!err) {
        player.setStartTapeTimecode("01:00:00:00");
    }
});
```

---

### <a id="Player_setStartUTCTimestamp"></a>`Player.prototype.setStartUTCTimestamp(timestamp)`
Set start UTC timestamp. I.e. timestamp of frame #0. New timestamp overrides start timestamp obtained from media.
Use in `player.load` callback.
#### Arguments
1. `timestamp` *(String)*: start UTC timestamp as ISO 8601 string

#### Example
```js
player.load("some url", function (err) {
    if (!err) {
        player.setStartUTCTimestamp("2017-03-01T13:01:02.003Z");
    }
});
```

---

### <a id="Player_addEventListener"></a>`Player.prototype.addEventListener(type, handler)`
Add event listener.
Use in `player.load` callback.
Supported event types:
- `fullscreen` player enters/exits full screen mode. Boolean status is passed to the handler.
- `timeupdate` playback position changes. `TimeSample` object is passed to the handler.
- `load` player is ready, media is loaded. Can be added right after Player instance creation.
- `play` playback state. Boolean value is passed to the handler: `true` when playback has been started, `false` when paused.
- `timeline` timeline updates. [`Timeline`](Timeline.md) instance is passed to the handler. Fired on duration change.
- `error` player errors. Exception instance is passed to the handler.
- `progress` player loads more of the media file. Array of [`TimeRange`](#Player_getBuffered_TimeRange) objects is passed to the handler.

#### Arguments
1. `type` *(String)*: event type
2. `handler` *(Function)*: event handler function

#### Example
```js
function onTimeUpdate(ts) {
    console.log(ts.frame, ts.sec);
}
player.load("PROXY_ID", function (err) {
    player.addEventListener("timeupdate", onTimeUpdate);
});
```

---

### <a id="Player_removeEventListener"></a>`Player.prototype.removeEventListener(type, handler)`
Remove event listener.
Use in `player.load` callback.

#### Arguments
1. `type` *(String)*: event type
2. `handler` *(Function)*: event handler function

#### Example
```js
function onTimeUpdate(ts) {
    // some code
}
player.load("PROXY_ID", function (err) {
    player.addEventListener("timeupdate", onTimeUpdate);
    // some code
    player.removeEventListener("timeupdate", onTimeUpdate);
});
```

---

### <a id="Player_getFilmStripDrawer"></a>`Player.prototype.getFilmStripDrawer(callback)`
Get filmstrip drawer. [`FilmStripDrawer`](FilmStripDrawer.md) instance is passed in a callback.
Use in `player.load` callback.

#### Arguments
1. `callback` *(Function)*: callback

#### Example
```js
player.load("PROXY_ID", function (err) {
    player.getFilmStripDrawer(function(drawer) {
       console.log(drawer.getInfo());
    });
});
```

---

### <a id="Player_getCaptionsList"></a>`Player.prototype.getCaptionsList()`
Get List of Captions and Subtitles currently imported into the Player.

#### Returns
*(List<Subtitles>)*: List of Subtitle objects

---

### <a id="Player_getAudioTracks"></a>`Player.prototype.getAudioTracks()`
Get List of Audio Tracks currently imported into the Player.

#### Returns
*(Array<PlayerAudioTrack>)*: List of [`PlayerAudioTrack`](PlayerAudioTrack.md) objects

---

### <a id="Player_registerPlugin"></a>`Player.prototype.registerPlugin(plugin)`
Register a plugin that uses an extended API for player manipulation and augmentation.

#### Arguments
1. `plugin` *(Object)*: plugin instance capable of accepting an injection of extended API object

---

### <a id="Player_setLogLevel"></a>`Player.prototype.setLogLevel(logLevel)`
Set logging level.

#### Arguments
1. `logLevel` *([`LogLevel`](LogLevel.md))*: logging level. See [`LogLevel`](LogLevel.md)

---

### <a id="Player_play"></a>`Player.prototype.play()`
Start playback. Playback rate is always set to 1x unless `preservePlaybackRate` option is `true`.

---

### <a id="Player_playAtRate"></a>`Player.prototype.playAtRate(rate)`
Fast forward/rewind.
#### Arguments
1. `rate` *(Integer)*: playback rate, possible values: -8, -4, -2, -1, 1, 2, 3, 4, 8.

#### Example
```js
player.playAtRate(2); //play forward at 2x speed
player.playAtRate(-2); //play backwards at 2x speed

```

---

### <a id="Player_playFaster"></a>`Player.prototype.playFaster()`
Double the playback rate. If current rate is 0 or negative then play forward at 1x speed.

#### Example

```js
player.play(); // play at 1x
player.playFaster(); //play forward at 2x speed
player.playFaster(); //play forward at 4x speed

```

---

### <a id="Player_playFasterBackwards"></a>`Player.prototype.playFasterBackwards()`
Double the backwards playback rate. If current rate is 0 or positive then play backwards at 1x speed.

#### Example

```js
player.playAtRate(-1); // play backwards at 1x
player.playFasterBackwards(); //play backwards at 2x speed
player.playFasterBackwards(); //play backwards at 4x speed

```

---

### <a id="Player_pause"></a>`Player.prototype.pause()`
Pause the player.

---

### <a id="Player_togglePlay"></a>`Player.prototype.togglePlay()`
Either start or pause playback depending on the current play state. Playback rate is always set to 1x unless `preservePlaybackRate` option is `true`.

---

### <a id="Player_setVolume"></a>`Player.prototype.setVolume(val)`
Set the volume of the player.

#### Arguments
1. `val` *(Number)*: Number in range from 0 to 1 - new player volume.

---

### <a id="Player_getVolume"></a>`Player.prototype.getVolume()`
Get current player volume.

#### Returns
*(Number)*: Number in range from 0 to 1 - current volume.

---

### <a id="Player_seek"></a>`Player.prototype.seek(time)`
Jump to a specific frame or time.
Time can be tape or standard timecode or frame number.

#### Arguments
1. `time` *(tape / standard timecode / frame number)*:

#### Example

```js
player.seek("00:59:42;12"); //tape timecode
player.seek("00:59:42.321"); //standard timecode
player.seek(123456); //frame number
```

---

### <a id="Player_seekFrame"></a>`Player.prototype.seekFrame(frameNumber)`
Jump to a specific frame.

#### Arguments
1. `frameNumber` *(Integer)*: frame number

#### Example
```js
player.seekFrame(123456);
```

---

### <a id="Player_seekSec"></a>`Player.prototype.seekSec(time)`
Jump to a specific time.

#### Arguments
1. `time` *(Number)*: time in seconds

#### Example
```js
player.seekSec(300.043);
```

---

### <a id="Player_seekUTCTimestamp"></a>`Player.prototype.seekUTCTimestamp(timestamp)`
Jump to a specific UTC timestamp expressed as ISO 8601 string.

#### Arguments
1. `timestamp` *(String)*: ISO 8601 string timestamp

#### Example
```js
player.seekUTCTimestamp("2017-03-01T13:01:02.003Z");
```

---

### <a id="Player_nextFrame"></a>`Player.prototype.nextFrame(numberOfFrames)`
Pause the player and jump forward by `numberOfFrames` frames.
#### Arguments
1. `numberOfFrames` *(Integer)*: number of frames

#### Example

```js
player.nextFrame(10);
```

---

### <a id="Player_previousFrame"></a>`Player.prototype.previousFrame(numberOfFrames)`
Pause the player and jump backwards by `numberOfFrames` frames.
#### Arguments
1. `numberOfFrames` *(Integer)*: number of frames

#### Example

```js
player.previousFrame(10);
```

---

### <a id="Player_nextSec"></a>`Player.prototype.nextSec(seconds)`
Pause the player and jump forward by `seconds` seconds.
#### Arguments
1. `seconds` *(Number)*: time step in seconds

#### Example

```js
player.nextSec(12.45);
```

---

### <a id="Player_previousSec"></a>`Player.prototype.previousSec(seconds)`
Pause the player and jump backwards by `seconds` seconds.
#### Arguments
1. `seconds` *(Number)*: time step in seconds

#### Example

```js
player.previousSec(4.5);
```

---

### <a id="Player_getCurrentAudioTrack"></a>`Player.prototype.getCurrentAudioTrack()`
Get current audio track.

#### Returns
*(PlayerAudioTrack)*: current audio track. See [`PlayerAudioTrack`](PlayerAudioTrack.md)

#### Example
```js
var track = player.getCurrentAudioTrack();
```

---

### <a id="Player_setCurrentAudioTrack"></a>`Player.prototype.setCurrentAudioTrack(trackId)`
Set current audio track.

#### Arguments
1. `trackId` *(String)*: track id
2. `url` *(String)*: audio stream url

#### Example
```js
player.setCurrentAudioTrack("eng_5.1");
```

---

### <a id="Player_setRange"></a>`Player.prototype.setRange(fromTime, toTime)`
Set playback range. Times can be in any format: tape timecode, standard timecode, frame number.

#### Arguments
1. `fromTime` *(tape timecode / standard timecode / frame number)*: start of the range
2. `toTime` *(tape timecode / standard timecode / frame number)*: end of the range

#### Example

```js
player.setRange("01:00:00:00", "01:13:37:23");
player.setRange(10000, 10256);
```

---

### <a id="Player_cancelRange"></a>`Player.prototype.cancelRange()`
Cancel range. Resets range start/end to the beginning and end of entire video respectively.

---

### <a id="Player_hasRange"></a>`Player.prototype.hasRange()`
Tell if player is in range mode.

### Returns
*(Boolean)* : `true` - player is in range mode, `false` player plays the whole stream;

---

### <a id="Player_setLoop"></a>`Player.prototype.setLoop(loop)`
Turn loop mode on/off. In loop mode playback loops within the range previously set by `setRange` method.

#### Arguments
1. `loop` *(Boolean)*: `true` for loop, `false` for pause

---

### <a id="Player_setPauseOnLoop"></a>`Player.prototype.setPauseOnLoop(pauseOnLoop)`
Pause the player after auto-rewind in loop mode. Does nothing if not in loop mode.

#### Arguments
1. `pauseOnLoop` *(Boolean)*: `true` for auto-pause, `false` for continuous playback

---

### <a id="Player_enterFullscreen"></a>`Player.prototype.enterFullscreen()`
Enter fullscreen mode.

---

### <a id="Player_exitFullscreen"></a>`Player.prototype.exitFullscreen()`
Exit fullscreen mode.

---

### <a id="Player_muteAudioTrack"></a>`Player.prototype.muteAudioTrack(trackId)`
Mute all channels in the audio track.
#### Arguments
1. `trackId` *(String)*: track id

---

### <a id="Player_setVideoQuality"></a>`Player.prototype.setVideoQuality(quality)`
Switch between hi and low resolution video streams. Use strings `"fullres"` and `"lowres"`.
#### Arguments
1. `quality` *(String)*: quality type

#### Example
```js
player.setVideoQuality("lowres");
```

---

### <a id="Player_isPlaying"></a>`Player.prototype.isPlaying()`
Is player playing or paused (true/false).

#### Returns
*(Boolean)* : `true` - for playing, `false` otherwise

---

### <a id="Player_getPlaybackRate"></a>`Player.prototype.getPlaybackRate()`
Get current playback rate. Returns 0 if paused.

#### Returns
*(Number)* : current playback rate

---

### <a id="Player_getCurrentTime"></a>`Player.prototype.getCurrentTime()`
Get current player position as time in seconds.

#### Returns
*(Number)*: time in seconds

#### Example

```js
player.getCurrentTime()
// => 230.0234
```

---

### <a id="Player_getCurrentTimeValue"></a>`Player.prototype.getCurrentTimeValue()`
Get current player position as time value in video stream's time units.

#### Returns
*(Integer)*: time value

#### Example

```js
player.getCurrentTimeValue()
// => 42042
```

---

### <a id="Player_getCurrentTapeTimecode"></a>`Player.prototype.getCurrentTapeTimecode()`
Get current player position as tape timecode.

#### Returns
*(String)*: string representation of the current position tape timecode.

#### Example

```js
player.getCurrentTapeTimecode();
// => "00:00:26:06"
```

---

### <a id="Player_getCurrentStandardTimecode"></a>`Player.prototype.getCurrentStandardTimecode()`
Get current player position as standard timecode.

#### Returns
*(String)*: string representation of the current position standard timecode.

#### Example

```js

player.getCurrentStandardTimecode();
// => "00:00:26.280"

```

---

### <a id="Player_getCurrentFrame"></a>`Player.prototype.getCurrentFrame()`
Get current player position as zero based frame number.

#### Returns
*(Integer)*: current frame number

#### Example

```js
player.getCurrentFrame()
// => 630
```

---

### <a id="Player_getCurrentUTCTimestamp"></a>`Player.prototype.getCurrentUTCTimestamp()`
Get current player position as UTC timestamp in ISO 8601 format.

#### Returns
*(String)*: current position as UTC timestamp

#### Example

```js
player.getCurrentUTCTimestamp()
// => "2017-03-01T13:01:02.003Z"
```

---


### <a id="Player_getTimeSample"></a>`Player.prototype.getTimeSample()`
Get current player position as `TimeSample` object containing time value, seconds and frame number.

#### Returns
*(TimeSample)*: TimeSample instance representing current position

#### Example

```js
player.getTimeSample()
// => {tv: 7168, frame: 14, sec: 0.56442}
```

---

### <a id="Player_getDurationSec"></a>`Player.prototype.getDurationSec()`
Get timeline duration in seconds. It is equal to video stream duration.

#### Returns
*(Number)*: duration in seconds

#### Example

```js
player.getDurationSec()
// => 230.0234
```

---

### <a id="Player_getSeekableDurationSec"></a>`Player.prototype.getSeekableDurationSec()`
Get timeline seekable duration in seconds.
It is equal to the lesser of video stream duration and current audio track duration.
Player can seek and play media from the beginning of the stream up to this duration.

#### Returns
*(Number)*: seekable duration in seconds

#### Example

```js
player.getDurationSec()
// => 230.0234
player.getSeekableDurationSec()
// => 30
```

---

### <a id="Player_getStartTapeTimecode"></a>`Player.prototype.getStartTapeTimecode()`
Get start tape timecode. I.e. tape timecode of frame #0.

#### Returns
*(String)*: start tape timecode

#### Example

```js
player.getStartTapeTimecode()
// => "00:57:30:00"
```

---

### <a id="Player_getStartUTCTimestamp"></a>`Player.prototype.getStartUTCTimestamp()`
Get start UTC timestamp. I.e. timestamp of frame #0.

#### Returns
*(String)*: start timestamp as ISO 8601 string

#### Example

```js
player.getStartUTCTimestamp()
// => "2017-03-01T13:01:02.003Z"
```

---

### <a id="Player_getTimeline"></a>`Player.prototype.getTimeline()`
Get [`Timeline`](Timeline.md) instance.

#### Returns
*(Timeline)*: `Timeline` instance

---

### <a id="Player_isAudioMutable"></a>`Player.prototype.isAudioMutable()`
Returns true if individual audio channels can be muted.

#### Returns
*(Boolean)* : `true` - individual audio channels can be muted, `false` otherwise;

---

### <a id="Player_getBuffered"></a>`Player.prototype.getBuffered()`
Returns array of `TimeRange` objects that contains info about which portions of media have been buffered.

<a id="Player_getBuffered_TimeRange"></a>`TimeRange` object consists of:
- `start` *(Number)* - time in seconds for the start of the range
- `end` *(Number)* - time in seconds for the end of the range

#### Returns
*(Array\<TimeRange>)* : array of `TimeRange` objects

---

### <a id="Player_isLive"></a>`Player.prototype.isLive()`
Returns `true` if video track is live OR currently selected audio track is live.
Note: only HLS or MPEG-DASH can be live.

#### Returns
*(Boolean)* : `true` - live stream is open
