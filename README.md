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

# `Player` class #

## `Player Constructor` ##
- [`constructor`](#player)

## `Player Instance Methods` ##

### Playback Commands
- [`play`](#playerPlay)
- [`pause`](#playerPause)
- [`togglePlay`](#playerTogglePlay)
- [`setVolume`](#playerSetVolume)
- [`getVolume`](#playerGetVolume)
- [`seek`](#playerSeek)
- [`seekToFrame`](#playerSeekToFrame)
- [`seekToSec`](#playerSeekToSec)
- [`enterFullscreen`](#playerEnterFullscreen)
- [`exitFullscreen`](#playerExitFullscreen)
- [`loadAudioProxy`](#playerLoadAudioProxy)
- [`load`](#playerLoad)
- [`close`](#playerClose)
- [`playAtRate`](#playerPlayAtRate)
- [`setRange`](#playerSetRange)
- [`cancelRange`](#playerCancelRange)
- [`setLoop`](#playerSetLoop)

### Player Status
- [`isPlaying`](#playerIsPlaying)
- [`getCurrentTapeTimecode`](#playerGetCurrentTapeTimecode)
- [`getCurrentFrame`](#playerGetCurrentFrame)
- [`getCurrentStandardTimecode`](#playerGetCurrentStandardTimecode)


## _Player Constructor_ ##
### <a id="player"></a>`Player()`
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

### <a id="playerLoad"></a>`Player.prototype.load(proxyIdOrURL, onDone)`
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

### <a id="playerPlay"></a>`Player.prototype.play()`
Start playback at 1x speed.

---

### <a id="playerPause"></a>`Player.prototype.pause()`
Pause the player.

---

### <a id="playerTogglePlay"></a>`Player.prototype.togglePlay()`
Either start or pause playback depending on the current play state.

---

### <a id="playerSetRange"></a>`Player.prototype.setRange(fromTime, toTime, loop)`
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

### <a id="playerCancelRange"></a>`Player.prototype.cancelRange()`
Cancel range. Resets range start/end to the beginning and end of entire video respectively.

---

### <a id="playerSetLoop"></a>`Player.prototype.setLoop(loop)`
Switch between loop/continuous playback modes. In loop mode playback loops within the range previously set by setRange() method.

#### Arguments
1. `loop` *(Boolean)*: true for loop, false for continuos playback


---

### <a id="playerSeek"></a>`Player.prototype.seek(time)`
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

### <a id="playerSeekToFrame"></a>`Player.prototype.seekToFrame(frameNumber)`
Jump to a specific frame.
#### Arguments
1. `frameNumber` *(Integer)*: frame number

#### Example

```js
player.seek(123456);
```

---

### <a id="playerSeekToSec"></a>`Player.prototype.seekToSec(time)`
Jump to a specific time.
#### Arguments
1. `time` *(Number)*: time in seconds

#### Example

```js
player.seek(300.043);
```

---

### <a id="playerGetCurrentTapeTimecode"></a>`Player.prototype.getCurrentTapeTimecode()`
Get current player position as tape timecode.

#### Returns
*(String)*: string representation of the current tape timecode.

#### Example

```js
player.getCurrentTapeTimecode();
// => "00:00:26:06"
```

---

### <a id="playerGetCurrentFrame"></a>`Player.prototype.getCurrentFrame()`
Get current player position as frame number.

#### Returns
*(Integer)*: number of the current frame.

#### Example

```js
player.getCurrentFrame()
// => 630
```

---

### <a id="playerGetCurrentStandardTimecode"></a>`Player.prototype.getCurrentStandardTimecode()`
Get current player position as standard timecode.

#### Returns
*(String)*: string representation of the current standard timecode.

#### Example

```js

player.getCurrentStandardTimecode();
// => "00:00:26.280"

```

---


### <a id="playerEnterFullscreen"></a>`Player.prototype.enterFullscreen()`
Enter fullscreen mode.

---

### <a id="playerExitFullscreen"></a>`Player.prototype.exitFullscreen()`
Exit fullscreen mode.

---

### <a id="playerPlayAtRate"></a>`Player.prototype.playAtRate(rate)`
Fast forward/rewind.
#### Arguments
1. `rate` *(Integer)*: playback rate, possible values: -8, -4, -2, -1, 1, 2, 3, 4, 8. The default playback speed is 1.

#### Example

```js
player.playAtRate(2); //play forward at 2x speed
player.playAtRate(-2); //play backwards at 2x speed

```

---

### <a id="playerIsPlaying"></a>`Player.prototype.isPlaying()`
Is player playing or paused (true/false).

#### Returns
*(Boolean)* : `true` - for playing, `false` otherwise;

---

### <a id="playerClose"></a>`Player.prototype.close()`
Close the video and clear player view.

---

### <a id="playerLoadAudioProxy"></a>`Player.prototype.loadAudioProxy(serverUrl, proxyId, [fileName])`
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

### <a id="playerSetVolume"></a>`Player.prototype.setVolume(val)`
Set the volume of the player
#### Arguments
1. `val` *(Number)*: Number in range from 0 to 1 - new player volume.

---

### <a id="playerGetVolume"></a>`Player.prototype.getVolume()`
Get current player volume
#### Returns
*(Number)*: Number in range from 0 to 1 - current volume.
