import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_bloc/service/auth_service.dart';
import 'package:meta/meta.dart';

part 'forgot_password_event.dart';
part 'forgot_password_state.dart';

class ForgotPasswordBloc
    extends Bloc<ForgotPasswordEvent, ForgotPasswordState> {
  ForgotPasswordBloc() : super(ForgotPasswordInitial()) {
    on<SendMailButtonClicked>(_sendMailButtonClicked);
  }

  FutureOr<void> _sendMailButtonClicked(
      SendMailButtonClicked event, Emitter<ForgotPasswordState> emit) async {
    if (event.email.isNotEmpty) {
      await AuthService().resetPssword(
        email: event.email,
      );
      emit(NavigationToLoginScreen());
    }
  }
}
