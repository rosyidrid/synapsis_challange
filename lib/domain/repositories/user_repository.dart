import 'package:synapsis_challange/data/api/endpoints/user_endpoint.dart';
import 'package:synapsis_challange/domain/repositories/base_repository.dart';
import 'package:synapsis_challange/domain/models/response/login/response_login.dart';
import 'package:synapsis_challange/domain/models/response/survey/response_detail_survey.dart';
import 'package:synapsis_challange/domain/models/response/survey/response_survey.dart';
import 'package:synapsis_challange/utils/get_token.dart';

class UserRepository extends BaseRepository {
  UserRepository() : super();

  dynamic data;
  String? token;
  Future<ResponseLogin> doLogin(
      {required String email, required String password}) async {
    await dioClient.post(UserEndpoint.login,
        data: {'email': email, 'password': password}).then((value) async {
      data = value;
      token = getToken(value.headers.map['set-cookie'].first);
    });

    return ResponseLogin.fromJson(data, token);
  }

  Future<ResponseSurvey> getAllSurvey() async {
    await dioClient.get(UserEndpoint.getSurvey).then((value) {
      data = value;
    });

    return ResponseSurvey.fromJson(data);
  }

  Future<ResponseDetailSurvey> getDetailSurvey({required String id}) async {
    await dioClient.get(UserEndpoint.getDetailSurvey(id)).then((value) {
      data = value;
    });
    return ResponseDetailSurvey.fromJson(data);
  }
}
