import 'package:flutter/material.dart';

extension MyExtension on Widget {
  Widget makeSafeArea() {
    return SafeArea(child: this);
  }

  Widget center() => Center(
        child: this,
      );

  Widget expanded(int? flex) => Expanded(
        flex: flex ?? 0,
        child: this,
      );

  Widget padding(EdgeInsets? padding) => Padding(
        padding: padding ?? EdgeInsets.symmetric(vertical: 8, horizontal: 8),
        child: this,
      );
  Widget align({required AlignmentGeometry alignment}) {
    return Align(
      alignment: alignment,
      child: this,
    );
  }

  Widget fittedBox() {
    return FittedBox(
      child: this,
    );
  }

  Widget onTap(VoidCallback onTap) => InkWell(
        onTap: onTap,
        child: this,
      );
  Widget onDoubleTap(VoidCallback onDoubleTap) {
    return GestureDetector(
      onDoubleTap: onDoubleTap,
      child: this,
    );
  }

  Widget onLongPress(VoidCallback onLongPress) {
    return GestureDetector(
      onLongPress: onLongPress,
      child: this,
    );
  }
}
