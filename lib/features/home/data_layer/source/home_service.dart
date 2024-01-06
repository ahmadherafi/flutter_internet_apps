import 'package:flutter_internet_apps/core/api/end_point.dart';
import 'package:flutter_internet_apps/core/network/http.dart';
import 'package:flutter_internet_apps/features/home/data_layer/model/group.dart';

class HomeService {
  Future<List<AllGroupsModel>> getGroups() async {
    Request request = Request(
      EndPoint.groups,
      RequestMethod.get,
      authorized: true,
    );
    Map<String, dynamic> response = await request.sendRequest();

    return AllGroupsModel.fromJsonList(response);
  }
}
