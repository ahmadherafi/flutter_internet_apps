import 'package:flutter_internet_apps/features/home/data_layer/model/group.dart';
import 'package:flutter_internet_apps/features/home/data_layer/source/home_service.dart';
import 'package:get/state_manager.dart';
import 'package:rx_future/rx_future.dart';

class HomeController extends GetxController {
  RxFuture<List<AllGroupsModel>> groupsState = RxFuture(<AllGroupsModel>[]);
  HomeService homeService = HomeService();

  Future<void> getGroups() async {
    await groupsState.observe((p0) async {
      return await homeService.getGroups();
    });
  }
}
