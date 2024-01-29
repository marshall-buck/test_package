import 'package:flutter/services.dart' show rootBundle;

class FileService {
  static const String _dataPath = 'packages/test_package/lib/data';

  /// Opens a file from [fileName] located in the package's assets.
  /// Returns the contents as a [String].
  Future<String> loadData({required String fileName}) async {
    final String assetPath = '$_dataPath/$fileName';
    final String contents;
    try {
      contents = await rootBundle.loadString(assetPath);
    } catch (e) {
      // If there's an error loading the asset, print the error and the attempted path
      print('Error loading asset at $assetPath: $e');
      rethrow;
    }

    return contents;
  }
}
