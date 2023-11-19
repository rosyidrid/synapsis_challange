import 'package:flutter/material.dart';
import 'package:need_resume/need_resume.dart';
import 'package:synapsis_challange/domain/common/base_navigator.dart';
import 'package:synapsis_challange/domain/common/base_view_model.dart';

class BaseStateWidget<STATE extends StatefulWidget,
        VIEWMODEL extends BaseViewModel> extends ResumableState<STATE>
    with BaseNavigator {
  late VIEWMODEL viewModel;

  @override
  Widget build(BuildContext context) {
    throw UnimplementedError();
  }

  void navigatePage(String routeName,
      {Object? arguments, bool clearBackStack = false}) {
    // final extractedRouteName = extractRouteName(routeName);
    clearBackStack
        ? Navigator.pushNamedAndRemoveUntil(
            context,
            routeName,
            (r) => false,
            arguments: arguments,
          )
        : pushNamed(
            context,
            routeName,
            arguments: arguments,
          );
  }
}
