# <a id="FilmStripDrawer"></a>`FilmStripDrawer` class #

## `FilmStripDrawer Instance Methods` ##

- [`getInfo`](#FilmStripDrawer_getInfo)
- [`drawFilmstrip`](#FilmStripDrawer_drawFilmstrip)

## _FilmStripDrawer Instance Methods_ ##

### <a id="#FilmStripDrawer_getInfo"></a>`FilmStripDrawer.prototype.getInfo()`
Get thumbnail stream info: frame width, height, number of frames.

#### Returns
*(Object)*: object containing frame width, height, number of frames

#### Example

```js
drawer.getInfo();
// => {width: 144, height: 80, framesTotal: 139840}
```

---

### <a id="#FilmStripDrawer_drawFilmstrip"></a>`FilmStripDrawer.prototype.drawFilmstrip(canvasElement, startFrame, endFrame, numberOfFrames, framePrecise, onDone, onError)`
Draw the filmstrip on the canvas element.

Frame precise mode explanation:

Assume each chunk is 125 frames (5 seconds long, 25 frames/sec). Calculated frame numbers would be:

*framePrecise=true*:
`drawFilmstrip(canvas, 100, 270, 5, true)`

| #100 | #134 | #168 | #203 | #270 |
|------|------|------|------|------|

*framePrecise=false*: the first frames of respective video chunks are used. `startFrame` and `endFrame` are exception.
`drawFilmstrip(canvas, 100, 600, 5, true)`

| #100 | #125 | #250 | #375 | #600 |
|------|------|------|------|------|

*framePrecise* flag is ignored if some frames are to be duplicated (frame #125 in the example). The filmstrip will be rendered in frame precise mode.
`drawFilmstrip(canvas, 100, 270, 5, false)`

| #100 | **#125** | **#125** | **#125** | #270 |
|------|----------|----------|----------|------|

#### Arguments
1. `canvasElement` *(HTML Element)*: html canvas element to draw on
2. `startFrame` *(Integer)*: frame number of the leftmost frame on the filmstrip. Always frame precise.
3. `endFrame` *(Integer)*: frame number of rightmost frame on the filmstrip. Always frame precise.
4. `numberOfFrames` *(Integer)*: number of frames to draw
5. `framePrecise` *(Boolean)*: `true` - render exactly the requested frames, `false` - render the first frames of video chunks (faster)
6. `onDone` *(Function)*: success callback
7. `onError` *(Function)*: error callback

#### Returns
*(Function)*: cancellation function. Call it to abort filmstrip drawing.

#### Example

```js
var abortFunc = drawer.drawFilmstrip(canvas, 10000, 27000, 5, true,
                    function() { console.log("done drawing filmstrip"); },
                    function(err) { console.error(err); });
```
