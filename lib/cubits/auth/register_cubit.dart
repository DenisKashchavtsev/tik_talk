import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../models/user.dart' as model_user;
import '../../repositories/auth_repository.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  final AuthRepository _authRepository;

  RegisterCubit(this._authRepository) : super(RegisterState());

  Future<void> register(context, String email, String password) async {
    try {
      print(_authRepository.register(email, password));

      emit(RegisterState(user: model_user.User('email@gmail.com')));

      Navigator.pushNamed(context, '/dashboard');
    }on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    } catch (e) {
      throw e.toString();
    }
  }
}
