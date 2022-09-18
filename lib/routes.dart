import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubits/auth/auth_cubit.dart';
import 'pages/dashboard.dart';
import 'pages/home.dart';
import 'pages/login.dart';
import 'pages/register.dart';

class Routes {
  final BuildContext context;

  Routes(this.context);

  Map<String, Widget Function(BuildContext)> getRoutes() {
    return {
      '/': (context) => const Home(),
      '/login': (context) => BlocProvider(
            create: (BuildContext context) => AuthCubit(),
            child: Login(),
          ),
      '/register': (context) => BlocProvider(
            create: (BuildContext context) => AuthCubit(),
            child: Register(),
          ),
      '/dashboard': (context) => BlocProvider(
            create: (BuildContext context) => AuthCubit(),
            child: const Dashboard(),
          ),
    };
  }
}
