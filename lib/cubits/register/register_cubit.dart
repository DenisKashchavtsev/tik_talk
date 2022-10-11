import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../models/user.dart' as model_user;
import '../../repositories/auth_repository.dart';
import '../../services/navigation_service.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  final AuthRepository _authRepository;

  RegisterCubit(this._authRepository) : super(RegisterStateInitial());

  Future<void> register(context, String email, String password) async {
    emit(RegisterStateLoading());
    try {
      print(await _authRepository.register(email, password));

      emit(RegisterStateLoaded(user: model_user.User('email@gmail.com')));

      NavigationService().openDashboard();

    } on FirebaseAuthException catch (e) {
      emit(RegisterStateError(message: e.toString()));
    } catch (e) {
      emit(RegisterStateError(message: e.toString()));
      throw e.toString();
    }
  }
}
