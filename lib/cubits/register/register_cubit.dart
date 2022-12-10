import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../models/user.dart' as model_user;
import '../../repositories/auth_repository.dart';
import '../../services/navigation_service.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  final AuthRepository _authRepository;

  RegisterCubit(this._authRepository) : super(RegisterStateInitial());

  Future<void> register(
      context, String name, String email, String password) async {
    emit(RegisterStateLoading());
    try {
      await _authRepository.register(name, email, password);
      emit(RegisterStateLoaded(user: model_user.User(name, email)));
      NavigationService().openDashboard();
    } on FirebaseAuthException catch (e) {
      emit(RegisterStateError(message: e.toString()));
    } catch (e) {
      emit(RegisterStateError(message: e.toString()));
      throw e.toString();
    }
  }
}
