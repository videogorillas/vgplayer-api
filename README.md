# Sample Page

```html
<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title>VG Player</title>
    <link rel="stylesheet" href="vgplayer.min.css"/>
</head>
<body>
<div id="playerContainer" style="width: 80%;"></div>
<script src="vgplayer.js"></script>
<script>
    var player;

    window.onload = function() {
      var playerContainer = document.getElementById("playerContainer");
      var proxyId = "merm2";
      var options = {
          serverUrl: window.location.origin,
          hotkeys: true
      };
      var player = new VG.Player(playerContainer, options);
      VG.VGThemeInit.init();
      player.load(proxyId, function() {
          console.log("player Loaded");
      });
    };
</script>
</body>
</html>

```

# <a id="Player"></a>`Player` class #

## `Player Constructor` ##
- [`constructor`](#Player_constructor)

## `Player Instance Methods` ##

### Initialization Methods

- [`load`](#Player_load)
- [`loadUrl`](#Player_loadUrl)
- [`loadAudioProxy`](#Player_loadAudioProxy)
- [`loadAudioTrack`](#Player_loadAudioTrack)
- [`close`](#Player_close)
- [`addAudioTrack`](#Player_addAudioTrack)
- [`addAudioTrackWithId`](#Player_addAudioTrackWithId)
- [`audioAddHandler`](#Player_audioAddHandler)
- [`setAudioTrackUrl`](#Player_setAudioTrackUrl)
- [`getAudioTrack`](#Player_getAudioTrack)
- [`addCaptions`](#Player_addCaptions)
- [`addCaptionsHandler`](#Player_addCaptionsHandler)
- [`captionsError`](#Player_captionsError)
- [`disableHotKeys`](#Player_disableHotKeys)
- [`enableHotKeys`](#Player_enableHotKeys)
- [`setStartTapeTimecode`](#Player_setStartTapeTimecode)

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
- [`seekToFrame`](#Player_seekToFrame)
- [`seekToSec`](#Player_seekToSec)
- [`nextFrame`](#Player_nextFrame)
- [`previousFrame`](#Player_previousFrame)
- [`nextSec`](#Player_nextSec)
- [`previousSec`](#Player_previousSec)
- [`setCurrentAudioTrack`](#Player_setCurrentAudioTrack)
- [`setRange`](#Player_setRange)
- [`cancelRange`](#Player_cancelRange)
- [`hasRange`](#Player_hasRange)
- [`setLoop`](#Player_setLoop)
- [`enterFullscreen`](#Player_enterFullscreen)
- [`exitFullscreen`](#Player_exitFullscreen)
- [`muteAudioTrack`](#Player_muteAudioTrack)
- [`setVideoQuality`](#Player_setVideoQuality)

### Player Status Methods

- [`isPlaying`](#Player_isPlaying)
- [`getCurrentTime`](#Player_getCurrentTime)
- [`getCurrentTimeValue`](#Player_getCurrentTimeValue)
- [`getCurrentTapeTimecode`](#Player_getCurrentTapeTimecode)
- [`getCurrentFrame`](#Player_getCurrentFrame)
- [`getCurrentStandardTimecode`](#Player_getCurrentStandardTimecode)
- [`getTimeSample`](#Player_getTimeSample)
- [`getDurationSec`](#Player_getDurationSec)
- [`getSeekableDurationSec`](#Player_getSeekableDurationSec)
- [`getTimeline`](#Player_getTimeline)
- [`isAudioMutable`](#Player_isAudioMutable)


## _Player Constructor_ ##
### <a id="Player_constructor"></a>`Player()`
Constructs new Player object.


#### Arguments
1. `container` *(HTML Element)*: The container element where the player is to be created.
2. `options` *(Map)*: options map.

Options:
- hotkeys: true/false - enable standard Player hotkeys.
- serverUrl: URL - back-end URL

#### Example

The follow example shows the basic usage of a Player.

```js
    var container = document.getElementById("playerContainer");
    var options = {hotkeys: true,
                   serverUrl: "http://some.server.com:4242/"}
    var player = new Player(container, options);
```

* * *

## _Player Instance Methods_ ##

### <a id="Player_load"></a>`Player.prototype.load(proxyIdOrURL, onDone)`
Load proxy or file or stream into the player.
#### Arguments
1. `proxyIdOrURL` *(String)*: ID of the proxy or URL of the file/stream to open.
2. `onDone` *(Function)*: callback function to execute when the proxy is loaded, takes one argument `error`.

#### Example

```js
player.load("PROXY_ID", function(err) {
    if (!err) {
        console.log("everything loaded just fine");
    } else {
        console.error(err);
    }
});
```

---

### <a id="Player_loadUrl"></a>`Player.prototype.loadUrl(url, onDone)`
Load file or stream into the player.
#### Arguments
1. `url` *(String)*: url of the file/stream to open.
2. `onDone` *(Function)*: callback function to execute when the video is loaded, takes one argument `error`.

#### Example

```js
player.loadUrl("http://some.host.com/path/something.mpd", function(err) {
    if (!err) {
        console.log("everything loaded just fine");
    } else {
        console.error(err);
    }
});
```

---

### <a id="Player_loadAudioProxy"></a>`Player.prototype.loadAudioProxy(serverUrl, proxyId, [fileName])`
Load audio proxy to the current video proxy. Use in `player.load` callback.
#### Arguments
1. `serverUrl` *(String)*: the url of audioproxy server
2. `proxyId` *(String)*: ID of the audioproxy
3. `fileName` *(String)*: optional display name to show

#### Example
```js
player.load("PROXY_ID", function (err) {
    if (!err) {
        player.loadAudioProxy("SERVER_URL", "AUDIOPROXY_ID", 'FILENAME');
    }
});
```

---

### <a id="Player_loadAudioTrack"></a>`Player.prototype.loadAudioTrack(url, [fileName])`
Add audio file as a new audio track. Use in `player.load` callback.
#### Arguments
1. `url` *(String)*: the url of audio file
2. `fileName` *(String)*: optional display name to show

#### Example
```js
player.load("PROXY_ID", function (err) {
    if (!err) {
        player.loadAudioTrack("http://some.host.com/sometrack.m4a", 'FILENAME');
    }
});
```

---

### <a id="Player_close"></a>`Player.prototype.close()`
Close the video and clear player view.

---

### <a id="Player_addAudioTrack"></a>`Player.prototype.addAudioTrack(displayName, channelNames)`
Add audio track stub. Real audio stream can be associated with this stub later using [`setAudioTrackUrl`](#Player_setAudioTrackUrl).
Random id will be generated for this track.
Use in `player.load` callback.
#### Arguments
1. `displayName` *(String)*: display name of the track
2. `channelNames` *(Array)*: display names of audio channels in this track
String displayName, Array<String> channelNames

#### Example
```js
player.load("PROXY_ID", function (err) {
    if (!err) {
        player.loadAudioTrack("FILENAME", ["Left", "Right"]);
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

#### Example
```js
player.load("PROXY_ID", function (err) {
    if (!err) {
        player.loadAudioTrackWithId("0128749164813674", "FILENAME", ["Left", "Right"]);
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

#### Example
```js
player.load("PROXY_ID", function (err) {
    if (!err) {
        player.loadAudioTrackWithId("0128749164813674", "FILENAME", ["Left", "Right"]);
    }
});
```

---

### <a id="Player_play"></a>`Player.prototype.play()`
Start playback at 1x speed.

---

### <a id="Player_pause"></a>`Player.prototype.pause()`
Pause the player.

---

### <a id="Player_togglePlay"></a>`Player.prototype.togglePlay()`
Either start or pause playback depending on the current play state.

---

### <a id="Player_setRange"></a>`Player.prototype.setRange(fromTime, toTime, loop)`
Set playback range and optionally enter loop mode. Times can be in any format: tape timecode, standard timecode, frame number.

#### Arguments
1. `fromTime` *(tape timecode / standard timecode / frame number)*: start of the range
2. `toTime` *(tape timecode / standard timecode / frame number)*: end of the range
3. `loop` *(Boolean)*: optional, defaults to false. If set to true switches to loop mode

#### Example

```js
player.setRange("01:00:00:00", "01:13:37:23", true);
player.setRange(10000, 10256, true);
```

---

### <a id="Player_cancelRange"></a>`Player.prototype.cancelRange()`
Cancel range. Resets range start/end to the beginning and end of entire video respectively.

---

### <a id="Player_setLoop"></a>`Player.prototype.setLoop(loop)`
Switch between loop/continuous playback modes. In loop mode playback loops within the range previously set by setRange() method.

#### Arguments
1. `loop` *(Boolean)*: true for loop, false for continuos playback


---

### <a id="Player_seek"></a>`Player.prototype.seek(time)`
Jump to a specific frame or time.
Time can be tape or standard timecode or frame number
#### Arguments
1. `time` *(tape / standard timecode / frame number)*:

#### Example

```js
player.seek("00:59:42;12"); //tape timecode
player.seek("00:59:42.321"); //standard timecode
player.seek(123456); //frame number
```

---

### <a id="Player_seekToFrame"></a>`Player.prototype.seekToFrame(frameNumber)`
Jump to a specific frame.
#### Arguments
1. `frameNumber` *(Integer)*: frame number

#### Example

```js
player.seek(123456);
```

---

### <a id="Player_seekToSec"></a>`Player.prototype.seekToSec(time)`
Jump to a specific time.
#### Arguments
1. `time` *(Number)*: time in seconds

#### Example

```js
player.seek(300.043);
```

---

### <a id="Player_getCurrentTapeTimecode"></a>`Player.prototype.getCurrentTapeTimecode()`
Get current player position as tape timecode.

#### Returns
*(String)*: string representation of the current tape timecode.

#### Example

```js
player.getCurrentTapeTimecode();
// => "00:00:26:06"
```

---

### <a id="Player_getCurrentFrame"></a>`Player.prototype.getCurrentFrame()`
Get current player position as frame number.

#### Returns
*(Integer)*: number of the current frame.

#### Example

```js
player.getCurrentFrame()
// => 630
```

---

### <a id="Player_getCurrentStandardTimecode"></a>`Player.prototype.getCurrentStandardTimecode()`
Get current player position as standard timecode.

#### Returns
*(String)*: string representation of the current standard timecode.

#### Example

```js

player.getCurrentStandardTimecode();
// => "00:00:26.280"

```

---


### <a id="Player_enterFullscreen"></a>`Player.prototype.enterFullscreen()`
Enter fullscreen mode.

---

### <a id="Player_exitFullscreen"></a>`Player.prototype.exitFullscreen()`
Exit fullscreen mode.

---

### <a id="Player_playAtRate"></a>`Player.prototype.playAtRate(rate)`
Fast forward/rewind.
#### Arguments
1. `rate` *(Integer)*: playback rate, possible values: -8, -4, -2, -1, 1, 2, 3, 4, 8. The default playback speed is 1.

#### Example

```js
player.playAtRate(2); //play forward at 2x speed
player.playAtRate(-2); //play backwards at 2x speed

```

---

### <a id="Player_isPlaying"></a>`Player.prototype.isPlaying()`
Is player playing or paused (true/false).

#### Returns
*(Boolean)* : `true` - for playing, `false` otherwise;

---

### <a id="Player_setVolume"></a>`Player.prototype.setVolume(val)`
Set the volume of the player
#### Arguments
1. `val` *(Number)*: Number in range from 0 to 1 - new player volume.

---

### <a id="Player_getVolume"></a>`Player.prototype.getVolume()`
Get current player volume
#### Returns
*(Number)*: Number in range from 0 to 1 - current volume.

* * *

# `PlayerAudioTrack` class #

## `PlayerAudioTrack Instance Methods` ##

- [`getChannels`](#PlayerAudioTrack_getChannels)
- [`id`](#PlayerAudioTrack_id)
- [`isMuted`](#PlayerAudioTrack_isMuted)

## _PlayerAudioTrack Instance Methods_ ##

* * *

# `TapeTimecode` class #

## `TapeTimecode Class Methods` ##

- [`isTimecode`](#TapeTimecode_isTimecode)
- [`parseTimecode`](#TapeTimecode_parseTimecode)

## `TapeTimecode Instance Methods` ##

- [`getFrameByTimecode`](#TapeTimecode_getFrameByTimecode)
- [`getTapeFps`](#TapeTimecode_getTapeFps)
- [`getTimecodedDuration`](#TapeTimecode_getTimecodedDuration)
- [`isDropFrame`](#TapeTimecode_isDropFrame)

## _TapeTimecode Class Methods_ ##

## _TapeTimecode Instance Methods_ ##

* * *

# `Timeline` class #

## `Timeline Instance Methods` ##

- [`getFrameByTimecode`](Timeline_getFrameByTimecode)

## _Timeline Instance Methods_ ##
