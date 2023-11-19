import 'package:synapsis_challange/domain/models/errors/error_message.dart';
import 'package:synapsis_challange/domain/repositories/user_repository.dart';
import 'package:synapsis_challange/domain/models/response/login/response_login.dart';
import 'package:synapsis_challange/domain/models/response/survey/response_detail_survey.dart';
import 'package:synapsis_challange/domain/models/response/survey/response_survey.dart';
import 'package:synapsis_challange/domain/usecase/c_usecase.dart';

class Usecase extends CUsecase {
  Usecase() : super(UserRepository());

  @override
  Future<Map<ResponseLogin?, ErrorMessage?>> doLogin(
      {required String email, required String password}) async {
    disposeVariable();
    ResponseLogin? response;
    await repository
        .doLogin(email: email, password: password)
        .then((value) async {
      response = value;
    }).catchError((e) async {
      await mappingError(error, e).then((value) => error = value);
    });

    return Future.value({response: error});
  }

  @override
  Future<Map<ResponseSurvey?, ErrorMessage?>> doGetAllSurvey() async {
    disposeVariable();
    ResponseSurvey? response;
    await repository.getAllSurvey().then((value) async {
      response = value;
    }).catchError((e) async {
      await mappingError(error, e).then((value) => error = value);
    });

    return Future.value({response: error});
  }

  @override
  Future<Map<ResponseDetailSurvey?, ErrorMessage?>> doGetDetailSurvey(
      {required String id}) async {
    disposeVariable();
    ResponseDetailSurvey? response;
    await repository.getDetailSurvey(id: id).then((value) {
      response = value;
    }).catchError((e) async {
      await mappingError(error, e).then((value) => error = value);
    });

    return Future.value({response: error});
  }
}
