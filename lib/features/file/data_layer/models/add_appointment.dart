class AddAppointmentModel {
  List<int> fileIds;

  AddAppointmentModel({
    required this.fileIds,
  });

  factory AddAppointmentModel.zero() => AddAppointmentModel(
        fileIds: [],
      );

  Map<String, dynamic> toJson() {
    Map<String, dynamic> result = {};

    for (int i = 0; i < fileIds.length; i++) {
      result["file_id[${i + 1}]"] = fileIds[i];
    }
    return result;
  }
}
