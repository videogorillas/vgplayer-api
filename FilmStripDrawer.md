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

*framePrecise=true*: `drawFilmstrip(canvas, 100, 270, 5, true)`

| #100 | #134 | #168 | #203 | #270 |
|------|------|------|------|------|

*framePrecise=false*: `drawFilmstrip(canvas, 100, 600, 5, true)`

The first frames of respective video chunks or nearest I-frames are rendered. `startFrame` and `endFrame` are exception.
This mode is generally faster because fewer frames are to be decoded.

| #100 | #125 | #250 | #375 | #600 |
|------|------|------|------|------|

*framePrecise* flag is ignored if some frames are to be duplicated (frame #125 in the example). The filmstrip will be rendered in frame precise mode.
`drawFilmstrip(canvas, 100, 270, 5, false)`

| #100 | **#125** | **#125** | **#125** | #270 |
|------|----------|----------|----------|------|

`numberOfFrames` explanation:

Drawer does not care whether the canvas is too wide or too narrow to fit all the frames.

Lets assume `canvasElement` is wide enough to fit 10.5 frames.

If `numberOfFrames` is 3: drawer will draw exactly 3 frames and will leave the right part of the canvas intact.

If `numberOfFrames` is 20: drawer will try draw exactly 20 frames. Half of the frames will not fit into the canvas.
The rightmost visible frame will not be `endFrame`.

In general use case if `canvasElement` can fit 10.5 frames pass 11 in `numberOfFrames`.
In this case the last frame will be `endFrame` and it will be half-visible.

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
