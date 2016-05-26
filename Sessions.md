# Streaming Sessions API #

Purpose: protect streamed media from unauthorized access.

## Integration Guidelines ##

### General diagram

- `VSS` - video streaming server
- `APP` - application backend
- `Web page` - application frontend

![](sessions.png "General diagram")

1. User `U` logs into the application. APP creates user session `S`.
2. User opens the page containing the player to play media item `M`. The page asks APP for a streaming session. APP checks user’s permissions.
3. APP asks VSS to create a *streaming session*. Streaming session is created and associated with `S` and `M`. Its id `T` is passed in the response.
4. `T` is passed to the page.
5. The page passes `T` to the VSS and receives the cookie `C`.
6. `Player.load()` is called. The player plays media `M`. All requests from the player to the VSS are signed with the cookie `C`.
7. User logs out of the application. APP session `S` is invalidated.
8. APP requests VSS to invalidate all the streaming sessions associated with APP session `S`.

Requests from APP to VSS should be over SSL and must be authorized with application id and a secret key.

APP code on the web page is responsible for the authorization. The player itself is not aware of any authorization. `Player.load()` method must be called after the authorization is complete (step 6).

A new streaming session should be requested in order to allow user `U` to view another media item. One streaming session per media.

### Step 2 in detail

It is application responsibility to control permissions. APP checks user's permissions. If user is allowed to access media `M` APP proceeds to step 3.

### Step 3 in detail

APP send sends request to the sessions API. Streaming session id is sent in a response.

Request:

```
POST /api/1/sessions/create
Content-Type: application/json
{
    appSessionId: "abcd123",
    mediaId: "BIGHERO6",
    ttl: 3600,
    appId: "REX",
    key: "libh245h2435h2b5hi2b52h345bbhk2k45bh5bh5hb55h2k4h5h24"
}
```

Response:

```
200 OK
Content-Type: application/json
{
    id: "AbCdEfGh12345"
}
```

### Step 5 in detail

Application frontend now has streaming session id. Frontend should send the id to the VSS to obtain a cookie.

Request:

```
POST /api/1/sessions/cookie
Content-Type: application/json
{
    id: "AbCdEfGh12345"
}
```

Response:

```
200 OK
Set-Cookie: VGStreamingSession=abcd123;Path=/;Expires=Thu, 26-May-2016 16:19:21 GMT
```

### Step 6 in detail

Browser automatically adds the cookie to all the requests from the player to the VSS.

Request:

```
GET /api/1/storage/m42/v4242/stream-3.3.m4s
Cookie: VGStreamingSession=AbCdEfGh12345
```

### Step 8 in detail

APP should notify VSS when user logs out. This is needed to prevent access to the media after user has logged out.
VSS invalidates all associated streaming sessions.

Request:

```
POST /api/1/sessions/invalidate
Content-Type:application/json
{
    appSessionId: "abcd123",
    appId: "REX",
    key: "libh245h2435h2b5hi2b52h345bbhk2k45bh5bh5hb55h2k4h5h24"
}
```

Response:
```
200 OK
```

---

## API ##

### POST /api/1/sessions/create ###

Create media streaming session. Returns the session id.

NOTE: This request is made from the application server (APP).

#### Arguments:

- `appSessionId` - APP user session id
- `mediaId` - media item id
- `ttl` - session time-to-live. Session is invalidated after `ttl` seconds
- `appId` - application id
- `key` - secret key

#### Response statuses:

- `200` - success
- `400` - `appSessionId`, `mediaId` or `ttl` is invalid or request body can not be parsed
- `403` - `appId` or `key` is invalid

#### Sample request body:

```
{
    appSessionId: "abcd123",
    mediaId: "BIGHERO6",
    ttl: 3600,
    appId: "REX",
    key: "libh245h2435h2b5hi2b52h345bbhk2k45bh5bh5hb55h2k4h5h24"
}
```

#### Sample response body:

```
{
    id: "AbCdEfGh12345"
}
```

---

### POST /api/1/sessions/cookie ###

Get the session cookie. Response contains the cookie if the request is successfull. Cookie max-age is set according to session TTL.

NOTE: This request is made from the web page.

#### Arguments:

- `id` - streaming session id

#### Response statuses:

- `200` - success
- `400` - `id` is invalid or request body can not be parsed
- `404` - session with `id` does not exist

#### Sample request body:
```
{
    id: "AbCdEfGh12345"
}
```

---

### POST /api/1/sessions/invalidate ###

Invalidate all streaming sessions associated with the APP user session.
HTTP response code 200 indicates success.

NOTE: This request is made from APP.

#### Arguments:

- `appSessionId` - APP user session id
- `appId` - application id
- `key` - secret key

#### Response statuses:

- `200` - success
- `400` - `appSessionId` is invalid or request body can not be parsed
- `403` - `appId` or `key` is invalid

#### Sample request body:

```
{
    appSessionId: "abcd123",
    appId: "REX",
    key: "libh245h2435h2b5hi2b52h345bbhk2k45bh5bh5hb55h2k4h5h24"
}
```
