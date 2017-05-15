# <a id="Captions"></a>`Captions` class #

Captions class provides API for parsing and manipulating subtitle and captions objects.

## `Captions Class Methods` ##

- [`guessSubtitleCodec()`](#guessSubtitleCodec)
- [`parseSubs()`](#parseSubs)
- [`offsetCaptions()`](#offsetCaptions)

## _Captions Class Methods_ ##

### <a id="guessSubtitleCodec"></a>`Captions.guessSubtitleCodec(url)`
Guesses subtitle codec/format based on `url`
#### Arguments
1. `url` *(String)*: url to subtitles

#### Returns
*(String)*: subtitle codec/format ("srt", "webvtt", etc.)

#### Example
```js
Captions.guessSubtitleCodec("http://server/url/to/subs.srt");
// => "srt"
```
 
### <a id="parseSubs"></a>`Captions.parseSubs(timeline, url, codec, callback, [logLevel])`
Downloads and parses subtitles given a url.

List of subtitle and closed caption formats currently supported by the player:
* DLP Cinema (Cinecanvas 1.1 XML, UTF-8/16)
* EBU (STL)
* Cavena 890
* Web VTT

#### Arguments
1. `timeline` *([`Timeline`](Timeline.md))*: [`Player Timeline`](Player.md#Player_getTimeline) object to align subtitles to
2. `url` *(String)*: url to subtitles
3. `codec` *(String)*: subtitle type. Available codecs: `srt`, `webvtt`, `stl`, `c890`, `dcsubs`
4. `callback` *(Function)*: callback function to execute when the subtitles are parsed
5. `logLevel` *([`LogLevel`](LogLevel.md))*: *optional* logging level, see [`LogLevel`](LogLevel.md)

#### Example
```js
var codec = Captions.guessSubtitleCodec("http://server/url/to/subs.srt");
Captions.parseSubs(player.getTimeline(), "http://server/url/to/subs.srt", codec, function(err, subs) {
    if (err) {
        console.error("error parsing subs", err);
        return;
    }

    console.log("subs parsed", subs);
});
```

### <a id="offsetCaptions"></a>`Captions.offsetCaptions(captions, offsetTv, timeline)`
Offsets subtitles by specified time value
#### Arguments
1. `captions` *([`Subtitles`](#Subtitles))*: source subtitle object to offset
2. `offsetTv` *(Integer)*: timevalue to offset by
3. `timeline` *([`Timeline`](Timeline.md))*: [`Player Timeline`](Player.md#Player_getTimeline) object to align subtitles to

#### Example
```js
var codec = Captions.guessSubtitleCodec("http://server/url/to/subs.srt");

Captions.parseSubs(player.getTimeline(), "http://server/url/to/subs.srt", codec, function(err, subs) {
    if (err) return console.error("error parsing subs", err);

    Captions.offsetCaptions(subs, 42042, player.getTimeline());
    console.log("subs are offset by 42042", subs);
});
```

--


## <a id="Subtitles"></a>`Subtitles` object #

`Subtitles` object represents one imported subtitle or captions file into the player

| Property | Description                                                            | Type                                                 |
| -------- | ---------------------------------------------------------------------- | ---------------------------------------------------- |
| `id`     | Id of the subtitle object                                              | `String`                                             |
| `rows`   | Array of subtitle entries representing timed text                      | `Array` of [`SubtitleEntry`](#SubtitleEntry) objects |
| `title`  | Human readable name of the represented subtitles (e.g. `filename.srt`) | `String`                                             |


## <a id="SubtitleEntry"></a>`SubtitleEntry` object #

`SubtitleEntry` object represents a single text entry on player timeline

| Property      | Description                                                                                  | Type      |
| ------------- | -------------------------------------------------------------------------------------------- | --------- |
| `startMsec`   | Millisecond relative to current video at which subtitle text should appear                   | `Integer` |
| `endMsec`     | Millisecond at which text should disappear                                                   | `Integer` |
| `startTv`     | Timevalue relative to current video at which subtitle text should appear                     | `Integer` |
| `endTv`       | Timevalue relative to current video at which subtitle text should disappear                  | `Integer` |
| `timeCodeIn`  | Tape timecode string relative to start tape timecode at which subtitle text should appear    | `String`  |
| `timeCodeOut` | Tape timecode string relative to start tape timecode at which subtitle text should disappear | `String`  |
| `notes`       | Text of the subtitle                                                                         | `String`  |
| `red`         | Attention of user should be drawn to current subtitle entry                                  | `Boolean` |

#### Example SubtitleEntry JSON
```json
{
    "startMsec": 660,
    "endMsec": 1650,
    "startTv": 60060,
    "endTv": 150150,
    "timeCodeIn": "00:58:02:00",
    "timeCodeOut": "00:58:05:00",
    "notes": "hello world",
    "red": true
}
```
