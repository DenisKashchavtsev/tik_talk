part of 'chat_cubit.dart';

@immutable
abstract class ChatState {}

class ChatStateInitial extends ChatState {}

class ChatStateLoading extends ChatState {}

class ChatStateLoaded extends ChatState {
  final Chat? chat;
  final List<Chat>? chats;

  ChatStateLoaded({this.chat, this.chats});
}

class ChatStateCreated extends ChatState {}

class ChatStateError extends ChatState {}