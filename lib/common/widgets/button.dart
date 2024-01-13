import 'package:flutter/material.dart';
import 'package:flutter_internet_apps/common/widgets/loader.dart';
import 'package:flutter_internet_apps/common/widgets/text.dart';
import 'package:get/get.dart';
import 'package:get/utils.dart';

class ButtonWidget extends StatelessWidget {
  final double? width;
  final double? height;
  final String title;
  final void Function()? onTap;
  final bool? isLoading;
  final Color? color;

  const ButtonWidget({
    super.key,
    this.height,
    this.width,
    required this.title,
    required this.onTap,
    this.isLoading = false,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: width ?? Get.width,
        height: height ?? 50,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: color ?? Colors.black,
        ),
        child: isLoading!
            ? Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const LoaderWidget(
                    height: 15,
                    width: 15,
                    color: Colors.white,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  TextWidget(title),
                ],
              )
            : TextWidget(title),
      ),
    );
  }
}
