part of 'chat_cubit.dart';

@immutable
abstract class ChatState {}

class ChatStateInitial extends ChatState {}

class ChatStateLoading extends ChatState {}

class ChatStateLoaded extends ChatState {
  final Chat? chat;
  final List<Chat>? chats;
  final int? page;

  ChatStateLoaded({this.chat, this.chats, this.page});
}

class ChatStateCreated extends ChatState {}

class ChatStateUpdated extends ChatState {}

class ChatStateDeleted extends ChatState {}

class ChatStateError extends ChatState {}
