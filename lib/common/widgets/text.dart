import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  final String title;
  final Color? color;
  final double? fontSize;
  const TextWidget(this.title, {super.key, this.color, this.fontSize});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        color: color ?? Colors.white,
        fontSize: fontSize ?? 16,
      ),
    );
  }
}
