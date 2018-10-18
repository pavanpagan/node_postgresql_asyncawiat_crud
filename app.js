var express = require('express');
var app = express();


const admin = require('./admin/controller/admincontroller');


app.use('/admin',admin,(req,res,next)=>{})

module.exports = app;
