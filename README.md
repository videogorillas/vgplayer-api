# VG Player Public API

This repository contains VG Player public API documentation.

https://videogorillas.com/player

![screenshot](screenshot.jpg "VG Player screenshot")

# Sample Page

```html
<!DOCTYPE html>
<html>

<head lang="en">
    <meta charset="UTF-8">
    <title>VG Player</title>
    <link rel="stylesheet" href="vgplayer.min.css" />
</head>

<body>
    <div id="playerContainer" style="width: 80%;"></div>
    <script src="vgplayer.js"></script>
    <script>
        var player;

        window.onload = function () {
            var playerContainer = document.getElementById("playerContainer");
            var options = { hotkeys: true, theme: "vg", plugins: ["filmstrip"] };
            player = new VG.Player(playerContainer, options);

            player.load("http://kote.videogorillas.com/vmir/always-dynamic-tong/file.mpd", function () {
                console.log("player Loaded");
                var rusSubsUrl = "http://kote.videogorillas.com/vmir/pete_rus.srt";
                var gerSubsUrl = "http://kote.videogorillas.com/vmir/ger.stl";

                function addSubs(err, subs) {
                    if (err) {
                        console.error("error parsing subs", err);
                        return;
                    }
                    console.log("subs parsed", subs);
                    player.addCaptions(subs);
                }

                VG.Captions.parseSubs(player.getTimeline(), rusSubsUrl, VG.Captions.guessSubtitleCodec(rusSubsUrl), addSubs);
                VG.Captions.parseSubs(player.getTimeline(), gerSubsUrl, VG.Captions.guessSubtitleCodec(gerSubsUrl), addSubs);

            });
        };
    </script>
</body>

</html>



```


# Require.js

Download require http://requirejs.org/docs/download.html#requirejs

```html
<script src="lib/require.js"></script>
<script>
    requirejs(['lib/vgplayer-web.js'], function (VG) {
        const container = document.getElementById("playerContainer");
        const options = {
            hotkeys: true,
        };
        player = new window.PlayerImpl(container, options);
</script>
```
