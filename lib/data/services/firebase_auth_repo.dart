// ignore_for_file: unnecessary_null_comparison, annotate_overrides, avoid_print

import 'package:firebase_auth/firebase_auth.dart';
import 'package:grocery_user_app/data/repository/firebase_auth_repo.dart';
import 'package:grocery_user_app/data/models/user_model.dart';

import '../interfaces/auth_interfaces/auth_interface.dart';

class FirebaseAuthRepo implements AuthInterface {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final FirebaseAuthData firebaseAuthData = FirebaseAuthData();

  @override
  Future<void> signup(
    String fullName,
    String email,
    String phoneNumber,
    String passwordHash,
  ) async {
    try {
      UserCredential userCredential = await firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: passwordHash);

      if (userCredential != null) {
        final UserModel userModel = UserModel(
          userId: firebaseAuth.currentUser!.uid,
          fullName: fullName,
          email: email,
          phoneNumber: phoneNumber,
          passwordHash: passwordHash,
          role: UserRole.Customer,
          updatedAt: DateTime.now(),
          createdAt: DateTime.now(),
        );
        await firebaseAuthData.addUsersData(userModel);
      }
    } catch (e) {
      print("Error : $e");
    }
  }

  @override
  Future<void> login(String email, String password) async {
    UserCredential userCredential = await firebaseAuth
        .signInWithEmailAndPassword(email: email, password: password);
    if (userCredential != null) {}
  }

  @override
  Future<void> logout() async {
    try {
      await firebaseAuth.signOut();
    } catch (e) {
      print("Error in the logout $e");
    }
  }
}
