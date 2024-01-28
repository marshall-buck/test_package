import 'package:path/path.dart' as p;
import 'package:flutter/services.dart' show rootBundle;

// /// File service class.
// class FileService {
//   final pathToFiles = p.join('packages', 'test_package', 'lib', 'data');
//   // final pathToFiles = p.join('lib', 'data');

//   /// Opens a file from [fileName].  Returns the contents as a [String].
//   Future<String> loadData({required final String fileName}) async {
//     final String contents =
//         await rootBundle.loadString(p.join(pathToFiles, fileName));

//     return contents;
//   }
// }

class FileService {
  // Correct the path format to use forward slashes for asset loading
  // final pathToFiles = 'packages/test_package/lib/data';
  final pathToFiles = p.join('packages', 'test_package', 'lib', 'data');

  /// Opens a file from [fileName].  Returns the contents as a [String].
  Future<String> loadData({required final String fileName}) async {
    // Ensure the use of forward slashes in the asset path
    final String assetPath =
        p.join(pathToFiles, fileName).replaceAll(r'\', '/');
    final String contents = await rootBundle.loadString(assetPath);

    return contents;
  }
}
