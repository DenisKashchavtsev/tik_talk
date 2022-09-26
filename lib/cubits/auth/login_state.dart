part of 'login_cubit.dart';

class LoginState {
  final model_user.User? user;
  final String? error;
  final bool? loading;

  LoginState({this.user, this.error, this.loading});
}
