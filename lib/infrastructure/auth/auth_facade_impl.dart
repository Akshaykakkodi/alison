import 'package:alison_test/application/utils/type_def.dart';
import 'package:alison_test/domain/auth/auth_facade.dart';
import 'package:alison_test/infrastructure/auth/login/login.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: AuthFacade)
class AuthFacadeImpl implements AuthFacade {
  final Login loginUsecase;
  AuthFacadeImpl(this.loginUsecase);
  @override
  ResultFuture<Unit> login(String email, String password) async {
    return await loginUsecase.call(email, password);
  }
}
