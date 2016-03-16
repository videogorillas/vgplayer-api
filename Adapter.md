# VG Adapter API
http://docs.vgbrain.apiary.io/# 

# Post New Media

You may create your own media recognition tasks using this action. It takes a JSON object containing a media and a collection of commands to perform actions on media.

Request
```
POST /api/1/media

Content-Type:application/json

{
  "url": "https://www.dropbox.com/s/sdqg1a03vo2hggl/11043435_10152889047648640_3006656993036528196_o.jpg?dl=1",
  "commands": [ "nocache", "makehls1", "vgproxy", "makedash" ]
}
```

Response
```
{
  "type": "MEDIA",
  "id": "m4",
  "url": "https://www.dropbox.com/s/sdqg1a03vo2hggl/11043435_10152889047648640_3006656993036528196_o.jpg?dl=1",
  "hasThumbnail": false,
  "commands": [ "nocache", "makehls1", "vgproxy", "makedash" ]
}
```