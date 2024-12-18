import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
          _helper.navigationPush(context, const SignupScreen());
        } else if (state is LoginFailure) {
          _helper.showSnackBar(context, state.error);
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
                  _loginText(context),
                  const SizedBox(height: 20),
                  _emailTextField(context),
                  const SizedBox(height: 20),
                  _passwordTextField(context),
                  const SizedBox(height: 20),
                  _loginButton(context),
                  Flexible(flex: 1, child: Container()),
                  _signUpScreenButton(context),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _loginText(BuildContext context) {
    return Text(
      "Login",
      style: Theme.of(context).textTheme.headlineLarge,
    );
  }

  Widget _emailTextField(BuildContext context) {
    return TextField(
      controller: _emailController,
      decoration: InputDecoration(
        hintText: "Email",
        hintStyle: Theme.of(context).textTheme.labelSmall,
        filled: true,
      ),
    );
  }

  Widget _passwordTextField(BuildContext context) {
    return TextField(
      controller: _passwordController,
      decoration: InputDecoration(
        hintText: "Password",
        filled: true,
        hintStyle: Theme.of(context).textTheme.labelSmall,
      ),
    );
  }

  Widget _loginButton(BuildContext context) {
    return ElevatedButton(onPressed: () {}, child: const Text("Login"));
  }

  Widget _signUpScreenButton(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Don't Have a Account?",
          style: Theme.of(context).textTheme.bodySmall,
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
            style: Theme.of(context).textTheme.bodySmall,
          ),
        )
      ],
    );
  }
}
