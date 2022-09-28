import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import '../../models/user.dart' as model_user;
import '../../repositories/auth_repository.dart';
import '../../services/navigation_service.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  final AuthRepository _authRepository;

  RegisterCubit(this._authRepository) : super(RegisterState());

  Future<void> register(context, String email, String password) async {
    try {
      print(await _authRepository.register(email, password));

      emit(RegisterState(user: model_user.User('email@gmail.com')));

      NavigationService().openDashboard();

    } on FirebaseAuthException catch (e) {
      emit(RegisterState(user: null, error: e.message));
    } catch (e) {
      throw e.toString();
    }
  }
}
