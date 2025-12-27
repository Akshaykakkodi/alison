# alison_test

A Flutter project demonstrating clean architecture and design patterns.

## Design Patterns

### Facade Pattern Implementation

The project implements the Facade pattern in the authentication module to provide a simplified interface for authentication-related operations. The main components are:

#### 1. AuthFacade (Abstract Interface)
Defines the contract for authentication operations:

```dart
// lib/domain/auth/auth_facade.dart
abstract class AuthFacade {
  ResultFuture<Unit> login(String email, String password) {
    throw UnimplementedError();
  }
}
```

#### 2. AuthFacadeImpl (Concrete Implementation)
Implements the facade interface and coordinates with underlying services:

```dart
// lib/infrastructure/auth/auth_facade_impl.dart
@LazySingleton(as: AuthFacade)
class AuthFacadeImpl implements AuthFacade {
  final Login loginUsecase;
  
  AuthFacadeImpl(this.loginUsecase);
  
  @override
  ResultFuture<Unit> login(String email, String password) async {
    return await loginUsecase.call(email, password);
  }
}
```

#### 3. Usage in Application Layer
The facade is consumed by the AuthBloc to handle authentication logic:

```dart
// lib/application/auth/auth_bloc.dart
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthFacade authFacade;
  
  AuthBloc(this.authFacade) : super(AuthState.initial()) {
    on<Login>(_login);
  }

  void _login(Login event, Emitter<AuthState> emit) async {
    emit(state.copyWith(loginState: ApiStatus.loading));
    var response = await authFacade.login(event.email, event.password);
    // ... handle response
  }
}
```

#### Key Benefits in This Implementation:
1. **Simplified Interface**: The `AuthFacade` provides a clean, high-level API for authentication operations.
2. **Decoupling**: The UI layer depends only on the facade interface, not concrete implementations.
3. **Testability**: Easy to mock the facade for testing different scenarios.
4. **Maintainability**: Changes to the underlying authentication logic are encapsulated within the facade.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
