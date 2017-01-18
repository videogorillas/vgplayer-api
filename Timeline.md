# <a id="Timeline"></a>`Timeline` class #

## `Timeline Instance Methods` ##

- [`getTimeScale`](#Timeline_getTimeScale)
- [`getFrameCount`](#Timeline_getFrameCount)
- [`getTvBySec`](#Timeline_getTvBySec)
- [`getLastFrame`](#Timeline_getLastFrame)
- [`getLastTv`](#Timeline_getLastTv)
- [`getTvByTimecode`](#Timeline_getTvByTimecode)
- [`getTvByFrame`](#Timeline_getTvByFrame)
- [`getFrameByTv`](#Timeline_getFrameByTv)
- [`getFrameBySec`](#Timeline_getFrameBySec)
- [`getFrameByTimecode`](#Timeline_getFrameByTimecode)
- [`getFrameByMillis`](#Timeline_getFrameByMillis)
- [`floorTv`](#Timeline_floorTv)
- [`boundsFn`](#Timeline_boundsFn)
- [`getSecByFrame`](#Timeline_getSecByFrame)
- [`getSecByTv`](#Timeline_getSecByTv)
- [`getMillisByTv`](#Timeline_getMillisByTv)
- [`getTapeByTv`](#Timeline_getTapeByTv)
- [`getTapeByFrame`](#Timeline_getTapeByFrame)
- [`getTapeBySec`](#Timeline_getTapeBySec)
- [`getTapeTimecode`](#Timeline_getTapeTimecode)
- [`getDurationSec`](#Timeline_getDurationSec)
- [`getSeekableDurationSec`](#Timeline_getSeekableDurationSec)

## _Timeline Instance Methods_ ##

### <a id="Timeline_getTimeScale"></a>`Timeline.prototype.getTimeScale()`
Get time scale.

#### Returns
*(Integer)*: time scale

---

### <a id="Timeline_getFrameCount"></a>`Timeline.prototype.getFrameCount()`
Get timeline duration expressed in frames.

#### Returns
*(Integer)*: number of frames

---

### <a id="Timeline_getTvBySec"></a>`Timeline.prototype.getTvBySec(seconds)`
Get time value corresponding to time in `seconds`.

#### Arguments
1. `seconds` *(Number)*: time in seconds

#### Returns
*(Integer)*: time value

---

### <a id="Timeline_getLastFrame"></a>`Timeline.prototype.getLastFrame()`
Get the last frame number on the timeline.

#### Returns
*(Integer)*: frame number

---

### <a id="Timeline_getLastTv"></a>`Timeline.prototype.getLastTv()`
Get the last frame time value.

#### Returns
*(Integer)*: time value

---

### <a id="Timeline_getTvByTimecode"></a>`Timeline.prototype.getTvByTimecode(timecode)`
Get time value corresponding to the tape timecode in `timecode`.

#### Arguments
1. `timecode` *(String)*: tape timecode

#### Returns
*(Integer)*: time value

---

### <a id="Timeline_getTvByFrame"></a>`Timeline.prototype.getTvByFrame(frame)`
Get time value corresponding to the frame number in `frame`.

#### Arguments
1. `frame` *(Integer)*: frame number

#### Returns
*(Integer)*: time value

---

### <a id="Timeline_getFrameByTv"></a>`Timeline.prototype.getFrameByTv(tv)`
Get the frame number corresponding to the time value in `tv`.

#### Arguments
1. `tv` *(Integer)*: time value

#### Returns
*(Integer)*: frame number

---

### <a id="Timeline_getFrameBySec"></a>`Timeline.prototype.getFrameBySec(seconds)`
Get the frame number corresponding to the time in `seconds`.

#### Arguments
1. `seconds` *(Number)*: time in seconds

#### Returns
*(Integer)*: frame number

---

### <a id="Timeline_getFrameByTimecode"></a>`Timeline.prototype.getFrameByTimecode(timecode)`
Get the frame number corresponding to the tape timecode in `timecode`.

#### Arguments
1. `timecode` *(String)*: tape timecode

#### Returns
*(Integer)*: frame number

---

### <a id="Timeline_getFrameBySec"></a>`Timeline.prototype.getFrameBySec(millis)`
Get the frame number corresponding to milliseconds in `millis`.

#### Arguments
1. `millis` *(Integer)*: time in milliseconds

#### Returns
*(Integer)*: frame number

---

### <a id="Timeline_floorTv"></a>`Timeline.prototype.floorTv(tv)`
Get time value aligned to the beginning of the frame.

#### Arguments
1. `tv` *(Integer)*: time value

#### Returns
*(Integer)*: time value

---

### <a id="Timeline_boundsFn"></a>`Timeline.prototype.boundsFn(frame)`
Clip frame number. Returns max(0, min(frame, lastFrame)).

#### Arguments
1. `frame` *(Integer)*: frame number

#### Returns
*(Integer)*: frame number that is within \[0, lastFrame\]

---

### <a id="Timeline_getSecByFrame"></a>`Timeline.prototype.getSecByFrame(frame)`
Get time in seconds corresponding to the frame number in `frame`.

#### Arguments
1. `frame` *(Integer)*: frame number

#### Returns
*(Number)*: time in seconds

---

### <a id="Timeline_getSecByTv"></a>`Timeline.prototype.getSecByTv(tv)`
Get time in seconds corresponding to time value in `tv`.

#### Arguments
1. `tv` *(Integer)*: time value

#### Returns
*(Number)*: time in seconds

---

### <a id="Timeline_getMillisByTv"></a>`Timeline.prototype.getMillisByTv(tv)`
Get time in milliseconds corresponding to time value in `tv`.

#### Arguments
1. `tv` *(Integer)*: time value

#### Returns
*(Number)*: time in milliseconds

---

### <a id="Timeline_getDurationSec"></a>`Timeline.prototype.getDurationSec()`
Get total duration of the video.

#### Returns
*(Number)*: time in seconds

---

### <a id="Timeline_getSeekableDurationSec"></a>`Timeline.prototype.getSeekableDurationSec()`
Get duration which is seekable via `player.seekSec` 

#### Returns
*(Number)*: time in seconds

---


