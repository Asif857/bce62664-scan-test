const express = require('express');
const { exec } = require('child_process');

const app = express();

app.get('/calc', (request, response) => {
    response.send(String(eval(request.query.expression)));
});

app.get('/files', (request, response) => {
    exec(`ls ${request.query.dir}`, (error, stdout) => response.send(stdout));
});

app.get('/redirect', (request, response) => {
    response.redirect(request.query.url);
});

app.listen(3000);
