import 'package:flutter/material.dart';
import 'package:flutter_internet_apps/common/extensions/widget_extension.dart';
import 'package:flutter_internet_apps/common/widgets/loader.dart';
import 'package:get/state_manager.dart';
import 'package:rx_future/rx_future.dart';

class RxViewer extends StatelessWidget {
  final RxFuture rxFuture;
  final Widget Function() child;
  const RxViewer({
    super.key,
    required this.rxFuture,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (rxFuture.loading) {
        return const LoaderWidget().center();
      } else {
        return child();
      }
    });
  }
}
