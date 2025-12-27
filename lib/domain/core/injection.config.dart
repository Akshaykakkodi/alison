// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../application/core/services/dio_client.dart' as _i878;
import '../../infrastructure/auth/auth_facade_impl.dart' as _i427;
import '../../infrastructure/auth/login/login.dart' as _i286;
import '../auth/auth_facade.dart' as _i81;
import 'base/runsafely.dart' as _i170;
import 'injection_module.dart' as _i212;

// initializes the registration of main-scope dependencies inside of GetIt
_i174.GetIt init(
  _i174.GetIt getIt, {
  String? environment,
  _i526.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i526.GetItHelper(getIt, environment, environmentFilter);
  final appInjectionModule = _$AppInjectionModule();
  gh.lazySingleton<_i361.Dio>(() => appInjectionModule.dio);
  gh.lazySingleton<_i170.RunSafely>(() => _i170.RunSafely());
  gh.lazySingleton<_i878.DioClient>(() => _i878.DioClient(gh<_i361.Dio>()));
  gh.lazySingleton<_i286.Login>(
    () => _i286.Login(gh<_i878.DioClient>(), gh<_i170.RunSafely>()),
  );
  gh.lazySingleton<_i81.AuthFacade>(
    () => _i427.AuthFacadeImpl(gh<_i286.Login>()),
  );
  return getIt;
}

class _$AppInjectionModule extends _i212.AppInjectionModule {}
