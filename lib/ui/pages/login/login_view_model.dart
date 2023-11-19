import 'package:flutter/material.dart';
import 'package:synapsis_challange/data/sharedPreferences/user_preferences.dart';
import 'package:synapsis_challange/domain/common/base_view_model.dart';
import 'package:synapsis_challange/domain/repositories/user_repository.dart';
import 'package:synapsis_challange/domain/usecase/usecase.dart';
import 'package:synapsis_challange/ui/pages/login/login_navigator.dart';
import 'package:synapsis_challange/utils/check_is_error.dart';

class LoginViewModel extends BaseViewModel<LoginNavigator> {
  late Usecase usecase;

  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  UserRepository userRepository = UserRepository();

  UserPreferences userPreferences = UserPreferences();

  bool rememberMe = false;
  bool obscureText = true;

  LoginViewModel() {
    usecase = Usecase();
  }

  Future login() async {
    if (email.text.isEmpty || password.text.isEmpty) {
      return;
    }

    final result =
        await usecase.doLogin(email: email.text, password: password.text);
    if (checkIsNotError(result)) {
      final token = result.keys.first!.token;
      userPreferences.setToken(token!);
      userPreferences.setRememberMe(isRememberMe: rememberMe);
      getView()?.navigateToSurveyScreen();
    }
  }

  void isRememberMe() {
    rememberMe = !rememberMe;
    notifyListeners();
  }

  void isObscure() {
    obscureText = !obscureText;
    notifyListeners();
  }
}
