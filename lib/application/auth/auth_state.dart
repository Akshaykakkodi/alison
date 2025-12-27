part of 'auth_bloc.dart';

@freezed
class AuthState with _$AuthState {
  const factory AuthState({required ApiStatus loginState}) = _AuthState;

  factory AuthState.initial() => AuthState(loginState: ApiStatus.initial);
}

enum ApiStatus { initial, loading, success, error }
