import 'package:dio/dio.dart';

class ResponseSurvey {
  int? code;
  bool? status;
  String? message;
  int? totalAllData;
  List<DataSurvey>? data;

  ResponseSurvey(
      {this.code, this.status, this.message, this.totalAllData, this.data});

  factory ResponseSurvey.fromJson(Response<dynamic> json) => ResponseSurvey(
      code: json.data['code'] as int?,
      status: json.data['status'] as bool?,
      message: json.data['message'] as String?,
      totalAllData: json.data['total_all_data'] as int?,
      data: (json.data['data'] as List<dynamic>?)
              ?.map((e) => DataSurvey.fromJson(e))
              .toList() ??
          []);

  Map<String, dynamic> toJson() => {
        "code": code,
        "status": status,
        "message": message,
        "total_all_data": totalAllData,
        "data": data
      };
}

class DataSurvey {
  String? id;
  String? surveyName;
  int? status;
  int? totalResponden;
  String? createdAt;
  String? updatedAt;
  List<DataQuestions>? questions;

  DataSurvey(
      {this.id,
      this.surveyName,
      this.status,
      this.totalResponden,
      this.createdAt,
      this.updatedAt,
      this.questions
      });

  factory DataSurvey.fromJson(Map<String, dynamic> json) => DataSurvey(
      id: json['id'] as String?,
      surveyName: json['survey_name'] as String?,
      status: json['status'] as int?,
      totalResponden: json['total_responden'] as int?,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
      questions: (json['questions'] as List<dynamic>?)
              ?.map((e) => DataQuestions.fromJson(e))
              .toList() ??
          []
          );

  Map<String, dynamic> toJson() => {
        "id": id,
        "survey_name": surveyName,
        "status": status,
        "total_responden": totalResponden,
        "questions": questions
      };
}

class DataQuestions {
  String? questionName;
  String? inputType;
  String? questionId;

  DataQuestions({this.questionName, this.inputType, this.questionId});

  factory DataQuestions.fromJson(Map<String, dynamic> json) => DataQuestions(
      questionName: json['question_name'] as String?,
      inputType: json['input_type'] as String?,
      questionId: json['question_id'] as String?);

  Map<String, dynamic> toJson() => {
        "question_name": questionName,
        "input_type": inputType,
        "question_id": questionId
      };
}
