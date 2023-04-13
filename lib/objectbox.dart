import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'objectbox.g.dart'; // created by `flutter pub run build_runner build`

class ObjectBox {
  late final Store store;

  ObjectBox._create(this.store) {
    // Add any additional setup code, e.g. build queries.
  }

  static Future<ObjectBox> create() async {
    final docsDir = await getApplicationDocumentsDirectory();
    final dbPath = '${docsDir.path}${Platform.pathSeparator}objectbox';
    final store = await openStore(directory: dbPath);
    return ObjectBox._create(store);
  }
}
