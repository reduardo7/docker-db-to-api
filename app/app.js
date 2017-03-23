const express = require('express');
const mysql = require('mysql');
const mysqltorest = require('mysql-to-rest');
const app = express();

const connection = mysql.createConnection({
  host     : process.env.DB_HOST,
  user     : process.env.DB_USER,
  password : process.env.DB_PASS,
  database : process.env.DB_DATABASE
});

const api = mysqltorest(app, connection);

app.listen(3000);
