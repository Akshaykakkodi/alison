import 'package:dio/dio.dart';

import 'package:injectable/injectable.dart';

@module
abstract class AppInjectionModule {
  @lazySingleton
  Dio get dio => Dio();
}
