class ErrorMessage {
  int? code;
  bool? status;
  String? message;
  String? data;

  ErrorMessage({this.code, this.status, this.message, this.data});

  factory ErrorMessage.fromJson(Map<String, dynamic> json) => ErrorMessage(
      code: json['code'] as int?,
      status: json['status'] as bool?,
      message: json['message'] as String?,
      data: json['data'] as String?);
}
