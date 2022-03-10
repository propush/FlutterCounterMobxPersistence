import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:test10/app/getit/getit_setup.config.dart';

final getIt = GetIt.instance;

@InjectableInit()
void configureDependencies() => $initGetIt(getIt);
