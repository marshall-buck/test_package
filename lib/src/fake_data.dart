import 'dart:convert';

import 'file_service.dart';

class FakeData {
  Map? data;

  Future<void> init(FileService fileService) async {
    try {
      final String contents = await fileService.loadData(fileName: 'test.json');
      data = jsonDecode(contents);
    } catch (e) {
      print('Error loading data FakeData.init(): $e');
    }
  }
}
