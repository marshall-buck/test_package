// import 'package:path/path.dart' as p;
// import 'package:flutter/services.dart' show rootBundle;

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
import 'dart:io';
import 'dart:async';
import 'dart:isolate';
import 'package:path/path.dart' as p;

class FileService {
  /// Loads data from a file within the package.
  ///
  /// The [fileName] parameter specifies the name of the file to load.
  Future<String> loadData({required String fileName}) async {
    // Resolve the 'package:' URI to an absolute file path.
    final Uri? packageUri = await Isolate.resolvePackageUri(
      Uri.parse('package:test_package/data/$fileName'),
    );

    if (packageUri == null) {
      throw FileSystemException('Unable to resolve package URI for $fileName');
    }

    // Use `path.join` to construct the file path in a platform-agnostic manner.
    final String filePath = p.join(packageUri.toFilePath());

    final File file = File(filePath);
    if (!file.existsSync()) {
      throw FileSystemException('File not found', filePath);
    }

    return file.readAsString();
  }
}