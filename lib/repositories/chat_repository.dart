import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/chat.dart';
import '../models/user.dart' as user_modal;

class ChatRepository {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final _chats = FirebaseFirestore.instance.collection('chats');

  Future getList()  async {
    final currentUser = _auth.currentUser;

    if(currentUser != null) {
      final querySnapshot = await _chats.where('uid', isEqualTo: currentUser.uid).get();
      List chats = <Chat>[];
      for (final item in querySnapshot.docs) {
        chats.add(Chat(item.data()['name'], 'Test last message', 0));
      }
      return chats;
    }
    return null;
  }

  Future<String> create(String name, String? uid) async {
    DocumentReference ref = await _chats.add({'name': '$name 😎', 'uid': uid});
    print(ref);
    return 'asdf';
    // return ref.documentID;
  }
  //
  // void readData(String id) async {
  //   DocumentSnapshot snapshot = await _firestore.document(id).get();
  //   print(snapshot.data['name']);
  // }
  //
  // void updateData(DocumentSnapshot doc) async {
  //   await _firestore.document(doc.documentID).updateData({'todo': 'please 🤫'});
  // }
  //
  // void deleteData(DocumentSnapshot doc) async {
  //   await _firestore.document(doc.documentID).delete();
  // }
}

