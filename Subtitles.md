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
 
### <a id="parseSubs"></a>`Observable<Subtitles> parseSubs`

Called when Capture Frame Icon clicked. Stops playback. This can be used to open crop UI and do actual cropping.
