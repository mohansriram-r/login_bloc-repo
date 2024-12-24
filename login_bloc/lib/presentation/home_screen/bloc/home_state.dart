part of 'home_bloc.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}

final class HomeSuccess extends HomeState {}

final class HomeFailure extends HomeState {
  HomeFailure({required this.error});
  final String error;
}

final class HomeLoading extends HomeState {}

final class NavigateToLoginScreen extends HomeState {}
