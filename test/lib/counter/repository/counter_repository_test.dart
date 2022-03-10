import 'package:flutter_test/flutter_test.dart';
import 'package:test10/counter/logic/mobx/counter.dart';
import 'package:test10/counter/repository/counter_repository.dart';

import '../../util/test_util.dart';

void main() {
  late CounterRepository counterRepository;

  group('Counter repository positive tests', () {
    setUp(() async {
      prepareTestStorage();
      counterRepository = CounterRepository();
      counterRepository.clear();
    });

    tearDown(() {
      counterRepository.clear();
    });

    test('Persist counter', () {
      final counter = Counter();
      counter.value = 10;
      counterRepository.persist(counter);
      assert(counterRepository.load().value == 10);
    });
  });
}
