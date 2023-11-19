import 'package:synapsis_challange/ui/pages/login/login_screen.dart';
import 'package:synapsis_challange/ui/pages/question/question_screen.dart';
import 'package:synapsis_challange/splash.dart';
import 'package:synapsis_challange/ui/pages/survey/survey_screen.dart';

const String loginScreen = '/login-screen';
const String surveyScreen = '/survey-screen';
const String questionScreen = '/question-screen';
const String splashScreen = '/splash-screen';

final routes = {
  loginScreen: (context) => const LoginScreen(),
  surveyScreen: (context) => const SurveyScreen(),
  questionScreen: (context) => const QuestionScreen(),
  splashScreen:(context) => const SplashScreen()
};
