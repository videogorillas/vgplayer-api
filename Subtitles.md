# `Captions` #

Captions class provides API for parsing and manipulating subtitle and captions objects.


## `Usage` ##

```java
String codec = Captions.guessSubtitleCodec("http://server/url/to/subs.srt");

Observable<Subtitles> subsRx = Captions.parseSubs(player.getTimeline(), "http://server/url/to/subs.srt", codec);

subsRx.subscribe(subs -> {
	console.log("subs parsed", subs);
	//if subs need to be offset
	subs = Captions.offsetCaptions(subs, 42042, player.getTimeline());
}, err -> {
	console.error("error parsing subs", err);
});
```

### Methods

- [`guessSubtitleCodec()`](#guessSubtitleCodec)

- [`parseSubs()`](#parseSubs)

- [`offsetCaptions()`](#offsetCaptions)

### <a id="guessSubtitleCodec"></a>`String guessSubtitleCodec()`

Returns String with subtitle codec/format based on url
```java
String codec = Captions.guessSubtitleCodec("http://server/url/to/subs.srt");
```
 
### <a id="parseSubs"></a>`Observable<Subtitles> parseSubs(Timeline timeline, String url, String codec)`

Downloads and parses subtitles given a url

Returns: `Observable<Subtitles>` observable with one item emitted when parsing is done

- `timeline` Player Timeline object to align subtitles to

- `url` url to subtitles

- `codec` subtitle type. Available codecs: `srt`, `webvtt`, `stl`, `c890`, `dcsubs`

### <a id="offsetCaptions"></a>`Subtitles offsetCaptions(Subtitles captions, long offsetTv, Timeline timeline)`

Offsets subtitles by specified time value

Returns: `Subtitles` offset subtitles object

- `captions` source subtitle object to offset

- `offsetTv` timevalue to offset by

- `timeline` Player Timeline object to align subtitles to


# `Subtitles` #

`Subtitles` class represents one imported subtitle or captions file into the player

```java
class Subtitles {
    String id;
    Array<SubtitleEntry> rows;
    String title;
}
```

- `id` id of the subtitle object
- `rows` array of subtitle entries representing timed text 
- `title` human readable name of the represented subtitles (e.g. `filename.srt`) 

# `SubtitleEntry` #

`SubtitleEntry` class represents a single text entry on player timeline

```java
class SubtitleEntry {
    long startMsec;
    long endMsec;
    long startTv;
    long endTv;
    String timeCodeIn;
    String timeCodeOut;
    String notes;
    boolean red;
}
```

- `startMsec` millisecond relative to current video at which subtitle text should appear

- `endMsec`  millisecond at which text should disappear

- `startTv` timevalue relative to current video at which subtitle text should appear

- `endTv` timevalue relative to current video at which subtitle text should disappear

- `timeCodeIn` tape timecode string relative to start tape timecode at which subtitle text should appear

- `timeCodeOut` tape timecode string relative to start tape timecode at which subtitle text should disappear

- `notes` text of the subtitle

- `red` attention of user should be drawn to current subtitle entry 

Example SubtitleEntry JSON
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
