import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../models/user.dart' as user_modal;

class UserRepository {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final _firestore = FirebaseFirestore.instance;

  Future<user_modal.User?> getUser() async {
    final currentUser = _auth.currentUser;

    if (currentUser != null) {
      var user =
          await _firestore.collection('users').doc(currentUser.uid).get();

      return user_modal.User(user.data()?['name'], currentUser.email);
    }
    return null;
  }
}
