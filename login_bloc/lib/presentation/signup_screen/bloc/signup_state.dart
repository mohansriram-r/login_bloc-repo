part of 'signup_bloc.dart';

@immutable
sealed class SignupState {}

final class SignupInitial extends SignupState {}

final class SignupLoading extends SignupState {}

final class SignupSucess extends SignupState {}

final class SignupFailure extends SignupState {
  SignupFailure({required this.error});
  final String error;
}

final class LoginNavigation extends SignupState {}
