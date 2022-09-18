import 'package:flutter/material.dart';

import '../services/auth_service.dart';

class Register extends StatelessWidget {
  final TextEditingController _usernameController = TextEditingController();
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
                AuthService.signUp(context, _emailController.text, _passwordController.text);
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
