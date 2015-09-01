var http = require('http');
var pg = require('pg');
var dns = require('dns');

var conString = "";
conString = "postgres://web_test:12345@postgres-master.service.consul/web_test";

function query(client, query, callback) {
  console.log("Running query: ", query);
  client.query(query, function(err, result) {
    if(err) {
      return console.error('error running query', err);
    }
    console.log("Query successfull: ", query);
    callback(result);
  });
}

function insertQuery(client, callback) {
  var q =  "insert into roles (name, created_at, updated_at) values ('test', now(), now());";
  query(client, q, callback);
}
function selectQuery(client, callback) {
  var q = "select count(*) as count from roles;";
  query(client, q, callback);
}

setInterval(testLoop, 1000);

var counter = 1;

function testLoop() {
  var localCounter = counter;
  counter++;
  console.log("test loop: ", localCounter);
  pg.connect(conString, function(err, client) {
    if(err) {
      return console.error('could not connect to postgres', err);
    }
    selectQuery(client, function() {
      insertQuery(client, function() {
        selectQuery(client, function(result) {
          console.log("test loop finished: ", localCounter);
          console.log("Count: ", result.rows[0].count);
          client.end();
        });
      });
    });
  });
}
