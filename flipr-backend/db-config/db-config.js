const mysql = require('mysql');
const dotenv = require('dotenv');
dotenv.config();
//const express = require('express');
//express.json();

const connection = mysql.createPool({
    connectionLimit: 10,
    host: process.env.SQL_Host || 'localhost',
    user: process.env.SQL_Username || 'newuser',
    password: process.env.SQL_Password || 'newpassword',
    database: process.env.SQL_Database || 'hackathon',
    socketPath: process.env.socketPath || '/var/run/mysqld/mysqld.sock',
    port: parseInt(process.env.SQL_PORT) || 3306 
});

connection.getConnection((err, connection)=>{
    if(err) console.log(err);
	//    console.log(connection);
    console.log("Database connection successful :  " + connection.threadId);
})


module.exports = connection;

