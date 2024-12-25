import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_bloc/service/auth_service.dart';
import 'package:meta/meta.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthService _authService = AuthService();
  LoginBloc() : super(LoginInitial()) {
    on<SignUpButtonClicked>(_navigationToSignUpScreen);
    on<LoginButtonClicked>(_loginButtonClicked);
    on<ForgotPasswordButtonClicked>(_forgotPasswordButtonClicked);
    on<GoogleSignInButtonClicked>(_googleSignInButtonClicked);
  }

  FutureOr<void> _navigationToSignUpScreen(
    SignUpButtonClicked event,
    Emitter<LoginState> emit,
  ) {
    emit(NavigationToSignUpScreen());
  }

  FutureOr<void> _googleSignInButtonClicked(
    GoogleSignInButtonClicked event,
    Emitter<LoginState> emit,
  ) async {
    emit(LoginLoading());
    String res = await _authService.signInGoogle();

    if (res == 'success') {
      emit(LoginSucess());
    } else {
      emit(LoginFailure(error: res));
    }
  }

  FutureOr<void> _forgotPasswordButtonClicked(
    ForgotPasswordButtonClicked event,
    Emitter<LoginState> emit,
  ) {
    emit(ForgotPasswordState());
  }

  FutureOr<void> _loginButtonClicked(
    LoginButtonClicked event,
    Emitter<LoginState> emit,
  ) async {
    emit(LoginLoading());
    String res = await _authService.login(
      email: event.email,
      password: event.password,
    );

    if (res == 'sucess') {
      emit(LoginSucess());
    } else {
      emit(LoginFailure(error: res));
    }
  }
}
