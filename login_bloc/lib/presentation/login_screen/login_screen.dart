import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_bloc/presentation/custom_wideget/text_field.dart';
import 'package:login_bloc/presentation/forgot_password/forgot_password.dart';
import 'package:login_bloc/presentation/home_screen/home_screen.dart';
import 'package:login_bloc/presentation/login_screen/bloc/login_bloc.dart';
import 'package:login_bloc/presentation/signup_screen/signup_screen.dart';
import 'package:login_bloc/utils/helper/helper.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  final Helper _helper = Helper();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state is NavigationToSignUpScreen) {
          _helper.navigationPush(context, SignupScreen());
        } else if (state is LoginFailure) {
          _helper.showSnackBar(context, state.error);
        } else if (state is LoginSucess) {
          _helper.navigationPushReplacement(context, const HomeScreen());
        } else if (state is ForgotPasswordState) {
          _helper.navigationPush(context, const ForgotPassword());
        }
      },
      builder: (context, state) {
        if (state is LoginLoading) {
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
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(flex: 1, child: Container()),
                  Text(
                    "Login",
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                  const SizedBox(height: 20),
                  CTextField(
                    emailController: _emailController,
                    hintText: "Email",
                  ),
                  const SizedBox(height: 20),
                  CTextField(
                    emailController: _passwordController,
                    hintText: "Password",
                    isPass: true,
                  ),
                  const SizedBox(height: 10),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: GestureDetector(
                      onTap: () {
                        context
                            .read<LoginBloc>()
                            .add(ForgotPasswordButtonClicked());
                      },
                      child: Text(
                        "Forgot Password?",
                        style: Theme.of(context).textTheme.labelSmall,
                        textAlign: TextAlign.end,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      context.read<LoginBloc>().add(
                            LoginButtonClicked(
                              email: _emailController.text,
                              password: _passwordController.text,
                            ),
                          );
                    },
                    child: const Text("Login"),
                  ),
                  Flexible(flex: 1, child: Container()),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don't Have a Account?",
                        style: Theme.of(context).textTheme.labelSmall,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      GestureDetector(
                        onTap: () {
                          context.read<LoginBloc>().add(SignUpButtonClicked());
                        },
                        child: Text(
                          "Sign up",
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
