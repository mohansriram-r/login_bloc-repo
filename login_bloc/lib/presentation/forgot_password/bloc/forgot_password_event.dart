part of 'forgot_password_bloc.dart';

@immutable
sealed class ForgotPasswordEvent {}

final class SendMailButtonClicked extends ForgotPasswordEvent {
  SendMailButtonClicked({required this.email});
  final String email;
}
