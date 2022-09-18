import 'package:bloc/bloc.dart';

import '../../models/user.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthState(null));

  setAuthUser(User user) {
    emit(AuthState(user));
  }
}
