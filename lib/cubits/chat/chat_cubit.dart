import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:meta/meta.dart';

import '../../models/chat.dart';
import '../../repositories/chat_repository.dart';

part 'chat_state.dart';

class ChatCubit extends Cubit<ChatState> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final ChatRepository _chatRepository;

  ChatCubit(this._chatRepository) : super(ChatStateInitial());

  getList() async {
    emit(ChatStateLoading());
    final chats = await _chatRepository.getList();
    print(chats);
    emit(ChatStateLoaded(chats: chats));
  }

  getOne() async {
    emit(ChatStateLoading());
    // final user = await _chatRepository().getUser();
    emit(ChatStateLoaded());
  }

  create(name) async {
    emit(ChatStateLoading());
    await _chatRepository.create('test1', _auth.currentUser?.uid);
    emit(ChatStateCreated());
  }

  update(name) async {
    emit(ChatStateLoading());
    await _chatRepository.create('test1', _auth.currentUser?.uid);
    emit(ChatStateCreated());
  }

  delete(name) async {
    emit(ChatStateLoading());
    await _chatRepository.create('test1', _auth.currentUser?.uid);
    emit(ChatStateCreated());
  }
}
