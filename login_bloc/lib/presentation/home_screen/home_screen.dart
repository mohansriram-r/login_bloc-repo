import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_bloc/presentation/home_screen/bloc/home_bloc.dart';
import 'package:login_bloc/presentation/login_screen/login_screen.dart';
import 'package:login_bloc/service/auth_service.dart';
import 'package:login_bloc/utils/helper/helper.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Helper _helper = Helper();
    return BlocConsumer<HomeBloc, HomeState>(
      listener: (context, state) {
        if (state is NavigateToLoginScreen) {
          _helper.navigationPush(context, LoginScreen());
        }
        if (state is HomeFailure) {
          _helper.showSnackBar(context, state.error);
        }
      },
      builder: (context, state) {
        if (state is HomeLoading) {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(
                color: Colors.black,
              ),
            ),
          );
        }
        return Scaffold(
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(AuthService().getUser()),
                const SizedBox(
                  height: 20,
                ),
                const Text("Home Screen"),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () {
                    context.read<HomeBloc>().add(LogoutButtonClicked());
                  },
                  child: const Text("Logout"),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
