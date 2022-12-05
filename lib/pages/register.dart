import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../configs/styles.dart';
import 'widgets/notifications/error.dart';

import '../cubits/register/register_cubit.dart';

class Register extends StatelessWidget {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  Register({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Styles.mainColor,
        elevation: 0,
      ),
      body: Column(
        children: [
          Stack(
            children: <Widget>[
              Expanded(
                child: Container(
                  height: 350,
                  decoration: const BoxDecoration(
                      color: Styles.mainColor,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(40.0),
                        bottomRight: Radius.circular(40.0),
                      )),
                ),
              ),
              Container(
                  padding:
                  const EdgeInsets.symmetric(vertical: 40, horizontal: 45),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text('Register',
                          style: TextStyle(color: Colors.white, fontSize: 30)),
                      SizedBox(
                        height: 10,
                      ),
                      Text('Please enter your email and password to register',
                          style: TextStyle(color: Colors.white, fontSize: 18)),
                    ],
                  )),
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
              Expanded(
                child: Container(
                  padding: const EdgeInsets.only(top: 240, left: 45, right: 45),
                  child: Container(
                    height: 490,
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(40.0))),
                    child: Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 40, horizontal: 40),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                child: TextField(
                                  decoration: InputDecoration(
                                    enabledBorder: Styles.inputBorder,
                                    focusedBorder: Styles.focusBorder,
                                    hintText: 'Name',
                                  ),
                                  controller: _nameController,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.only(
                              top: 0, bottom: 40, left: 40, right: 40),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                child: TextField(
                                  decoration: InputDecoration(
                                    enabledBorder: Styles.inputBorder,
                                    focusedBorder: Styles.focusBorder,
                                    hintText: 'Email',
                                  ),
                                  controller: _emailController,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.only(
                              top: 0, bottom: 40, left: 40, right: 40),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                child: TextField(
                                  decoration: InputDecoration(
                                    enabledBorder: Styles.inputBorder,
                                    focusedBorder: Styles.focusBorder,
                                    hintText: 'Password',
                                  ),
                                  controller: _passwordController,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.only(
                              top: 0, bottom: 40, left: 40, right: 40),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                child: ElevatedButton(
                                    onPressed: () {
                                      context.read<RegisterCubit>().register(
                                          context, _nameController.text, _emailController.text, _passwordController.text);
                                    },
                                    style: Styles.buttonFilledStyles,
                                    child: const Text('Register')),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.only(
                              top: 0, bottom: 40, left: 40, right: 40),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                child: TextButton(
                                  onPressed: () {
                                    Navigator.pushNamed(context, '/login');
                                  },
                                  child: const Text(
                                    'Login',
                                    style: TextStyle(
                                        color: Styles.mainColor, fontSize: 18),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
