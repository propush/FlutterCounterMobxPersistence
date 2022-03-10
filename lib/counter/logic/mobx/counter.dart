import 'package:injectable/injectable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:mobx/mobx.dart';
import 'package:test10/counter/repository/counter_repository.dart';

part 'counter.g.dart';

@singleton
class CounterStore {
  final CounterRepository _counterRepository;

  late final Counter counter = _counterRepository.load();

  CounterStore(this._counterRepository) {
    autorun(
      (_) {
        _counterRepository.persist(counter);
      },
      delay: 1000,
    );
  }
}

@JsonSerializable()
class Counter extends _Counter with _$Counter {
  factory Counter.fromJson(Map<String, dynamic> json) =>
      _$CounterFromJson(json);

  Map<String, dynamic> toJson(instance) => _$CounterToJson(this);

  Counter();
}

abstract class _Counter with Store {
  @observable
  int value = 0;

  @action
  void amend(int delta) {
    value += delta;
  }
}
