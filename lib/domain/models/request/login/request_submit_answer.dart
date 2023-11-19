class RequestSubmitAnswers {
  String? surveyId;
  List<Answers>? answers;

  RequestSubmitAnswers({this.surveyId, this.answers});

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['survey_id'] = surveyId;
    data['answers'] = answers?.map((answer) => answer.toJson()).toList();
    return data;
  }
}

class Answers {
  String? questionId;
  String? answer;

  Answers({this.questionId, this.answer});

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['question_id'] = questionId;
    data['answer'] = answer;
    return data;
  }
}
