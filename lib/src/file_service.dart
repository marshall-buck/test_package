import 'package:path/path.dart' as p;
import 'package:flutter/services.dart' show rootBundle;

/// File service class.
class FileService {
  final pathToFiles = p.join('packages', 'test_package', 'lib', 'data');
  // final pathToFiles = p.join('lib', 'data');

  /// Opens a file from [fileName].  Returns the contents as a [String].
  Future<String> loadData({required final String fileName}) async {
    final String contents =
        await rootBundle.loadString(p.join(pathToFiles, fileName));

    return contents;
  }
}
