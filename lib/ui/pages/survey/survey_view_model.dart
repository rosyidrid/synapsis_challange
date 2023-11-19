import 'package:synapsis_challange/data/sharedPreferences/user_preferences.dart';
import 'package:synapsis_challange/domain/common/base_view_model.dart';
import 'package:synapsis_challange/domain/models/response/survey/response_survey.dart';
import 'package:synapsis_challange/domain/usecase/usecase.dart';
import 'package:synapsis_challange/ui/pages/survey/survey_navigator.dart';
import 'package:synapsis_challange/utils/check_is_error.dart';

class SurveyViewModel extends BaseViewModel<SurveyNavigator>{
  late Usecase usecase;

  ResponseSurvey response = ResponseSurvey();

  UserPreferences userPreferences = UserPreferences();

  SurveyViewModel(){
    usecase = Usecase();
    getAllDataSurvey();
  }

  void getAllDataSurvey() async {
    final result = await usecase.doGetAllSurvey();
    if(checkIsNotError(result)){
      response = result.keys.first!;
      notifyListeners();
    }
  }

  void logOut() async {
    await userPreferences.deletePreferences();
    getView()?.navigateToLoginScreen();
  }
}