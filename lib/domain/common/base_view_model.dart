import 'package:flutter/material.dart';
import 'package:synapsis_challange/domain/common/base_navigator.dart';

abstract class BaseViewModel<NV extends BaseNavigator> extends ChangeNotifier{
  NV? view;

  BaseViewModel();

  BaseViewModel setView(NV view){
    this.view = view;
    return this;
  }

  NV? getView(){
    return view;
  }

  @override
  void dispose();
}