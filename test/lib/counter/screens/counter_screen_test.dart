import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:test10/app/getit/getit_setup.dart';
import 'package:test10/counter/repository/counter_repository.dart';
import 'package:test10/main.dart';

import '../../util/test_util.dart';

void main() {
  setUp(() {
    WidgetsFlutterBinding.ensureInitialized();
    prepareTestStorage();
    configureDependencies();
    getIt<CounterRepository>().clear();
  });

  tearDown(() {
    getIt<CounterRepository>().clear();
  });

  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(MyApp());

    // Verify that our counter starts at 0.
    expect(find.text('Counter: 0'), findsOneWidget);
    expect(find.text('Counter: 1'), findsNothing);

    // Tap the '+' icon and trigger a frame.
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    // Verify that our counter has incremented.
    expect(find.text('Counter: 0'), findsNothing);
    expect(find.text('Counter: 1'), findsOneWidget);
  });
}
