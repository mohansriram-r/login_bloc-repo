import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_bloc/service/auth_service.dart';
import 'package:meta/meta.dart';

part 'signup_event.dart';
part 'signup_state.dart';

class SignupBloc extends Bloc<SignupEvent, SignupState> {
  final AuthService _authService = AuthService();
  SignupBloc() : super(SignupInitial()) {
    on<SignUpButtonClicked>(_signUpButtonClicked);
    on<LoginButtonClicked>(_loginButtonClicked);
  }

  FutureOr<void> _signUpButtonClicked(
    SignUpButtonClicked event,
    Emitter<SignupState> emit,
  ) async {
    emit(SignupLoading());
    String res = await _authService.createUser(
      email: event.email,
      password: event.password,
    );

    if (res == 'sucess') {
      emit(SignupSucess());
    } else {
      emit(SignupFailure(error: res));
    }
  }

  FutureOr<void> _loginButtonClicked(
    LoginButtonClicked event,
    Emitter<SignupState> emit,
  ) {
    emit(LoginNavigation());
  }
}
