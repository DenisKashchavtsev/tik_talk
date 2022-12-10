import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/chat.dart';

class ChatRepository {
  final _chats = FirebaseFirestore.instance.collection('chats');

  Future<List<Chat>> getList() async {
    return await _chats.get().then((snapshot) =>
        snapshot.docs.map((doc) => Chat.fromJson(doc.data())).toList());
  }

  getOne(String docId) async {
    /** todo need to get data */
    return _chats.doc(docId).snapshots();
  }

  create(String name, String? uid) async {
    await _chats.add({'name': name, 'uid': uid}).then((result) {
      return true;
    }).catchError((error) {
      return true;
    });
  }

  update(String doc, String name) async {
    await _chats.doc(doc).update({'name': name}).then((result) {
      return true;
    }).catchError((error) {
      return true;
    });
  }

  delete(String doc) async {
    await _chats.doc(doc).delete().then((result) {
      return true;
    }).catchError((error) {
      return true;
    });
  }
}
