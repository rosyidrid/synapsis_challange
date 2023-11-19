class Question {
  String? id;
  int? questionNumber;
  String? surveyId;
  String? section;
  String? inputType;
  String? questionName;
  String? questionSubject;
  List<Options>? options;

  Question(
      {this.id,
      this.questionNumber,
      this.surveyId,
      this.section,
      this.inputType,
      this.questionName,
      this.questionSubject,
      this.options});

  factory Question.fromJson(Map<String, dynamic> json) => Question(
      id: json['id'] as String?,
      questionNumber: json['question_number'] as int?,
      surveyId: json['survey_id'] as String?,
      section: json['section'] as String?,
      inputType: json['input_type'] as String?,
      questionName: json['question_name'] as String?,
      questionSubject: json['question_subject'] as String?,
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
        color: json['color'] as String,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "question_id": questionId,
        "option_name": optionName,
        "value": value,
        "color": color
      };
}
