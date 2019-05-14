const express = require('express');
const app = express();

const morgan = require('morgan');
const cors = require('cors');

app.use(morgan('dev'));
app.use(cors());
app.use(require('./routes/users'));

module.exports = app;
