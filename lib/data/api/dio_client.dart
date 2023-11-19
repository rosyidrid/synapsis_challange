import 'package:dio/dio.dart';
import 'package:synapsis_challange/data/sharedPreferences/user_preferences.dart';

class DioClient {
  final Dio dio;

  DioClient(this.dio);

  Future<dynamic> post(String uri, {dynamic data, Options? options}) async {
    final response = await dio.post(uri, data: data);
    return response;
  }

  Future<dynamic> get(String uri, {Options? options, String? token}) async {
    final dioOptions = await generateDioOption(options);
    final response = await dio.get(uri, options: dioOptions);
    return response;
  }

  Future<Options> generateDioOption(Options? options,
      {String? token, bool isInnerService = false}) async {
    final dioOptions = options ?? Options();
    UserPreferences userPreferences = UserPreferences();
    dioOptions.headers = dioOptions.headers ?? {};
    dioOptions.headers!["Cookie"] = "${await userPreferences.getToken()}";
    return dioOptions;
  }
}
