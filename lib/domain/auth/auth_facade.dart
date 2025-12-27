import 'package:alison_test/application/utils/type_def.dart';
import 'package:dartz/dartz.dart';

/// Defines the contract for authentication-related operations.
///
/// Implementations provide methods for user registration, OTP (One-Time Password) flows,
/// logout, address management, and accessing delivery locations.
abstract class AuthFacade {
  ResultFuture<Unit> login(String email, String password) {
    throw UnimplementedError();
  }
}
