# MediaRequest command parameters

| Parameter | Desciption | Type | Default value |
| --------- | ---------- | ---- | ------------- |
| `watermarkText`  | Text to display in a watermark. Only one of `watermarkText` and `watermarkImage` properties may be present.  | `String` | N/A |
| `watermarkImage` | Image to display in a watermark. Only one of `watermarkText` and `watermarkImage` properties may be present. | `String` | N/A |
| `position`       | Watermark position. See description below for details.                                                       | `Object` | *see details below* |
| `opacity`        | Opacity of the watermark. May be given as a number between 0 and 1.                                          | `Number` | 0.42 |
| `fontSize`       | Watermark font size in whatever units. Only used for text watermarks.                                        | `Number` | 42 |

##  Watermark position object

| Property          | Description                              | Values                                        | Default value |
| ----------------- | ---------------------------------------- | --------------------------------------------- | ------------- |
| vertical          | Object describing vetrical positioning   | `Object` with `align` and `margin` properties |               |
| vertical.align    | Vertical alignment                       | `"top"`, `"center"` or `"bottom"`             | `"center"`    |
| vertical.margin   | Position of the edge of the watermark relative to the screen edge as percentage of frame height. Ignored for `align="center"` | `String`, e.g. `"42%"` | N/A |
| horizontal        | Object describing horizontal positioning | `Object` with `align` and `margin` properties |               |
| horizontal.align  | Horizontal alignment                     | `"left"`, `"center"` or `"right"`             | `"center"`    |
| horizontal.margin | Position of the edge of the watermark relative to the screen edge as percentage of frame width. Ignored for `align="center"` | `String`, e.g. `"42%"` | N/A |

## Examples

```javascript
{
  watermarkText: "Property of VideoGorillas",
  opacity: 0.42,
  fontSize: 42,
  position: {
    vertical: {
      align: "bottom",
      margin: "10%"
    },
    horizontal: {
      align: "center"
    }
  }
}
```
