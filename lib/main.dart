import 'package:flutter/material.dart';
import 'package:test10/app/getit/getit_setup.dart';
import 'package:test10/app/router/app_router.dart';
import 'package:test10/app/storage/storage_setup.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureStorage();
  configureDependencies();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final appRouter = getIt<AppRouter>();

  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      onGenerateRoute: appRouter.onGeneratedRoute,
    );
  }
}
