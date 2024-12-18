import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_bloc/presentation/login_screen/bloc/login_bloc.dart';
import 'package:login_bloc/presentation/login_screen/login_screen.dart';
import 'package:login_bloc/utils/theme/theme.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginBloc(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: CTheme.themeData,
        home: LoginScreen(),
      ),
    );
  }
}
