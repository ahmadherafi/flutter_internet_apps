import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TextFieldWidget extends StatelessWidget {
  final void Function(String) onChange;
  final TextInputType keyboardType;
  final String hint;
  final String? Function(String?)? validate;
  final bool? obscure;
  final String? initValue;
  final TextInputAction? textInputAction;
  final double? height;
  final Widget? suffix;
  final Widget? prefix;
  final int? maxLines;
  final String? suffixText;
  final bool? showShadow;
  final bool? isShowEye;
  final double? width;

  const TextFieldWidget(
      {super.key,
      required this.onChange,
      required this.keyboardType,
      required this.hint,
      required this.validate,
      this.initValue,
      this.obscure = false,
      this.textInputAction,
      this.height,
      this.suffix,
      this.prefix,
      this.maxLines,
      this.suffixText,
      this.showShadow = true,
      this.isShowEye = false,
      this.width});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          boxShadow: showShadow!
              ? [
                  BoxShadow(
                    offset: const Offset(0, 8),
                    blurRadius: 16,
                    spreadRadius: 0,
                    color: const Color(0xff000000).withOpacity(0.2),
                  ),
                ]
              : [],
          borderRadius: BorderRadius.circular(5)),
      transformAlignment: Alignment.topLeft,
      width: width ?? Get.width,
      height: height ?? 50,
      child: ValueBuilder<bool>(
          initialValue: false,
          builder: (bool? value, toggle) {
            return TextFormField(
              textInputAction: textInputAction,
              initialValue: initValue ?? '',
              autovalidateMode: AutovalidateMode.onUserInteraction,
              obscureText: obscure! ? !value! : false,
              validator: validate,
              cursorColor: Colors.blue,
              style: const TextStyle(decorationThickness: 0, fontSize: 14

                  // height: 1.6,
                  ),
              onChanged: onChange,
              maxLines: maxLines ?? 1,
              keyboardType: keyboardType,
              decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  suffixText: suffixText,
                  alignLabelWithHint: true,
                  prefixIcon: prefix,
                  prefixIconConstraints: const BoxConstraints(maxWidth: 55, maxHeight: 55),
                  suffixIcon: suffix,
                  suffixIconConstraints: const BoxConstraints(maxHeight: 30),
                  isDense: true,
                  errorStyle: const TextStyle(
                    height: 0.1,
                    fontSize: 10,
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.black),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  disabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.black),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  labelText: hint,
                  hintStyle: const TextStyle(
                    color: Colors.black,
                  ),
                  border: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.black),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.black),
                    borderRadius: BorderRadius.circular(5),
                  )),
            );
          }),
    );
  }
}
