import 'package:flutter/material.dart';
import 'package:synapsis_challange/constant/color.dart';
import 'package:synapsis_challange/ui/widget/my_elevated_button.dart';

class DefaultButton {
  static Widget primaryButton(
      BuildContext context, String text, VoidCallback callback,
      {bool isDisabled = false,
      bool isLoading = false,
      Color? loadingColor,
      Color? color = primary,
      double? fontSize,
      Color? fontColor,
      bool wrapWidth = false,
      double height = 40,
      bool onlyStroke = false,
      double? width,
      FontWeight? fontWeight,
      double? radius = 4,
      Widget? icon,
      bool? leftIcon = false}) {
    return SizedBox(
      width: wrapWidth ? null : double.infinity,
      height: height,
      child: MyElevatedButton(
          onlyStroke: onlyStroke,
          width: width,
          height: height,
          onPressed: isDisabled
              ? null
              : () {
                  if (!isLoading) callback.call();
                },
          borderRadius: BorderRadius.circular(radius!),
          color: color,
          child: !isLoading
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (leftIcon == true)
                      if (icon != null) ...[
                        icon,
                        const SizedBox(
                          width: 10,
                        )
                      ],
                    Text(text,
                        style: TextStyle(
                            color: onlyStroke ? primary : fontColor,
                            fontWeight: fontWeight ?? FontWeight.w600,
                            fontSize: fontSize ?? 15,
                            letterSpacing: 0.2)),
                    if (leftIcon != true)
                      if (icon != null) ...[
                        const SizedBox(width: 10),
                        icon,
                      ]
                  ],
                )
              : SizedBox(
                  width: 20,
                  height: 20,
                  child: CircularProgressIndicator(
                    backgroundColor: Colors.black,
                    color: loadingColor ?? Colors.white,
                  ),
                )),
    );
  }
}
