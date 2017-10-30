# crysocket 
![Travis build status](https://api.travis-ci.org/blutack/crysocket.svg?branch=master) [![Heroku](http://heroku-badge.herokuapp.com/?app=crysocket&style=flat&svg=1)]

A basic Kemal toy application which serves a timestamp over websockets and a JSON endpoint.

## Usage

First install [Crystal](https://crystal-lang.org/) if you don't already have it.
Then in the checkout of this repository:

```bash
$ shards install
$ crystal build --release src/crysocket.cr
$ ./crysocket
```

To test, open a browser tab and enter the following into the developer javascript console:

```javascript
ws = new WebSocket("ws://localhost:3000")
ws.onmessage = msg => console.log(msg.data)
```

The timestamp should update approximately every second.

Alternatively, access the GET endpoint at http://localhost:3000/time
