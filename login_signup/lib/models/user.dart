import 'dart:convert';

class User {
  String email;
  String password;
  String cpassword;

  get getEmail => email;

  void setEmail(email) => this.email = email;

  get getPassword => password;

  void setPassword(password) => this.password = password;

  get getCpassword => cpassword;

  void setCpassword(cpassword) => this.cpassword = cpassword;

  User({
    required this.email,
    required this.password,
    required this.cpassword,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'email': email,
      'password': password,
      'cpassword': cpassword,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      email: map['email'] as String,
      password: map['password'] as String,
      cpassword: map['cpassword'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) =>
      User.fromMap(json.decode(source) as Map<String, dynamic>);
}
