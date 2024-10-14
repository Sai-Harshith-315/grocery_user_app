import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:grocery_user_app/data/models/user_model.dart';

class FirebaseAuthData {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

//add user data to the firevbase
  Future<void> addUsersData(UserModel userModel) async {
    try {
      User? user = firebaseAuth.currentUser;
      if (user != null) {
        await firebaseFirestore
            .collection('users')
            .doc(user.uid)
            .set(userModel.toMap());
      }
    } catch (e) {
      print("Error occured in adding user data to firebase : $e");
    }
  }
}
