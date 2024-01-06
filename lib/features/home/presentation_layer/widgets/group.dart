import 'package:flutter/material.dart';
import 'package:flutter_internet_apps/common/widgets/text.dart';
import 'package:flutter_internet_apps/features/home/data_layer/model/group.dart';
import 'package:get/get.dart';
import 'package:get/utils.dart';

class GroupWidget extends StatelessWidget {
  final GroupModel groupModel;
  const GroupWidget({super.key, required this.groupModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      width: Get.width * .5,
      height: 70,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.blue,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Container(
            width: Get.width * .2,
            height: 30,
            alignment: Alignment.center,
            decoration: const BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(8),
              ),
            ),
            child: TextWidget(groupModel.type, fontSize: 14),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextWidget("${groupModel.name}   "),
              Icon(
                Icons.folder,
                color: Colors.white,
                size: 30,
              ),
            ],
          )
        ],
      ),
    );
  }
}
