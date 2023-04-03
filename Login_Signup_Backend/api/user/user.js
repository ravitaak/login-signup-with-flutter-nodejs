const express = require('express');
const routes = express.Router();
const jwt = require("jsonwebtoken");
const verifyToken = require('./utils');
const secretKey = "RAVITAAK";
require("../database/config");
const User = require('../database/users');

routes.post("/register",async (req, res)  => {
  let data = new User(req.body)
  let oldUser =  await User.findOne({email:data.email});
    if(oldUser == null){
      if(data.password == data.cpassword){
        const result = await data.save();
        if(result._id != ''){
          res.statusCode= 200;
          res.json({status: true, msg:'User registered successfully!'});
        }else{
          res.statusCode= 503;
          res.json({status: false, msg:'Something Went Wrong!'});
        }
      }else{
        res.statusCode= 401;
        res.json({status: false, msg:'Password not match!'});
      }
    }else{
      res.statusCode= 400;
      res.json({status: false, msg:'User already registered'});
    }
});


routes.post("/login",async (req, res) => {
  let data = new User(req.body)
  let oldUser =  await User.findOne({email:data.email});

  if(oldUser != null){
      if(oldUser.password == data.password){
        jwt.sign({ oldUser }, secretKey, { expiresIn: "300m" }, (err, token) => {
          res.statusCode= 200;
          res.json({status: true, msg:'User login successfully!', token: token});
        });
      }else{
        res.statusCode= 401;
        res.json({status: false, msg:'Password not match!',token:"NO" });
      }
  } else{
    res.statusCode= 404;
    res.json({status: false, msg:'User not found', token:"NO"});
  }
});



routes.post("/dashboard", verifyToken, (req, res) => {
  jwt.verify(req.token, secretKey, (err, authData) => {
    if (err) {
      res.send({ result: "invalid token" });
    } else {
      res.json({
        status :true,
        msg: "profile accessed",
        email: authData.oldUser.email,
    
      });
    }
  });
});





module.exports = routes;


