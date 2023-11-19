import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:synapsis_challange/domain/models/request/login/request_submit_answer.dart';

class UserPreferences {
  static const String tokenKey = 'tokenKey';
  static const String rememberKey = 'rememberMe';

  Future<bool> setToken(String token) async {
    const secureStorage = FlutterSecureStorage();
    await secureStorage.write(key: tokenKey, value: token);
    return true;
  }

  Future<String?> getToken() async {
    const secureStorage = FlutterSecureStorage();
    final data = await secureStorage.read(key: tokenKey);
    if (data != null) {
      return Future.value(data);
    } else {
      return Future.value();
    }
  }

  Future<bool> setRememberMe({bool isRememberMe = true}) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool(rememberKey, isRememberMe);
    return true;
  }

  Future<bool> getRememberMe() async {
    final prefs = await SharedPreferences.getInstance();
    final value = prefs.getBool(rememberKey);
    if (value == true) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> setAnswers(
      {required String surveyId, required Answers answer}) async {
    final prefs = await SharedPreferences.getInstance();
    final data = prefs.getString(surveyId);
    if (data == null) {
      List<Answers> answers = [answer];
      await prefs.setString(
          surveyId,
          jsonEncode(RequestSubmitAnswers(surveyId: surveyId, answers: answers)
              .toJson()));

      return true;
    }

    final jsonData = jsonDecode(data);

    bool findData = false;

    for (int i = 0; i < jsonData['answers']!.length; i++) {
      if (jsonData['answers'][i]['question_id'] == answer.questionId) {
        jsonData['answers'][i] = answer;
        findData = true;
        break;
      }
    }

    if (!findData) {
      jsonData['answers'].add(answer);
    }

    prefs.setString(surveyId, jsonEncode(jsonData));
    return true;
  }

  Future<dynamic> getAnswers({required String surveyId}) async {
    final prefs = await SharedPreferences.getInstance();
    final data = prefs.getString(surveyId);
    final jsonData = json.decode(data!);
    return jsonData;
  }

  Future<dynamic> getAnswer(
      {required String surveyId, required String questionId}) async {
    final prefs = await SharedPreferences.getInstance();
    final data = prefs.getString(surveyId);
    if (data == null) {
      return;
    }
    final jsonData = json.decode(data);
    for (int i = 0; i < jsonData['answers'].length; i++) {
      if (jsonData['answers'][i]['question_id'] == questionId) {
        return jsonData['answers'][i];
      }
    }
  }

  Future<bool> resetAnswer({required String surveyId}) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove(surveyId);
    return true;
  }

  Future<bool> deletePreferences() async {
    const secureStorage = FlutterSecureStorage();
    final prefs = await SharedPreferences.getInstance();
    secureStorage.deleteAll();
    prefs.clear();
    return true;
  }
}
