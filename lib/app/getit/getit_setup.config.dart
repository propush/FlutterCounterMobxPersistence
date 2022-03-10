// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../counter/logic/mobx/counter.dart' as _i5;
import '../../counter/repository/counter_repository.dart' as _i4;
import '../router/app_router.dart'
    as _i3; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.singleton<_i3.AppRouter>(_i3.AppRouter());
  gh.singleton<_i4.CounterRepository>(_i4.CounterRepository());
  gh.singleton<_i5.CounterStore>(
      _i5.CounterStore(get<_i4.CounterRepository>()));
  return get;
}
