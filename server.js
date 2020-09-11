"use strict";
const express = require("express");
const app = express();
const port = process.env.port || 5000;
// https://expressjs.com/en/4x/api.html#express.static

// let options = {
//   dotfiles: "ignore", //allow, deny, ignore
//   etag: true,
//   extensions: ["htm", "html"],
//   index: false, //to disable directory indexing
//   maxAge: "7d",
//   redirect: false,
//   setHeaders: function(res, path, stat) {
//     //add this header to all static responses
//     res.set("x-timestamp", Date.now());
//   }
// };

app.use(express.static("public"));
//you can use https://favicon.io/favicon-generator/ to create the favicon.ico

app.get("/", (req, res) => {
  let html = `<!Doctype html><html><head><title>Sample</title></head>`;
  html += `<body><h1>Sample HTML</h1><main></main></body></html>`;
  res.send(html);
});

app.listen(port, err => {
  if (err) {
    return console.log("ERROR", err);
  }
  console.log(`Listening on port ${port}`);
});






// const http = require('http');
// const express = require('express');
// const path = require('path');

// const app = express();
// app.use(express.json());
// app.use(express.static("express"));
// // default URL for website
// app.use('/', function(req,res){
//     res.sendFile(path.join(__dirname+'/express/index.html'));
//     //__dirname : It will resolve to your project folder.
//   });
// const server = http.createServer(app);
// const port = process.env.port || 8080;
// server.listen(port);
// console.debug('Server listening on port ' + port);
