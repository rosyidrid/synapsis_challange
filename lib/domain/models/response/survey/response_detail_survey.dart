import 'package:dio/dio.dart';

class ResponseDetailSurvey {
  int? code;
  bool? status;
  String? message;
  DataSurvey? data;

  ResponseDetailSurvey({this.code, this.status, this.message, this.data});

  factory ResponseDetailSurvey.fromJson(Response<dynamic> json) =>
      ResponseDetailSurvey(
          code: json.data['code'] as int?,
          status: json.data['status'] as bool?,
          message: json.data['message'] as String?,
          data: json.data['data'] == null
              ? null
              : DataSurvey.fromJson(json.data['data'] as Map<String, dynamic>));

  Map<String, dynamic> toJson() => {
        "code": code,
        "status": status,
        "message": message,
        "data": data?.toJson()
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
      this.questions});

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
          []);

  Map<String, dynamic> toJson() => {
        "id": id,
        "survey_name": surveyName,
        "status": status,
        "total_responden": totalResponden,
        "questions": questions
      };
}

class DataQuestions {
  String? id;
  int? questionNumber;
  String? surveyId;
  String? section;
  String? inputType;
  String? questionName;
  String? questionSubject;
  List<Options>? options;

  DataQuestions(
      {this.id,
      this.questionNumber,
      this.surveyId,
      this.section,
      this.inputType,
      this.questionName,
      this.questionSubject,
      this.options});

  factory DataQuestions.fromJson(Map<String, dynamic> json) => DataQuestions(
      id: json['id'] as String?,
      questionNumber: json['question_number'] as int?,
      surveyId: json['survey_id'] as String?,
      section: json['section'] as String?,
      inputType: json['input_type'] as String?,
      questionName: json['question_name'] as String?,
      questionSubject: json['question_subject'] as String,
      options: (json['options'] as List<dynamic>?)
              ?.map((e) => Options.fromJson(e))
              .toList() ??
          []);

  Map<String, dynamic> toJson() => {
        "id": id,
        "question_number": questionNumber,
        "survey_id": surveyId,
        "section": section,
        "input_type": inputType,
        "question_name": questionName,
        "question_subject": questionSubject,
        "options": options
      };
}

class Options {
  String? id;
  String? questionId;
  String? optionName;
  int? value;
  String? color;

  Options({this.id, this.questionId, this.optionName, this.value, this.color});

  factory Options.fromJson(Map<String, dynamic> json) => Options(
      id: json['id'] as String?,
      questionId: json['question_id'] as String?,
      optionName: json['option_name'] as String?,
      value: json['value'] as int?,
      color: json['color'] as String?);

  Map<String, dynamic> toJson() => {
        "id": id,
        "question_id": questionId,
        "option_name": optionName,
        "value": value,
        "color": color
      };
}
