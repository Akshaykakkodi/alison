import 'package:alison_test/application/core/services/dio_client.dart';
import 'package:alison_test/application/utils/type_def.dart';
import 'package:dartz/dartz.dart';

import 'package:injectable/injectable.dart';

@lazySingleton
class RunSafely {
  RunSafely();

  ResultFuture<T> call<T>(
    Future<T> Function() action, {
    CustomException Function(String error)? failure,
  }) async {
    try {
      return right(await action());
    } on CustomException catch (e) {
      return left(failure?.call(e.errMsg) ?? CustomException(errMsg: e.errMsg));
    } catch (e) {
      return left(
        failure?.call(e.toString()) ?? CustomException(errMsg: e.toString()),
      );
    }
  }
}
