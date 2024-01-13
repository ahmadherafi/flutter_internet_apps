class MyAppointmentModel {
  int id;
  int fileId;
  String startTime;
  File file;

  MyAppointmentModel({
    required this.id,
    required this.fileId,
    required this.startTime,
    required this.file,
  });

  factory MyAppointmentModel.fromJson(Map<String, dynamic> json) => MyAppointmentModel(
        id: json["id"],
        fileId: json["file_id"],
        startTime: json["start_time"],
        file: File.fromJson(
          json["file"],
        ),
      );

  static List<MyAppointmentModel> fromJsonList(Map<String, dynamic> json) {
    List<MyAppointmentModel> list = [];
    json["data"].forEach(
      (element) => list.add(
        MyAppointmentModel.fromJson(element),
      ),
    );
    return list;
  }
}

class File {
  int id;
  String name;
  int groupId;

  File({
    required this.id,
    required this.name,
    required this.groupId,
  });

  factory File.fromJson(Map<String, dynamic> json) => File(
        id: json["id"],
        name: json["name"],
        groupId: json["group_id"],
      );
}
