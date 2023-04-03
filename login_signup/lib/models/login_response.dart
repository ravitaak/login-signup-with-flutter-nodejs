import 'dart:convert';

class LoginResponse {
  bool status;
  String msg;
  String token;
  LoginResponse({
    required this.status,
    required this.msg,
    required this.token,
  });

  get getStatus => status;

  void setStatus(status) => this.status = status;

  get getMsg => msg;

  void setMsg(msg) => this.msg = msg;

  get getToken => token;

  void setToken(token) => this.token = token;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'status': status,
      'msg': msg,
      'token': token,
    };
  }

  factory LoginResponse.fromMap(Map<String, dynamic> map) {
    return LoginResponse(
      status: map['status'] as bool,
      msg: map['msg'] as String,
      token: map['token'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory LoginResponse.fromJson(String source) =>
      LoginResponse.fromMap(json.decode(source) as Map<String, dynamic>);
}
