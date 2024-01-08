import 'package:flutter_internet_apps/core/api/end_point.dart';
import 'package:flutter_internet_apps/core/network/http.dart';
import 'package:flutter_internet_apps/features/auth/data_layer/models/login_response.dart';
import 'package:flutter_internet_apps/features/group/data_layer/models/add_group.dart';
import 'package:flutter_internet_apps/features/group/data_layer/models/user.dart';
import 'package:flutter_internet_apps/features/home/data_layer/model/group.dart';

class GroupService {
  Future<List<AllGroupsModel>> getPrivateGroup() async {
    Request request = Request(
      EndPoint.filterGroup,
      RequestMethod.get,
      authorized: true,
      queryParams: {'type': 'private'},
    );
    Map<String, dynamic> response = await request.sendRequest();

    return AllGroupsModel.fromJsonList(response);
  }

  Future<List<AllGroupsModel>> getPublicGroup() async {
    Request request = Request(
      EndPoint.filterGroup,
      RequestMethod.get,
      authorized: true,
      queryParams: {'type': 'public'},
    );
    Map<String, dynamic> response = await request.sendRequest();

    return AllGroupsModel.fromJsonList(response);
  }

  Future<List<AllGroupsModel>> myGroup() async {
    Request request = Request(
      EndPoint.myGroup,
      RequestMethod.get,
      authorized: true,
    );
    Map<String, dynamic> response = await request.sendRequest();

    return AllGroupsModel.fromJsonList(response);
  }

  Future<void> addGroup(AddGroupModel addGroupModel) async {
    Request request = Request(
      EndPoint.addGroup,
      RequestMethod.post,
      authorized: true,
      body: addGroupModel.toJson(),
      isFormData: true,
    );
    Map<String, dynamic> response = await request.sendRequest();
  }

  Future<void> deleteGroup(int id) async {
    Request request = Request(
      EndPoint.deleteGroup(id),
      RequestMethod.delete,
      authorized: true,
    );
    Map<String, dynamic> response = await request.sendRequest();
  }

  Future<void> addMemberToGroup(String email, int groupId) async {
    Request request = Request(EndPoint.joinUserToGroup, RequestMethod.post,
        queryParams: {
          'group_id': groupId,
        },
        body: {'email': email},
        authorized: true);
    Map<String, dynamic> response = await request.sendRequest();
  }

  Future<List<User>> getAllUserForGroup(int id) async {
    Request request = Request(
      EndPoint.getUserForGroup(id),
      RequestMethod.get,
      authorized: true,
    );
    Map<String, dynamic> response = await request.sendRequest();

    return User.fromJsonList(response);
  }

  Future<void> deleteUserFromGroup(int userId, int groupId) async {
    Request request = Request(EndPoint.deleteUserFormGroup, RequestMethod.get, authorized: true, queryParams: {
      'user_id': userId,
      'group_id': groupId,
    });
    Map<String, dynamic> response = await request.sendRequest();
  }
}
