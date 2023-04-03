// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class DashboardRes {
  bool status;
  String msg;
  String email;
  DashboardRes({
    required this.status,
    required this.msg,
    required this.email,
  });
  get getStatus => status;

  void setStatus(status) => this.status = status;

  get getMsg => msg;

  void setMsg(msg) => this.msg = msg;

  get getEmail => email;

  void setEmail(email) => this.email = email;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'status': status,
      'msg': msg,
      'email': email,
    };
  }

  factory DashboardRes.fromMap(Map<String, dynamic> map) {
    return DashboardRes(
      status: map['status'] as bool,
      msg: map['msg'] as String,
      email: map['email'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory DashboardRes.fromJson(String source) =>
      DashboardRes.fromMap(json.decode(source) as Map<String, dynamic>);
}
