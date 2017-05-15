# <a id="LogLevel"></a>`LogLevel` enum #

- `DEBUG` - very verbose logging, may impact performance
- `INFO` - general info, warnings and errors
- `WARN` - warnings and errors only
- `ERROR` - only errors
- `OFF` - disable all player logs

#### Example

```js
var player = new VG.Player(container, { logLevel: VG.LogLevel.OFF });
```