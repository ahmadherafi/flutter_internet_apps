import 'package:flutter_internet_apps/features/file/data_layer/models/file.dart';
import 'package:flutter_internet_apps/features/file/data_layer/source/file_service.dart';
import 'package:get/state_manager.dart';
import 'package:rx_future/rx_future.dart';

class FileController extends GetxController {
  FileService fileService = FileService();
  RxFuture<List<FileModel>> getFileState = RxFuture([]);

  Future<void> getFile(int groupId) async {
    await getFileState.observe((p0) async {
      return await fileService.getFile(groupId);
    });
  }
}
