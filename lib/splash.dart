import 'package:flutter/material.dart';
import 'package:synapsis_challange/data/sharedPreferences/user_preferences.dart';
import 'package:synapsis_challange/domain/common/base_state_widget.dart';
import 'package:synapsis_challange/domain/common/base_view_model.dart';
import 'package:synapsis_challange/domain/usecase/usecase.dart';
import 'package:synapsis_challange/routes.dart';
import 'package:synapsis_challange/utils/check_is_error.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends BaseStateWidget<SplashScreen, BaseViewModel> {
  late Usecase usecase;
  UserPreferences userPreferences = UserPreferences();
  @override
  void initState() {
    super.initState();
    usecase = Usecase();
    checkIsLogin();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }

  void checkIsLogin() async {
    final isLogin = await userPreferences.getRememberMe();
    if (isLogin == true) {
      await userPreferences.getToken().then((value) async {
        if (value != null) {
          final result = await usecase.doGetAllSurvey();
          if (checkIsNotError(result)) {
            navigatePage(surveyScreen, clearBackStack: true);
          }
        }
      });
    } else {
      userPreferences.deletePreferences();
      navigatePage(loginScreen, clearBackStack: true);
    }
  }
}
