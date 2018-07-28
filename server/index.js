// const fs = require('fs');
// const http = require('http');
// const WebSocket = require('ws');
 
// const server = new http.createServer();
// const wss = new WebSocket.Server({ server });
 
// wss.broadcast = function broadcast(data, ws) {
//   wss.clients.forEach(function each(client) {
//     console.log(ws == wss)
//     if (client.readyState === WebSocket.OPEN) {
//       client.send(data);
//     }
//   });
// };

// wss.on('connection', function connection(ws) {
//   console.log('client connected')
//   ws.on('message', function incoming(message) {
//     console.log('received: %s', message);
//     wss.broadcast(message, ws);
//   });
 
//   ws.send('something from the server');
// });
 
// server.listen(8080, "192.168.29.129");

/////
// var server = require('http').createServer();
// var io = require('socket.io')(server);
// io.on('connection', function(client){
//   client.on('event', function(data){});
//   client.on('disconnect', function(){});
// });
// server.listen(8080, "192.168.29.129");

let message = 'welcome';

const extractMessage = (payload) => {
  console.log(typeof(payload), payload)
  if (typeof(payload) === 'object') {
    message = payload.text;
  } else {
    message = payload;
  }
  return message;
}

var io = require('socket.io')();
io.on('connection', function(client){
  console.log('client connected')
  client.on('message', function(data){
    io.emit('message', extractMessage(data));
  });
  client.emit('message', message);
});

io.on('event', function(data){
  console.log(data)
});

io.listen(8080);