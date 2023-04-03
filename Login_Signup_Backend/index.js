const express = require("express");
const app = express();
const userRoute = require('./api/user/user');

app.use(express.json());
app.use('/user', userRoute);

app.listen(5000);
