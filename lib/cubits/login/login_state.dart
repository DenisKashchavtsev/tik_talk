part of 'login_cubit.dart';

abstract class LoginState {}

class LoginStateInitial extends LoginState {}

class LoginStateLoading extends LoginState {}

class LoginStateLoaded extends LoginState {
  final model_user.User? user;

  LoginStateLoaded({this.user});
}

class LoginStateError extends LoginState {
  final String message;

  LoginStateError({required this.message});
}