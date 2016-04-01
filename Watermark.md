# MediaRequest command parameters

| Parameter        | Desciption                                                                                                  | Type     |
| ---------------- | ----------------------------------------------------------------------------------------------------------- | -------- |
| `watermarkText`  | Text to display in a watermark. Only one of `watermarkText` and `watermarkText` properties may be present.  | `String` |
| `watermarkImage` | Image to display in a watermark. Only one of `watermarkText` and `watermarkText` properties may be present. | `String` |
| `position`       | Watermark position. See description below for details.                                                      | `Object` |
| `opacity`        | Opacity of the watermark. May be given as a number between 0 and 1.                                         | `Number` |
| `fontSize`       | Watermark font size in whatever units. Only used for text watermarks.                                       | `Number` |

##  Watermark position object

| Property          | Description                              | Values                                        |
| ----------------- | ---------------------------------------- | --------------------------------------------- |
| vertical          | Object describing vetrical positioning   | `Object` with `align` and `margin` properties |
| vertical.align    | Vertical alignment                       | `"top"`, `"center"` or `"bottom"              |
| vertical.margin   | Position of the edge of the watermark relative to the screen edge as percentage of frame height. Ignored for `align="center"` | `String`, e.g. `"42%"` |
| horizontal        | Object describing horizontal positioning | `Object` with `align` and `margin` properties |
| horizontal.align  | Horizontal alignment                     | `"left"`, `"center"` or `"right"              |
| horizontal.margin | Position of the edge of the watermark relative to the screen edge as percentage of frame width. Ignored for `align="center"` | `String`, e.g. `"42%"` |

## Examples


