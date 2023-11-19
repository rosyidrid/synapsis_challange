import 'package:synapsis_challange/domain/models/errors/error_message.dart';
import 'package:synapsis_challange/domain/repositories/user_repository.dart';
import 'package:synapsis_challange/domain/models/response/login/response_login.dart';
import 'package:synapsis_challange/domain/usecase/base_usecase.dart';
import 'package:synapsis_challange/domain/models/response/survey/response_detail_survey.dart';
import 'package:synapsis_challange/domain/models/response/survey/response_survey.dart';

abstract class CUsecase extends BaseUsecase<UserRepository> {
  CUsecase(UserRepository repository) : super(repository);

  Future<Map<ResponseLogin?, ErrorMessage?>> doLogin(
      {required String email, required String password});

  Future<Map<ResponseSurvey?, ErrorMessage?>> doGetAllSurvey();

  Future<Map<ResponseDetailSurvey?, ErrorMessage?>> doGetDetailSurvey(
      {required String id});
}
