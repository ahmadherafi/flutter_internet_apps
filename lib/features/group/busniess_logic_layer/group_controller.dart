import 'package:flutter_internet_apps/core/routing/routing_manager.dart';
import 'package:flutter_internet_apps/features/group/data_layer/models/add_group.dart';
import 'package:flutter_internet_apps/features/group/data_layer/models/user.dart';
import 'package:flutter_internet_apps/features/group/data_layer/source/group_service.dart';
import 'package:flutter_internet_apps/features/home/data_layer/model/group.dart';
import 'package:get/state_manager.dart';
import 'package:rx_future/rx_future.dart';

class GroupController extends GetxController {
  GroupService groupService = GroupService();
  RxFuture<List<AllGroupsModel>> privateGroupState = RxFuture([]);

  Future<void> getPrivateGroup() async {
    Future.delayed(
      Duration.zero,
      () async {
        await privateGroupState.observe((p0) async {
          return groupService.getPrivateGroup();
        });
      },
    );
  }

  RxFuture<List<AllGroupsModel>> publicGroupState = RxFuture([]);

  Future<void> getPublicGroup() async {
    Future.delayed(
      Duration.zero,
      () async {
        await publicGroupState.observe((p0) async {
          return groupService.getPublicGroup();
        });
      },
    );
  }

  RxFuture<List<AllGroupsModel>> myGroupState = RxFuture([]);

  Future<void> myGroup() async {
    Future.delayed(
      Duration.zero,
      () async {
        await myGroupState.observe((p0) async {
          return groupService.myGroup();
        });
      },
    );
  }

  Rx<AddGroupModel> addGroupModel = AddGroupModel.zero().obs;
  RxFuture<void> addGroupState = RxFuture(null);

  Future<void> addGroup() async {
    await addGroupState.observe(
      (p0) async {
        await groupService.addGroup(addGroupModel.value);
      },
      onSuccess: (p0) {
        myGroup();
        RoutingManager.back();
      },
    );
  }

  RxFuture<void> deleteGroupState = RxFuture(null);

  Future<void> deleteGroup(int id) async {
    await deleteGroupState.observe(
      (p0) async {
        await groupService.deleteGroup(id);
      },
      onSuccess: (p0) {
        myGroup();
      },
    );
  }

  RxFuture<void> joinUserToGroupState = RxFuture(null);
  String email = '';

  Future<void> joinUserToGroup(int groupId) async {
    await joinUserToGroupState.observe(
      (p0) async {
        await groupService.addMemberToGroup(email, groupId);
      },
      onSuccess: (p0) {
        RoutingManager.back();
      },
    );
  }

  RxFuture<List<User>> getUserState = RxFuture([]);
  Future<void> getUserForGroup(int id) async {
    await getUserState.observe((p0) async {
      return groupService.getAllUserForGroup(id);
    });
  }

  RxFuture<void> deleteUserFormGroupState = RxFuture(null);

  Future<void> deleteUserFormGroup(int userId, int groupId) async {
    await deleteUserFormGroupState.observe(
      (p0) async {
        await groupService.deleteUserFromGroup(userId, groupId);
      },
      onSuccess: (p0) {
        getUserForGroup(groupId);
        RoutingManager.back();
      },
    );
  }
}
