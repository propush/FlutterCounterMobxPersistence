import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart' as mockito;
import 'package:test10/counter/logic/mobx/counter.dart';
import 'package:test10/counter/repository/counter_repository.dart';

import 'counter_test.mocks.dart';

@GenerateMocks([CounterRepository])
void main() {
  group('Counter store tests', () {
    late CounterStore counterStore;
    final counterRepository = MockCounterRepository();

    setUp(() {
      mockito.when(counterRepository.load()).thenReturn(Counter()..value = 10);
      counterStore = CounterStore(counterRepository);
    });

    test('Automated loading test', () {
      expect(counterStore.counter.value, 10);
      mockito.verify(counterRepository.load()).called(1);
    });

    test('Persisting test', () async {
      counterStore.counter.amend(5);
      // pause because of throttle delay:
      await Future.delayed(const Duration(seconds: 2));
      mockito
          .verify(counterRepository.persist(mockito.argThat(
              const TypeMatcher<Counter>()
                  .having((e) => e.value, 'value', 15))))
          .called(1);
    });
  });

  group('Counter tests', () {
    late Counter counter;

    setUp(() {
      counter = Counter();
    });

    test('Check zero initial value', () {
      expect(counter.value, 0);
    });

    test('Check amending counter', () {
      counter.amend(10);
      expect(counter.value, 10);
    });
  });
}
