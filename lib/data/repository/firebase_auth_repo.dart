import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:grocery_user_app/data/interfaces/interfaces.dart';

class FirebaseAuthRepo {
  final Interfaces interfaces;
  FirebaseAuthRepo({
    required this.interfaces,
  });

  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

//add user data to the firevbase
  Future<void> signup(String email, String password, String fullName,
      String phoneNumber) async {
    return interfaces.signup(email, password, fullName, phoneNumber);
  }

  //getUserdata
  Future<void> login(String email, String password) async {
    return interfaces.login(email, password);
  }

  // Logout by calling the logout method from Interfaces
  Future<void> logout() async {
    return interfaces.logout();
  }
}
