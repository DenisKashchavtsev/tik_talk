import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubits/auth/login_cubit.dart';
import 'cubits/auth/register_cubit.dart';
import 'pages/dashboard.dart';
import 'pages/home.dart';
import 'pages/login.dart';
import 'pages/register.dart';
import 'repositories/auth_repository.dart';

class Routes {
  final BuildContext context;

  Routes(this.context);

  Map<String, Widget Function(BuildContext)> getRoutes() {
    return {
      '/': (context) => const Home(),
      '/login': (context) => BlocProvider(
            create: (BuildContext context) => LoginCubit(AuthRepository()),
            child: Login(),
          ),
      '/register': (context) => BlocProvider(
            create: (BuildContext context) => RegisterCubit(AuthRepository()),
            child: Register(),
          ),
      '/dashboard': (context) => const Dashboard(),
    };
  }
}
