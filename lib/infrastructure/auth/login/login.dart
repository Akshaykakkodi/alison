import 'package:alison_test/application/core/services/dio_client.dart';
import 'package:alison_test/application/utils/type_def.dart';
import 'package:alison_test/application/utils/urls.dart';
import 'package:alison_test/domain/core/base/runsafely.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class Login {
  final DioClient dioClient;
  final RunSafely runSafely;
  Login(this.dioClient, this.runSafely);
  ResultFuture<Unit> call(String email, String password) async {
    return runSafely(() async {
      final response = await dioClient.get(
        Urls.login,
        queryParameters: {"email_phone": email, "password": password},
      );

      if (response.isOk) {
        return unit;
      }

      throw CustomException(errMsg: response.message);
    });
  }
}
