//abstrat classes

abstract class Interfaces {
  Future<void> signup(
    String email,
    String fullName,
    String phoneNumber,
    String passwordHash,
  );
  Future<void> login(String email, String password);
  Future<void> logout();
}
