part of 'login_bloc.dart';

@immutable
sealed class LoginEvent {}

final class LoginButtonClicked extends LoginEvent {
  LoginButtonClicked({required this.email, required this.password});
  final String email;
  final String password;
}

final class SignUpButtonClicked extends LoginEvent {}
