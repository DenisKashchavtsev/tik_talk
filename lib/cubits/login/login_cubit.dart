import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/user.dart' as model_user;
import '../../repositories/auth_repository.dart';
import '../../service_locator.dart';
import '../../services/navigation_service.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  AuthRepository get _authRepository => ServiceLocator().authRepository;

  LoginCubit() : super(LoginStateInitial());

  Future<void> login(context, String email, String password) async {
    emit(LoginStateLoading());
    try {
      await _authRepository.login(email, password);
      emit(LoginStateLoaded(user: model_user.User('jbh', email)));
      NavigationService().openDashboard();
    } on FirebaseAuthException catch (e) {
      print(e);
      emit(LoginStateError(message: 'error'));
    } catch (e) {
      print(e);
      print(2);

      emit(LoginStateError(message: 'error'));
    }
  }
}
