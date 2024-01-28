import 'package:test_package/test_package.dart';

void main() async {
  final DB db = DB();
  await db.init();
  print(db.fakeDataData.runtimeType);
}
