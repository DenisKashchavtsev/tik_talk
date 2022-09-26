import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/user.dart' as model_user;
import '../../repositories/auth_repository.dart';
import '../../services/navigation_service.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final AuthRepository _authRepository;

  LoginCubit(this._authRepository) : super(LoginState());

  Future<void> login(context, String email, String password) async {
    emit(LoginState(loading: true));
    try {
      await _authRepository.login(email, password);

      emit(LoginState(user: model_user.User(email), loading: false));

      NavigationService().openDashboard();
    } on FirebaseAuthException catch (e) {
      emit(LoginState(user: null, error: e.message, loading: false));
    } catch (e) {
      emit(LoginState(user: null, error: null, loading: false));
      throw e.toString();
    }
  }
}
