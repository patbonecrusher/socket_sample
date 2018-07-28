console.log('page loaded')
// var exampleSocket = new WebSocket("ws://192.168.29.129:8080");
// exampleSocket.onmessage = function (event) {
//   console.log('received from server: ' + event.data);
//   document.getElementById('content').innerHTML = event.data;
// }

// function textEntered2() {
//   var x = document.getElementById("thetexta").value;
//   console.log('text updated ' + x)
//   exampleSocket.send(x)
// }


var socket = io('http://localhost:8080');
socket.on('connect', function(){
  console.log("client connected");
});
socket.on('event', function(data){});
socket.on('disconnect', function(){});

socket.on('message', function(data){
  console.log('received from server: ' + data);
  // document.getElementById('content').innerHTML = data;
  document.getElementById('content2').innerHTML = data;
});

function textEntered2() {
  var x = document.getElementById("content2").value;
  socket.emit('message', x)
}