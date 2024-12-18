part of 'signup_bloc.dart';

@immutable
sealed class SignupEvent {}

final class SignUpButtonClicked extends SignupEvent {
  SignUpButtonClicked({required this.email, required this.password});
  final String email;
  final String password;
}

final class LoginButtonClicked extends SignupEvent {}
