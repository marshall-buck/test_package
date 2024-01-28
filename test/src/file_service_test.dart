import 'package:test/test.dart';
import 'package:test_package/src/file_service.dart';
import 'dart:io';

void main() {
  group('FileService', () {
    final fileService = FileService();

    test('loadData returns file contents as string', () async {
      final String fileName = 'test.json';

      final String contents = await fileService.loadData(fileName: fileName);
      expect(contents, isA<String>());
      expect(contents, isNotEmpty);
    });

    test('loadData throws exception if file does not exist', () async {
      final String fileName = 'non_existent_file.txt';

      expect(
        fileService.loadData(fileName: fileName),
        throwsA(isA<FileSystemException>()),
      );
    });
  });
}
