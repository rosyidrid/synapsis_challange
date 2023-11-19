import 'package:flutter/material.dart';

class MyElevatedButton extends StatelessWidget {
  final BorderRadiusGeometry? borderRadius;
  final double? width;
  final double height;
  final Gradient gradient;
  final VoidCallback? onPressed;
  final Widget child;
  final bool onlyStroke;
  final Color? color;

  const MyElevatedButton(
      {Key? key,
      required this.onPressed,
      required this.child,
      this.borderRadius,
      this.width,
      this.color,
      this.height = 40.0,
      this.gradient = const LinearGradient(colors: []),
      this.onlyStroke = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final borderRadius = this.borderRadius ?? BorderRadius.circular(0);
    return SizedBox(
        width: width,
        height: height,
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: onlyStroke ? Colors.transparent : color,
            shadowColor: Colors.transparent,
            shape: RoundedRectangleBorder(
                borderRadius: borderRadius,
                side: onlyStroke ? BorderSide(color: color!) : BorderSide.none),
          ),
          child: child,
        ));
  }
}
