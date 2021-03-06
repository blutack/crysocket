# crysocket 
[![Travis build status](https://api.travis-ci.org/blutack/crysocket.svg?branch=master)](https://travis-ci.org/blutack/crysocket) [![Heroku](http://heroku-badge.herokuapp.com/?app=crysocket&style=flat&svg=1&root=time)](https://crysocket.herokuapp.com/time)

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
ws = new WebSocket("wss://crysocket.herokuapp.com/socket")
ws.onmessage = msg => console.log(msg.data)
```

The timestamp should update approximately every second.

Alternatively, access the GET endpoint at https://crysocket.herokuapp.com/time
