var http = require('http');
var pg = require('pg');
var dns = require('dns');

var conString = "";
var client = null;
conString = "postgres://web_test:12345@postgres-master.service.consul/web_test";
client = new pg.Client(conString);

function query(client, callback) {
  client.connect(function(err) {
    if(err) {
      return console.error('could not connect to postgres', err);
    }
    client.query('SELECT NOW() AS "theTime"', function(err, result) {
      if(err) {
        return console.error('error running query', err);
      }
      callback(result);
      client.end();
    });
  });
}

// Configure our HTTP server to respond with Hello World to all requests.
var server = http.createServer(function (request, response) {
  response.writeHead(200, {"Content-Type": "text/plain"});
  query(client, function(result) {
      console.log(result.rows[0].theTime);
      response.write(result.rows[0].theTime + "\n");
      response.end("Hello World\n");
  });
});

server.listen(8080, "0.0.0.0");
console.log("Server running at http://127.0.0.1:8080/");
