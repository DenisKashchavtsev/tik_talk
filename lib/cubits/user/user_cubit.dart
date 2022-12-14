import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';

import '../../models/user.dart';
import '../../repositories/user_repository.dart';
import '../../service_locator.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserRepository get _userRepository => ServiceLocator().userRepository;

  UserCubit() : super(UserStateInitial());

  getCurrentUser() async {
    emit(UserStateLoading());
    final user = await _userRepository.getUser();
    emit(UserStateLoaded(user: user));
  }
}
