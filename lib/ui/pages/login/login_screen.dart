import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:synapsis_challange/constant/color.dart';
import 'package:synapsis_challange/domain/common/base_state_widget.dart';
import 'package:synapsis_challange/routes.dart';
import 'package:synapsis_challange/ui/pages/login/login_navigator.dart';
import 'package:synapsis_challange/ui/pages/login/login_view_model.dart';
import 'package:synapsis_challange/ui/widget/default_button.dart';
import 'package:synapsis_challange/ui/widget/form_field_container.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends BaseStateWidget<LoginScreen, LoginViewModel>
    implements LoginNavigator {
  @override
  void initState() {
    viewModel = LoginViewModel().setView(this) as LoginViewModel;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<LoginViewModel>(
      create: (context) => viewModel,
      child: Consumer<LoginViewModel>(
          builder: (context, value, child) => Scaffold(
                appBar: AppBar(
                  backgroundColor: white,
                  shadowColor: transparent,
                  title: const Text("Login to Synapsis",
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          color: black,
                          fontSize: 21,
                          fontWeight: FontWeight.w600)),
                ),
                body: Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        const Text(
                          "Email",
                          style: TextStyle(color: grey),
                        ),
                        FormFieldContainer(
                          controller: viewModel.email,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const Text(
                          "Password",
                          style: TextStyle(color: grey),
                        ),
                        FormFieldContainer(
                          controller: viewModel.password,
                          obscureText: viewModel.obscureText,
                          suffixIcon: InkWell(
                            child: viewModel.obscureText
                                ? const Icon(Icons.visibility, color: grey)
                                : const Icon(
                                    Icons.visibility_off,
                                  ),
                            onTap: () {
                              viewModel.isObscure();
                            },
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            Checkbox(
                              visualDensity: VisualDensity.compact,
                              materialTapTargetSize:
                                  MaterialTapTargetSize.shrinkWrap,
                              value: viewModel.rememberMe,
                              side: const BorderSide(color: grey),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                    5.0), // Set border radius
                                // Set border color
                              ),
                              activeColor: primary,
                              onChanged: (value) {
                                viewModel.isRememberMe();
                              },
                            ),
                            const Text("Remember Me",
                                style: TextStyle(
                                    color: grey,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w400))
                          ],
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        DefaultButton.primaryButton(context, "Log In", () {
                          viewModel.login();
                        }),
                        const SizedBox(
                          height: 10,
                        ),
                        const Align(
                          alignment: Alignment.center,
                          child: Text(
                            "or",
                            style: TextStyle(
                                color: primary,
                                fontSize: 15,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        DefaultButton.primaryButton(
                            context, "Finger Print", () {},
                            onlyStroke: true)
                      ],
                    )),
              )),
    );
  }

  @override
  navigateToSurveyScreen() {
    navigatePage(surveyScreen, clearBackStack: true);
  }
}
