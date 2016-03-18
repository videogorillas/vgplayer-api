# <a id="TapeTimecode"></a>`TapeTimecode` class #

## `TapeTimecode Class Methods` ##

- [`isTimecode`](#TapeTimecode_isTimecode)
- [`parseTimecode`](#TapeTimecode_parseTimecode)

## `TapeTimecode Instance Methods` ##

- [`getTimecodeAtFrame`](#TapeTimecode_getTimecodeAtFrame)
- [`getFrameByTimecode`](#TapeTimecode_getFrameByTimecode)
- [`getTapeFps`](#TapeTimecode_getTapeFps)
- [`getTimecodedDuration`](#TapeTimecode_getTimecodedDuration)
- [`isDropFrame`](#TapeTimecode_isDropFrame)

## _TapeTimecode Class Methods_ ##

### <a id="TapeTimecode_isTimecode"></a>`TapeTimecode.isTimecode(str)`
Check whether `str` is a valid tape timecode string representation.
#### Returns
*(Boolean)*: `true` - `str` is valid, `false` - otherwise
#### Example
```js
TapeTimecode.isValid("01:00:00:12");
// => true
TapeTimecode.isValid("00:00:53;13");
// => true
TapeTimecode.isValid("01:00:00:1234");
// => false
```

---

### <a id="TapeTimecode_parseTimecode"></a>`TapeTimecode.parseTimecode(tc, timecodeRate, dropFrame)`
Parse tape timecode from string `tc`.

#### Arguments
1. `tc` *(String)*: string to parse
2. `timecodeRate` *(Integer)*: frames per second
3. `dropFrame` *(Boolean)*: is timecode drop frame or non-drop frame

#### Returns
*(Integer)*: frame number corresponding to the parsed timecode

#### Example
```js
TapeTimecode.parseTimecode("00:00:01:12", 24, false);
// => 36
```

## _TapeTimecode Instance Methods_ ##

### <a id="TapeTimecode_getTimecodeAtFrame"></a>`TapeTimecode.prototype.getTimecodeAtFrame(frame)`
Get tape timecode at frame `frame`.

#### Arguments
1. `frame` *(Integer)*: frame number

#### Returns
*(String)*: tape timecode

#### Example
```js
ttc.getTimecodeAtFrame(36);
// => "01:00:01:12"
```

---

### <a id="TapeTimecode_getFrameByTimecode"></a>`TapeTimecode.prototype.getFrameByTimecode(tc)`
Get frame number by tape timecode.

#### Arguments
1. `tc` *(String)*: tape timecode

#### Returns
*(Integer)*: frame number

#### Example
```js
ttc.getFrameByTimecode("01:00:01:12");
// => 36
```

---

### <a id="TapeTimecode_getTapeFps"></a>`TapeTimecode.prototype.getTapeFps()`
Get the tape frame rate of this tape timecode instance.

#### Returns
*(Integer)*: tape frame rate

---

### <a id="TapeTimecode_getTimecodedDuration"></a>`TapeTimecode.prototype.getTimecodedDuration()`
Get timeline duration as tape timecode.

#### Returns
*(String)*: tape timecode

#### Example
```js
ttc.getTimecodedDuration();
// => "00:33:28:12"
```

---

### <a id="TapeTimecode_isDropFrame"></a>`TapeTimecode.prototype.isDropFrame()`
Return true if this tape timecode instance is drop frame.

#### Returns
*(Boolean)*: `true` for drop frame, `false` for non-drop frame
