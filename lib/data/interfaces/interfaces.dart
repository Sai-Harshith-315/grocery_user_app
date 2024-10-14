//abstrat classes

import 'package:grocery_user_app/data/models/user_model.dart';

abstract class Interfaces {
  Future<void> signup(
    String email,
    String password,
    String fullName,
    String phoneNumber,
  );

  Future<void> login(String email, String password);
  Future<void> logout();
}
