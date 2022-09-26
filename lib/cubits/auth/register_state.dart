part of 'register_cubit.dart';

class RegisterState {
  final model_user.User? user;
  final String? error;
  final bool? loading;

  RegisterState({this.user, this.error, this.loading});
}
