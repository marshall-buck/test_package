import 'package:test_package/src/fake_data.dart';

import 'file_service.dart';

class DB {
  final FileService fileService = FileService();
  Map? _fakeDataData;
  get fakeDataData => _fakeDataData;

  Future<void> init() async {
    // print('From DB.init: ${fileService.packageUri}');
    final FakeData fakeData = FakeData();
    await fakeData.init(fileService);
    _fakeDataData = fakeData.data;
  }
}
