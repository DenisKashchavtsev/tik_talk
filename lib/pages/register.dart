import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

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
              EasyLoading.dismiss();
              if(state.loading != null && state.loading == true){
                EasyLoading.show(status: 'loading...');
              }
              if (state.error != null) {
                return Text('${state.error}');
              }
              return const SizedBox(height: 10,);
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
                context.read<RegisterCubit>().register(context, _emailController.text, _passwordController.text);
              },
              child: const Text('Register')),
          TextButton(
            onPressed: () {
              Navigator.pushNamedAndRemoveUntil(context, '/login', ModalRoute.withName('/'));
            },
            child: const Text('Login'),
          ),
        ],
      ),
    );
  }
}
