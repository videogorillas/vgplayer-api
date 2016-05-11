# `Captions` #

Captions class provides API for parsing and manipulating subtitle and captions objects.

## `Usage` ##

```java
String codec = Captions.guessSubtitleCodec("http://server/url/to/subs.srt");

Observable<Subtitles> subsRx = Captions.parseSubs(player.getTimeline(), "http://server/url/to/subs.srt", codec);

subsRx.subscribe(subs -> {
	console.log("subs parsed", subs);
}, err -> {
	console.error("error parsing subs", err);
});
```

### Methods

- [`guessSubtitleCodec()`](#guessSubtitleCodec)

- [`parseSubs()`](#parseSubs)

### <a id="guessSubtitleCodec"></a>`String guessSubtitleCodec()`

Returns String with subtitle codec/format based on url
```java
String codec = Captions.guessSubtitleCodec("http://server/url/to/subs.srt");
```
 
### <a id="parseSubs"></a>`Observable<Subtitles> parseSubs(Timeline timeline, String url, String codec)`

Downloads and parses subtitles given a url

- `timeline` Player Timeline object to align subtitles to

- `url` url to subtitles

- `codec` subtitle type. Available codecs: `srt`, `webvtt`, `stl`, `c890`, `dcsubs`

