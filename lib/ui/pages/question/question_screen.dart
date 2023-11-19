import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:synapsis_challange/constant/color.dart';
import 'package:synapsis_challange/domain/common/base_state_widget.dart';
import 'package:synapsis_challange/domain/models/request/login/request_submit_answer.dart';
import 'package:synapsis_challange/routes.dart';
import 'package:synapsis_challange/ui/pages/question/question_navigator.dart';
import 'package:synapsis_challange/ui/pages/question/question_view_model.dart';
import 'package:synapsis_challange/ui/widget/default_button.dart';
import 'package:synapsis_challange/ui/pages/question/widget/question_number_popup.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({super.key});

  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState
    extends BaseStateWidget<QuestionScreen, QuestionViewModel>
    implements QuestionNavigator {
  @override
  void initState() {
    viewModel = QuestionViewModel().setView(this) as QuestionViewModel;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)?.settings.arguments;
    viewModel.getDetailDataSurvey(id: args.toString());
    Size size = MediaQuery.of(context).size;

    return ChangeNotifierProvider<QuestionViewModel>(
      create: (context) => viewModel,
      child: Consumer<QuestionViewModel>(
        builder: (context, value, child) => viewModel.response.data == null
            ? const Scaffold(
                body: Center(child: CircularProgressIndicator()),
              )
            : Scaffold(
                appBar: AppBar(
                  automaticallyImplyLeading: false,
                  shadowColor: transparent,
                  backgroundColor: white,
                  actions: [
                    const SizedBox(
                      width: 22,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        height: 10,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            border: Border.all(color: primary),
                            borderRadius: BorderRadius.circular(4)),
                        child: const Text(
                          "45 Seconds Left",
                          style: TextStyle(
                              color: primary,
                              fontSize: 14,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                    ),
                    const Spacer(),
                    Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: DefaultButton.primaryButton(context,
                            "${viewModel.index + 1}/${viewModel.question.questions?.length}",
                            () {
                          PopUp.questionNumberPopUp(context,
                              data: viewModel.question.questions,
                              isActive: viewModel.questionActive,
                              viewModel: viewModel);
                        },
                            color: black,
                            wrapWidth: true,
                            leftIcon: true,
                            icon: const Icon(
                              Icons.list_alt,
                              size: 20,
                            ))),
                    const SizedBox(
                      width: 22,
                    ),
                  ],
                ),
                body: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
                  child: Center(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${viewModel.question.surveyName}",
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w700),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        height: 50,
                        child: Text(
                            "${viewModel.question.questions?[viewModel.index].questionNumber}. ${viewModel.question.questions?[viewModel.index].questionName}",
                            style: const TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w400)),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text("Answer",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w400)),
                      const Divider(),
                      if (viewModel.response.message != null)
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: buildAnswer(
                            answers: viewModel
                                .question.questions?[viewModel.index].options,
                            inputType: viewModel
                                .question.questions?[viewModel.index].inputType,
                          ),
                        )
                      else
                        const SizedBox()
                    ],
                  )),
                ),
                floatingActionButtonLocation:
                    FloatingActionButtonLocation.centerFloat,
                floatingActionButton: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      DefaultButton.primaryButton(context, "Back", () {
                        if (viewModel.index == 0) {
                          Navigator.pop(context);
                        }
                        viewModel.backTaped();
                      },
                          wrapWidth: true,
                          onlyStroke: true,
                          width: size.width * 0.35),
                      DefaultButton.primaryButton(context, "Next", () {
                        if (viewModel.index < 50) {
                          viewModel.nextTaped();
                        }
                      }, wrapWidth: true, width: size.width * 0.50),
                    ]),
              ),
      ),
    );
  }

  List<Widget> buildAnswer({dynamic answers, String? inputType}) {
    List<Widget> options = [];
    if (inputType == "radio_button") {
      for (int i = 0; i < answers.length; i++) {
        options.add(RadioListTile(
          activeColor: primary,
          title: Text("${answers[i].optionName}"),
          value: answers[i].value,
          groupValue: viewModel.selectedValue,
          onChanged: (value) {
            viewModel.setSelectedValue(
                selected: value,
                value: Answers(
                    questionId: answers[i].questionId, answer: answers[i].id),
                surveyId: viewModel.response.data!.id!);
          },
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          visualDensity: VisualDensity.compact,
          contentPadding: const EdgeInsets.symmetric(horizontal: 0),
        ));
      }
    } else {
      options.add(TextFormField(
        controller: viewModel.textType,
        onChanged: (value) async {
          viewModel.setTextValue(surveyId: viewModel.response.data!.id!);
        },
      ));
    }

    return options;
  }

  @override
  navigateToSurveyScreen() {
    navigatePage(surveyScreen, clearBackStack: true);
  }
}
