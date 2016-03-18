# <a id="PlayerAudioTrack"></a>`PlayerAudioTrack` class #

## `PlayerAudioTrack Instance Methods` ##

- [`id`](#PlayerAudioTrack_id)
- [`getChannels`](#PlayerAudioTrack_getChannels)
- [`isMuted`](#PlayerAudioTrack_isMuted)

## _PlayerAudioTrack Instance Methods_ ##

### <a id="PlayerAudioTrack_id"></a>`PlayerAudioTrack.prototype.id()`
Get track id.

#### Returns
*(String)*: track id

---

### <a id="PlayerAudioTrack_getChannels"></a>`PlayerAudioTrack.prototype.getChannels()`
Get audio track channels.

#### Returns
*(Array)*: array of channel info objects

#### Example

```js
player.getCurrentAudioTrack().getChannels();
// => [{label: "FrontLeft", muted: false}, {label: "FrontRight", muted: false}]
```

---

### <a id="PlayerAudioTrack_isMuted"></a>`PlayerAudioTrack.prototype.isMuted()`
Returns true if every channel in the track is muted.

#### Returns
*(Boolean)*: `true` - every channel is muted, `false` - otherwise
