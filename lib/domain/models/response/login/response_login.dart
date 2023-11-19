import 'package:dio/dio.dart';

class ResponseLogin {
  int? code;
  bool? status;
  String? message;
  OccupationData? data;
  String? token;

  ResponseLogin({this.code, this.status, this.message, this.data, this.token});

  factory ResponseLogin.fromJson(Response<dynamic> json, String? token) =>
      ResponseLogin(
          code: json.data['code'] as int?,
          status: json.data["status"] as bool?,
          message: json.data["message"] as String?,
          data: json.data["data"] == null
              ? null
              : OccupationData.fromJson(
                  json.data["data"] as Map<String, dynamic>),
          token: token);

  Map<String, dynamic> toJson() => {
        "code": code,
        "status": status,
        "message": message,
        "data": data?.toJson(),
        "token": token
      };
}

class OccupationData {
  int? occupationLevel;
  String? occupationName;

  OccupationData({this.occupationLevel, this.occupationName});

  factory OccupationData.fromJson(Map<String, dynamic> json) => OccupationData(
      occupationLevel: json["occupation_level"] as int?,
      occupationName: json["occupation_name"] as String?);

  Map<String, dynamic> toJson() =>
      {"occupation_level": occupationLevel, "occupation_name": occupationName};
}
