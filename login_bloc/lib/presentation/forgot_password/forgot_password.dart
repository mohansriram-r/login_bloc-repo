import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_bloc/presentation/custom_wideget/text_field.dart';
import 'package:login_bloc/presentation/forgot_password/bloc/forgot_password_bloc.dart';
import 'package:login_bloc/presentation/login_screen/login_screen.dart';
import 'package:login_bloc/utils/helper/helper.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController _emailController = TextEditingController();
    final Helper _helper = Helper();
    return BlocListener<ForgotPasswordBloc, ForgotPasswordState>(
      listener: (context, state) {
        if (state is NavigationToLoginScreen) {
          _helper.navigationPushReplacement(context, LoginScreen());
        }
      },
      child: Scaffold(
        body: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Reset your password",
                  style: Theme.of(context)
                      .textTheme
                      .headlineLarge!
                      .copyWith(fontSize: 25),
                ),
                const SizedBox(
                  height: 20,
                ),
                CTextField(
                  emailController: _emailController,
                  hintText: "Email",
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () {
                    context.read<ForgotPasswordBloc>().add(
                          SendMailButtonClicked(email: _emailController.text),
                        );
                  },
                  child: const Text("Send email"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
