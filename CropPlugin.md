# `CropPlugin` #

Plugin provides API for saving or cropping of currently displayed frame. 

## `Usage` ##

```PlayerMain.enableCropPlugin(
        Player player,
        Element cropContainerEl,
        Callback1<VGCropPluginView, VGCropPlugin> onCropRequested);
```

### Callbacks
- [`onCropRequested(_cropPlugin)`](#onCropRequested)

### Methods

- [`getCroppedCanvas()`](#getCroppedCanvas)



### <a id="getCroppedCanvas"></a>`Canvas getCroppedCanvas()`

Usually called when crop frame defined and results have to be saved somewhere.
Returns HTMLCanvas object with full scaled captured and cropped frame.
 
### <a id="onCropRequested"></a>`Callback1<VGCropPlugin>`

Called when Capture Frame Icon clicked. Stops playback. This can be used to open crop UI and do actual cropping.
