// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class LoginUser {
  String email;
  String password;
  LoginUser({
    required this.email,
    required this.password,
  });
  get getEmail => email;

  void setEmail(email) => this.email = email;

  get getPassword => password;

  void setPassword(password) => this.password = password;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'email': email,
      'password': password,
    };
  }

  factory LoginUser.fromMap(Map<String, dynamic> map) {
    return LoginUser(
      email: map['email'] as String,
      password: map['password'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory LoginUser.fromJson(String source) =>
      LoginUser.fromMap(json.decode(source) as Map<String, dynamic>);
}
