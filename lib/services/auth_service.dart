import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubits/auth/auth_cubit.dart';
import '../models/user.dart' as user_model;

class AuthService {
  static final FirebaseAuth _auth = FirebaseAuth.instance;

  static Future<void> signIn(context, String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      BlocProvider.of(AuthCubit().setAuthUser(user_model.User(_auth.currentUser?.email ?? '')));
      Navigator.pushNamed(context, '/dashboard');
    }on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    } catch (e) {
      throw e.toString();
    }
  }

  static Future<void> signUp(context, String email, String password) async {
    try {
      UserCredential user = await _auth.createUserWithEmailAndPassword(
          email: email,
          password: password
      );

      BlocProvider.of(AuthCubit().setAuthUser(user_model.User(_auth.currentUser?.email ?? '')));
      Navigator.pushNamed(context, '/dashboard');

    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      throw e.toString();
    }
  }

  static Future<user_model.User?> currentUser() async {
    User? user = _auth.currentUser;

    if (user != null) {
      return user_model.User(user.email ?? '');
    }
    return null;
  }
}