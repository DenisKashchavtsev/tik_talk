import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:meta/meta.dart';

import '../../models/chat.dart';
import '../../repositories/chat_repository.dart';
import '../../service_locator.dart';

part 'chat_state.dart';

class ChatCubit extends Cubit<ChatState> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  ChatRepository get _chatRepository => ServiceLocator().chatRepository;

  ChatCubit() : super(ChatStateInitial());

  getList({int page = 1}) async {
    print(page);
    emit(ChatStateLoading());
    emit(ChatStateLoaded(chats: await _chatRepository.getList(page)));
  }

  getOne(doc) async {
    emit(ChatStateLoading());
    emit(ChatStateLoaded(chat: await _chatRepository.getOne(doc)));
  }

  create(name) async {
    emit(ChatStateLoading());
    if (await _chatRepository.create(name, _auth.currentUser?.uid)) {
      emit(ChatStateCreated());
    } else {
      emit(ChatStateError());
    }
  }

  update(doc, name) async {
    emit(ChatStateLoading());
    if (await _chatRepository.update(doc, name)) {
      emit(ChatStateUpdated());
    } else {
      emit(ChatStateError());
    }
  }

  delete(doc) async {
    emit(ChatStateLoading());
    if (await _chatRepository.delete(doc)) {
      emit(ChatStateDeleted());
    } else {
      emit(ChatStateError());
    }
  }
}
