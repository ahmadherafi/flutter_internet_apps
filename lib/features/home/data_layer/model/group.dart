class AllGroupsModel {
  int userId;
  int groupId;
  GroupModel groupModel;

  AllGroupsModel({
    required this.groupId,
    required this.userId,
    required this.groupModel,
  });

  factory AllGroupsModel.fromJson(Map<String, dynamic> json) => AllGroupsModel(
        groupId: json["group_id"] ?? 0,
        userId: json["user_id"] ?? 0,
        groupModel: GroupModel.fromJson(
          json["user_id"] == null ? json : json["group"],
        ),
      );

  static List<AllGroupsModel> fromJsonList(Map<String, dynamic> json) {
    List<AllGroupsModel> groups = [];
    json["data"].forEach(
      (element) => groups.add(
        AllGroupsModel.fromJson(element),
      ),
    );
    return groups;
  }
}

class GroupModel {
  int id;
  String name;
  String type;
  GroupModel({
    required this.id,
    required this.name,
    required this.type,
  });

  factory GroupModel.fromJson(Map<String, dynamic> json) => GroupModel(
        id: json["id"],
        name: json["name"],
        type: json["type"],
      );
}
