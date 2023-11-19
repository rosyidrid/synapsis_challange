import 'package:synapsis_challange/data/api/endpoints/endpoint.dart';

class UserEndpoint {
  UserEndpoint();
  static String login = '${Endpoint().baseUrl}/api/login';
  static String getSurvey = '${Endpoint().baseUrl}/api/survey';

  static String getDetailSurvey(String id) {
    return '${Endpoint().baseUrl}/api/survey/$id';
  }
}
