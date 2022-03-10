import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:test10/app/getit/getit_setup.dart';
import 'package:test10/counter/logic/mobx/counter.dart';

class CounterScreen extends StatelessWidget {
  static const routeName = '/';

  final _counterStore = getIt<CounterStore>();

  CounterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Test 10 Application'),
      ),
      body: _counterWidget(context),
    );
  }

  Widget _counterWidget(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Observer(builder: (context) {
            return Text('Counter: ${_counterStore.counter.value}');
          }),
          ElevatedButton(
            child: const Icon(Icons.add),
            onPressed: () => _counterStore.counter.amend(1),
          ),
        ],
      ),
    );
  }
}
