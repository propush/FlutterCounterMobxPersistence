import 'dart:io';
import 'dart:math';

import 'package:test10/app/storage/storage_setup.dart';

void prepareTestStorage() {
  final tmpDir = Directory('/tmp/test10/${_testDirName()}')
    ..createSync(recursive: true);
  fileStoragePath = tmpDir.path;
}

String _testDirName() => Random().nextInt(100).toString();
