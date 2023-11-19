import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:synapsis_challange/constant/color.dart';

class FormFieldContainer extends StatelessWidget {
  const FormFieldContainer(
      {required this.controller,
      this.title,
      this.hint,
      this.hintColor = grey,
      this.cursorColor = primary,
      this.suffixIcon,
      this.suffix,
      this.prefixIcon,
      this.prefix,
      this.inputFormatters,
      this.inputType = TextInputType.text,
      this.textInputAction,
      this.borderColor = grey,
      this.focusedBorderColor = primary,
      this.obscureText = false,
      this.onTap,
      super.key});

  final String? title;
  final TextEditingController controller;
  final String? hint;
  final Color hintColor;
  final Color cursorColor;
  final Widget? suffixIcon;
  final String? suffix;
  final Widget? prefixIcon;
  final String? prefix;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputType inputType;
  final TextInputAction? textInputAction;
  final Color focusedBorderColor;
  final Color borderColor;
  final bool obscureText;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        textInputAction: textInputAction,
        controller: controller,
        cursorColor: cursorColor,
        style: const TextStyle(fontSize: 15),
        obscureText: obscureText,
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
            borderRadius: const BorderRadius.all(Radius.circular(4)),
            borderSide: BorderSide(color: focusedBorderColor),
          ),
          contentPadding:
              const EdgeInsets.symmetric(vertical: 0.0, horizontal: 15),
          border: OutlineInputBorder(
            borderRadius: const BorderRadius.all(Radius.circular(4)),
            borderSide: BorderSide(color: borderColor),
          ),
          suffixIcon: suffixIcon,
        ));
  }
}
