import 'package:alison_test/domain/auth/auth_facade.dart';
import 'package:alison_test/presentation/widgets/custom_alert.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_dropdown_alert/model/data_alert.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_event.dart';
part 'auth_state.dart';
part 'auth_bloc.freezed.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthFacade authFacade;
  AuthBloc(this.authFacade) : super(AuthState.initial()) {
    on<Login>(_login);
  }

  void _login(Login event, Emitter<AuthState> emit) async {
    emit(state.copyWith(loginState: ApiStatus.loading));
    var response = await authFacade.login(event.email, event.password);

    response.fold(
      (l) {
        emit(state.copyWith(loginState: ApiStatus.loading));
        CustomAlertDialog.showCustomDialog(
          title: l.errMsg,
          typeAlert: TypeAlert.error,
        );
      },
      (r) {
        emit(state.copyWith(loginState: ApiStatus.success));
      },
    );
  }
}
