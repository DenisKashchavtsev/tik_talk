import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubits/chat/chat_cubit.dart';
import 'cubits/login/login_cubit.dart';
import 'cubits/register/register_cubit.dart';
import 'cubits/user/user_cubit.dart';
import 'pages/chat/create_chat.dart';
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
            create: (BuildContext context) => LoginCubit(),
            child: Login(),
          ),
      '/register': (context) => BlocProvider(
            create: (BuildContext context) => RegisterCubit(),
            child: Register(),
          ),
      '/dashboard': (context) => MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) {
                  return UserCubit()..getCurrentUser();
                },
              ),
              BlocProvider(
                create: (context) {
                  return ChatCubit()..getList();
                },
              ),
            ],
            child: Dashboard(),
          ),
      '/create-chat': (context) => BlocProvider(
            create: (BuildContext context) => ChatCubit(),
            child: CreateChat(),
          ),
    };
  }
}
