part of 'forgot_password_bloc.dart';

@immutable
sealed class ForgotPasswordState {}

final class ForgotPasswordInitial extends ForgotPasswordState {}

final class ForgotPasswordFailure extends ForgotPasswordState {
  ForgotPasswordFailure({required this.error});
  final String error;
}

final class NavigationToLoginScreen extends ForgotPasswordState {}
