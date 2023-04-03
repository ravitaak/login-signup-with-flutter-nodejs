const mongoose = require("mongoose");
const productSchema = mongoose.Schema({
  email: String,
  password: String,
  cpassword: String
});

module.exports = mongoose.model("users", productSchema);
