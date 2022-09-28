import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/user.dart' as user_modal;

class UserRepository {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final _firestore = FirebaseFirestore.instance;

  Future<user_modal.User?> getUser() async {
    final currentUser = _auth.currentUser;

    if(currentUser != null) {
      return user_modal.User(currentUser.email);
      // more information
      // await _firestore
      //     .collection('users')
      //     .doc(currentUser.uid)
      //     .get()
    }
    return null;
  }
}

