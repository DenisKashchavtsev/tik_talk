import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'widgets/notifications/error.dart';

import '../cubits/register/register_cubit.dart';

class Register extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  Register({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register'),
      ),
      body: Column(
        children: [
          BlocBuilder<RegisterCubit, RegisterState>(
            builder: (context, state) {
              if (state is RegisterStateLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (state is RegisterStateError) {
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
                context.read<RegisterCubit>().register(
                    context, _emailController.text, _passwordController.text);
              },
              child: const Text('Register')),
          TextButton(
            onPressed: () {
              Navigator.pushNamedAndRemoveUntil(
                  context, '/login', ModalRoute.withName('/'));
            },
            child: const Text('Login'),
          ),
        ],
      ),
    );
  }
}
