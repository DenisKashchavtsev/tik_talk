import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/user.dart' as model_user;
import '../../repositories/auth_repository.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final AuthRepository _authRepository;

  LoginCubit(this._authRepository) : super(LoginState());

  Future<void> login(context, String email, String password) async {
    try {
      print(await _authRepository.login(email, password));

      emit(LoginState(user: model_user.User('email@gmail.com')));

      Navigator.pushNamed(context, '/dashboard');
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      throw e.toString();
    }
  }
}
