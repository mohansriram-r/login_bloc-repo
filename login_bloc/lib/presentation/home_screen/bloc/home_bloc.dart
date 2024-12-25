import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_bloc/service/auth_service.dart';
import 'package:meta/meta.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<LogoutButtonClicked>(_logOutButtonClicked);
  }

  FutureOr<void> _logOutButtonClicked(
    LogoutButtonClicked event,
    Emitter<HomeState> emit,
  ) async {
    emit(HomeLoading());

    String res = await AuthService().signOut();

    if (res == "success") {
      emit(NavigateToLoginScreen());
    } else {
      emit(HomeFailure(error: res));
    }
  }
}
