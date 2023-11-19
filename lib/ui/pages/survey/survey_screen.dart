import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:synapsis_challange/constant/color.dart';
import 'package:synapsis_challange/domain/common/base_state_widget.dart';
import 'package:synapsis_challange/routes.dart';
import 'package:synapsis_challange/ui/pages/survey/survey_navigator.dart';
import 'package:synapsis_challange/ui/pages/survey/survey_view_model.dart';
import 'package:synapsis_challange/ui/widget/list_survey.dart';
import 'package:synapsis_challange/utils/covert_date.dart';

class SurveyScreen extends StatefulWidget {
  const SurveyScreen({super.key});

  @override
  State<SurveyScreen> createState() => _SurveyScreenState();
}

class _SurveyScreenState extends BaseStateWidget<SurveyScreen, SurveyViewModel>
    implements SurveyNavigator {
  @override
  void initState() {
    viewModel = SurveyViewModel().setView(this) as SurveyViewModel;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<SurveyViewModel>(
      create: (context) => viewModel,
      child: Consumer<SurveyViewModel>(
        builder: (context, value, child) => viewModel.response.data == null
            ? const Scaffold(
                body: Center(child: CircularProgressIndicator()),
              )
            : Scaffold(
                appBar: AppBar(
                  backgroundColor: white,
                  shadowColor: transparent,
                  title: const Text("Halaman Survei",
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          color: black,
                          fontSize: 15,
                          fontWeight: FontWeight.w400)),
                  actions: [
                    IconButton(
                        onPressed: () {
                          viewModel.logOut();
                        },
                        icon: const Icon(
                          Icons.logout,
                          color: primary,
                        ))
                  ],
                ),
                body: SingleChildScrollView(
                    child: Center(
                        child: Column(
                  children: viewModel.response.data == null
                      ? []
                      : buildList(data: viewModel.response.data),
                ))),
              ),
      ),
    );
  }

  List<Widget> buildList({dynamic data}) {
    List<Widget> listSurvey = [];
    for (int i = 0; i < data.length; i++) {
      listSurvey.add(ListSurvey(
          surveyName: data[i].surveyName,
          createdDate: converDate(data[i].createdAt),
          callBack: () {
            navigateToQuestionScreen(id: data[i].id);
          }));
      listSurvey.add(const SizedBox(
        height: 10,
      ));
    }

    return listSurvey;
  }

  @override
  navigateToQuestionScreen({dynamic id}) {
    navigatePage(questionScreen, clearBackStack: false, arguments: id);
  }

  @override
  navigateToLoginScreen() {
    navigatePage(loginScreen, clearBackStack: true);
  }
}
