part of 'user_cubit.dart';

@immutable
abstract class UserState {
  get user => null;
}

class UserStateInitial extends UserState {}

class UserStateLoading extends UserState {}

class UserStateLoaded extends UserState {
  final User? user;

  UserStateLoaded({this.user});
}

class UserStateError extends UserState {}