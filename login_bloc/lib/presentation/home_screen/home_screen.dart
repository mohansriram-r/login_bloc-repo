import 'package:firebase_auth/firebase_auth.dart';
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
    final User? currentUser = AuthService().getCurrentUser();
    return BlocConsumer<HomeBloc, HomeState>(
      listener: (context, state) {
        if (state is NavigateToLoginScreen) {
          _helper.navigationPushReplacement(context, LoginScreen());
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
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (currentUser != null)
                    Text(
                      "Loged in as : ${currentUser.email!}",
                      textAlign: TextAlign.center,
                    )
                  else
                    const Text('No user is currently signed in'),
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
          ),
        );
      },
    );
  }
}
