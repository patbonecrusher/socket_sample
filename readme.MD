# Purposes

Little sandbox to demonstrate how to send data back and forth between a webpage and an ios app over web socket.

## Cloning

git clone https://github.com/patbonecrusher/socket_sample.git

## Execution

### Sever

``` bash
cd server
npm i
npm start
```

### Webpage

2 methods:

1. using live server

``` bash
cd webclient
live-server --port=1234
```

2. simply opening the index.html file

### iOS app

``` bash
cd ios
pod install
open socket.xcworkspace
```

