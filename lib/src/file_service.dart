import 'dart:io';
import 'package:path/path.dart' as p;

import 'package:flutter/services.dart' show rootBundle;

class FileService {
  static const String _dataPath = 'packages/test_package/lib/data';

  get fileHash => _getFileHash();

  /// Opens a file from [fileName] located in the package's assets.
  /// Returns the contents as a [String].
  Future<String> loadData({required String fileName}) async {
    final String assetPath = '$_dataPath/${fileHash}_$fileName';
    final String contents;
    print('LOAD DATA: $assetPath  fileHash: $fileHash');
    try {
      contents = await rootBundle.loadString(assetPath);
    } catch (e) {
      // If there's an error loading the asset, print the error and the attempted path
      print('Error loading asset at $assetPath: $e');
      rethrow;
    }

    return contents;
  }

  ///Checks data directory for file names, and creates the hash prefix for the file name.
  String _getFileHash() {
    final path = p.join('lib', 'data');
    final Directory dataDir = Directory(path);
    final List<FileSystemEntity> files = dataDir.listSync(followLinks: false);
    if (files.isEmpty) {
      throw FileSystemException('getFileHash() - No files found', path);
    }
    return files[0].path.split('/').last.split('_').first;
  }
}
