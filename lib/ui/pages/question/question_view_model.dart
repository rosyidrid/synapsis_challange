import 'package:flutter/material.dart';
import 'package:synapsis_challange/data/sharedPreferences/user_preferences.dart';
import 'package:synapsis_challange/domain/common/base_view_model.dart';
import 'package:synapsis_challange/domain/models/request/login/request_submit_answer.dart';
import 'package:synapsis_challange/domain/models/response/survey/response_detail_survey.dart';
import 'package:synapsis_challange/domain/usecase/usecase.dart';
import 'package:synapsis_challange/ui/pages/question/question_navigator.dart';
import 'package:synapsis_challange/utils/check_is_error.dart';

class QuestionViewModel extends BaseViewModel<QuestionNavigator> {
  late Usecase usecase;

  TextEditingController textType = TextEditingController();

  ResponseDetailSurvey response = ResponseDetailSurvey();

  UserPreferences userPreferences = UserPreferences();

  int index = 0;

  DataSurvey question = DataSurvey();

  int? selectedValue;

  bool? isFind;

  int questionActive = 1;

  dynamic dataCache;

  QuestionViewModel() {
    usecase = Usecase();
  }

  Future getDetailDataSurvey({required String id}) async {
    final result = await usecase.doGetDetailSurvey(id: id);
    if (checkIsNotError(result)) {
      response = result.keys.first!;
      question = response.data!;
      userPreferences.resetAnswer(surveyId: question.id!);
      setQuestion();
    }

    return;
  }

  void setQuestion() async {
    selectedValue = null;
    question.questions?[index];
    final data = await userPreferences.getAnswer(
        surveyId: question.id!, questionId: question.questions![index].id!);
    if (data != null) {
      for (int i = 0; i < question.questions![index].options!.length; i++) {
        if (data['answer'] == question.questions![index].options![i].id) {
          selectedValue = question.questions![index].options![i].value;
          break;
        }
      }
    }

    if (data != null) {
      dataCache =
          await userPreferences.getAnswers(surveyId: response.data!.id!);
    }

    notifyListeners();
  }

  void nextTaped() {
    if (index < question.questions!.length) {
      index++;
      questionActive++;
      setQuestion();
      notifyListeners();
    }
  }

  void backTaped() {
    if (index > 0) {
      index--;
      questionActive--;
      setQuestion();
      notifyListeners();
    }
  }

  Future setQuestionWhileTap(selectedQuestion) async {
    index = selectedQuestion - 1;
    questionActive = selectedQuestion;
    setQuestion();
    notifyListeners();
  }

  void setTextValue({required String surveyId}) async {
    await userPreferences.setAnswers(
        surveyId: surveyId,
        answer: Answers(
            answer: textType.text,
            questionId:
                question.questions![question.questions!.length - 1].id));
    setQuestion();
    notifyListeners();
  }

  void setSelectedValue(
      {required int selected,
      required Answers value,
      required String surveyId}) async {
    selectedValue = selected;
    await userPreferences.setAnswers(surveyId: surveyId, answer: value);
    setQuestion();
    notifyListeners();
  }
}
