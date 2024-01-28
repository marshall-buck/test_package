import 'dart:convert';

import 'file_service.dart';

class FakeData {
  Map? data;

  Future<void> init(FileService fileService) async {
    final String contents = await fileService.loadData(fileName: 'test.json');
    data = jsonDecode(contents);
  }
}
