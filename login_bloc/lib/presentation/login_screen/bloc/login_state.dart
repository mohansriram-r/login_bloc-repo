part of 'login_bloc.dart';

@immutable
sealed class LoginState {}

final class LoginInitial extends LoginState {}

final class LoginLoading extends LoginState {}

final class LoginSucess extends LoginState {}

final class LoginFailure extends LoginState {
  LoginFailure({required this.error});
  final String error;
}

final class NavigationToSignUpScreen extends LoginState {}

final class PasswordVisible extends LoginState {}
