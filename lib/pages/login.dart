import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubits/login/login_cubit.dart';
import 'widgets/notifications/error.dart';

class Login extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Column(
        children: [
          const Text('test@gmail.com:123456'),
          BlocBuilder<LoginCubit, LoginState>(
            builder: (context, state) {
              if (state is LoginStateLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (state is LoginStateError) {
                return ErrorNotification(errorMessage: state.message);
              }
              return const Text('');
            },
          ),
          TextField(
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Email',
            ),
            controller: _emailController,
          ),
          TextField(
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Password',
            ),
            controller: _passwordController,
          ),
          ElevatedButton(
              onPressed: () {
                context.read<LoginCubit>().login(
                    context, _emailController.text, _passwordController.text);
              },
              child: const Text('Login')),
          TextButton(
            onPressed: () {
              Navigator.pushNamed(context, '/register');
            },
            child: const Text('Register'),
          ),
        ],
      ),
    );
  }
}
