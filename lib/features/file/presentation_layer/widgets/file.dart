import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_internet_apps/common/extensions/widget_extension.dart';
import 'package:flutter_internet_apps/common/widgets/text.dart';
import 'package:flutter_internet_apps/features/file/data_layer/models/file.dart';

class FileWidget extends StatelessWidget {
  final FileModel fileModel;
  const FileWidget({
    super.key,
    required this.fileModel,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextWidget(
            fileModel.user.name,
            color: Colors.black,
          ),
          TextWidget(
            fileModel.createdAt,
            color: Colors.black,
          ),
          const Icon(
            Icons.picture_as_pdf_sharp,
            size: 75,
          ).center(),
          TextWidget(
            fileModel.name,
            color: Colors.black,
          ),
        ],
      ),
    );
  }
}
