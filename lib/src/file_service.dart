import 'package:path/path.dart' as p;
import 'package:flutter/services.dart' show rootBundle;

// class FileService {
//   // Correct the path format to use forward slashes for asset loading
//   // final pathToFiles = 'packages/test_package/lib/data';
//   final pathToFiles = p.join('packages', 'test_package', 'lib', 'data');

//   /// Opens a file from [fileName].  Returns the contents as a [String].
//   Future<String> loadData({required final String fileName}) async {
//     // Ensure the use of forward slashes in the asset path
//     final String assetPath =
//         p.join(pathToFiles, fileName).replaceAll(r'\', '/');
//     final String contents = await rootBundle.loadString(assetPath);

//     return contents;
//   }
// }

class FileService {
  /// Opens a file from [fileName] located in the package's assets.
  /// Returns the contents as a [String].
  Future<String> loadData({required String fileName}) async {
    // Reference assets using the 'packages/packageName' scheme
    final String assetPath = 'packages/test_package/data/$fileName';
    final String contents = await rootBundle.loadString(assetPath);

    return contents;
  }
}
