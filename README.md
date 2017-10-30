# crysocket

A basic Kemal toy application which serves a timestamp over websockets and a JSON endpoint.

## Usage

Install [Crystal](https://crystal-lang.org/)
```bash
$ shards install
$ crystal build --release src/crysocket.cr
$ ./crysocket
```

Open a browser tab and enter the following into the developer javascript console.

```javascript
ws = new WebSocket("ws://localhost:3000")
ws.onmessage = msg => console.log(msg.data)
```

The timestamp should update approximately every second.
Alternatively, access the GET endpoint at http://localhost:3000/time
