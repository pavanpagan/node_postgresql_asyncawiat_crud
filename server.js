var express = require('express');
var logger = require('morgan');
var bodyParser = require('body-parser');

var api = require('./app');

var app = express();
var server = require('http').createServer(app);

app.use(logger(app.get("env") === "production" ? "combined" : "dev"));

app.use(bodyParser.json());

app.use(bodyParser.urlencoded({ extended: false }));

app.use('/', api);

app.set("env", process.env.NODE_ENV || "development");
app.set("host", process.env.HOST || "0.0.0.0");
app.set("port", process.env.PORT || 5000);

server.listen(app.get("port"), function () {
    console.log('\n' + '**********************************');
    console.log('REST API listening on port ' + app.get("port"));
    console.log('**********************************' + '\n');
});

module.exports = app;

