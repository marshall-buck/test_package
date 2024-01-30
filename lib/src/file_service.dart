import 'package:flutter/services.dart' show rootBundle;

class FileService {
  static const String _dataPath = 'packages/test_package/lib/data';
  static const String _fileNameManifest = 'file_manifest.txt';

  /// Opens a file from [fileName] located in the package's assets.
  /// Returns the contents as a [String].
  Future<String> loadData({required String fileName}) async {
    final fileHash = await _getFileHash();
    final String assetPath = '$_dataPath/${fileHash}_$fileName';
    final String contents;

    try {
      contents = await rootBundle.loadString(assetPath);
    } catch (e) {
      // If there's an error loading the asset, print the error and the attempted path
      print('Error loading file at $assetPath: $e');
      rethrow;
    }

    return contents;
  }

  Future<String> _getFileHash() async {
    try {
      final String manifest =
          await rootBundle.loadString('$_dataPath/$_fileNameManifest');
      return manifest;
    } catch (e) {
      // If there's an error loading the asset, print the error and the attempted path
      print('Error loading manifest at $_dataPath/$_fileNameManifest: $e');
      rethrow;
    }
  }

  ///Checks data directory for file names, and creates the hash prefix for the file name.
  // String _getFileHash() {
  //   final path = p.join('lib', 'data');
  //   final Directory dataDir = Directory(path);
  //   final List<FileSystemEntity> files = dataDir.listSync(followLinks: false);
  //   if (files.isEmpty) {
  //     throw FileSystemException('getFileHash() - No files found', path);
  //   }
  //   return files[0].path.split('/').last.split('_').first;
  // }
}
