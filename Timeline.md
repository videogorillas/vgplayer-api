# <a id="Timeline"></a>`Timeline` class #

## `Timeline Instance Methods` ##

- [`aaa`](Adapter.md)
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
- [`setSeekableDurationSec`](#Timeline_setSeekableDurationSec)

## _Timeline Instance Methods_ ##

### <a id="Timeline_getTimeScale"></a>`Timeline.prototype.getTimeScale()`

#### Returns
*(Boolean)*: `true` - every channel is muted, `false` - otherwise
