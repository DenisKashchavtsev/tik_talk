import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/user.dart' as model_user;
import '../../repositories/auth_repository.dart';
import '../../services/navigation_service.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final AuthRepository _authRepository;

  LoginCubit(this._authRepository) : super(LoginStateInitial());

  Future<void> login(context, String email, String password) async {
    emit(LoginStateLoading());
    try {
      await _authRepository.login(email, password);

      emit(LoginStateLoaded(user: model_user.User('jbh',email)));

      NavigationService().openDashboard();
    } on FirebaseAuthException catch (e) {
      print(1);
      print(e);
      emit(LoginStateError(message: 'error'));
    } catch (e) {
      print(2);
      print(e);

      emit(LoginStateError(message: 'error'));
    }
  }
}
