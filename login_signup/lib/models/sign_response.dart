import 'dart:convert';

class SignResponse {
  bool status;
  String msg;
  SignResponse({
    required this.status,
    required this.msg,
  });

  get getStatus => status;

  void setStatus(status) => this.status = status;

  get getMsg => msg;

  void setMsg(msg) => this.msg = msg;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'status': status,
      'msg': msg,
    };
  }

  factory SignResponse.fromMap(Map<String, dynamic> map) {
    return SignResponse(
      status: map['status'] as bool,
      msg: map['msg'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory SignResponse.fromJson(String source) =>
      SignResponse.fromMap(json.decode(source) as Map<String, dynamic>);
}
