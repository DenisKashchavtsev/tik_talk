import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../models/user.dart';
import '../../repositories/user_repository.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  final UserRepository _userRepository;

  UserCubit(this._userRepository) : super(UserStateInitial());

  getCurrentUser() async {
    emit(UserStateLoading());
    Future.delayed(Duration(seconds: 5), () async {

      final user = await _userRepository.getUser();

      emit(UserStateLoaded(user: user));


    });


  }
}
