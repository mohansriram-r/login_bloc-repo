import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_bloc/presentation/custom_wideget/text_field.dart';
import 'package:login_bloc/presentation/home_screen/home_screen.dart';
import 'package:login_bloc/presentation/login_screen/login_screen.dart';
import 'package:login_bloc/presentation/signup_screen/bloc/signup_bloc.dart';
import 'package:login_bloc/utils/helper/helper.dart';

class SignupScreen extends StatelessWidget {
  SignupScreen({super.key});

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _userNameController = TextEditingController();
  final Helper _helper = Helper();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignupBloc, SignupState>(
      listener: (context, state) {
        if (state is LoginNavigation) {
          _helper.navigationPushReplacement(context, LoginScreen());
        } else if (state is SignupFailure) {
          _helper.showSnackBar(context, state.error);
        } else if (state is SignupSucess) {
          _helper.navigationPushReplacement(context, const HomeScreen());
        }
      },
      builder: (context, state) {
        return Scaffold(
          body: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(flex: 1, child: Container()),
                  Text(
                    "Create a account",
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                  const SizedBox(height: 20),
                  CTextField(
                    emailController: _userNameController,
                    hintText: "Username",
                  ),
                  const SizedBox(height: 20),
                  CTextField(
                    emailController: _emailController,
                    hintText: "Email",
                  ),
                  const SizedBox(height: 20),
                  CTextField(
                    emailController: _passwordController,
                    hintText: " Create password",
                    isPass: true,
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      context.read<SignupBloc>().add(
                            SignUpButtonClicked(
                                email: _emailController.text,
                                password: _passwordController.text),
                          );
                    },
                    child: const Text("Sign Up"),
                  ),
                  Flexible(flex: 1, child: Container()),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Do you have a Account?",
                        style: Theme.of(context).textTheme.labelSmall,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      GestureDetector(
                        onTap: () {
                          context.read<SignupBloc>().add(LoginButtonClicked());
                        },
                        child: Text(
                          "Login In",
                          style: Theme.of(context).textTheme.labelSmall,
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
