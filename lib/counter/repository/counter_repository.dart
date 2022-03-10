import 'dart:convert';
import 'dart:io';

import 'package:injectable/injectable.dart';
import 'package:test10/app/storage/storage_setup.dart';
import 'package:test10/counter/logic/mobx/counter.dart';

@singleton
class CounterRepository {
  final File storage = File('$fileStoragePath/counter.txt');

  void clear() {
    try {
      storage.deleteSync();
    } catch (e) {
      print('Could not clean the storage: $e');
    }
  }

  void persist(Counter counter) {
    var json = jsonEncode(counter.toJson(null));
    storage.writeAsStringSync(json);
    print("Saved $json");
  }

  Counter load() {
    try {
      final contents = storage.readAsStringSync();
      print("Loaded counter: $contents");
      return Counter.fromJson(jsonDecode(contents));
    } catch (e) {
      print('Error: $e');
      print('Counter not found, creating new');
      return Counter();
    }
  }
}
