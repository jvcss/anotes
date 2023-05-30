// ignore_for_file: avoid_print

///
///
/// Implement the authentication_service.dart:
///
///  This service will handle all the authentication-related
/// functionality using the Firebase Authentication SDK.
///
///  It should provide methods for user registration,
/// user
/// ✅ login, user
/// ✅ logout, user
/// ✅ authentication state changes.
///
///  Use the methods provided by the Firebase Authentication SDK,
/// such as
/// ✅ createUserWithEmailAndPassword,
/// ✅ signInWithEmailAndPassword,
/// ✅ signOut,
/// ✅ authStateChanges,
///
/// to implement these functionalities:
/// ⬜ login with Google
/// ⬜ login with Facebook
import 'package:firebase_auth/firebase_auth.dart';

class AuthenticationService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  // Sign up with email and password
  Future<String?> signUpWithEmail(String email, String password) async {
    try {
      final UserCredential userCredential =
          await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      final User? user = userCredential.user;
      return user?.uid;
    } catch (e) {
      print('Error during email registration: $e');
      return null;
    }
  }

  // Sign in with email and password
  Future<String?> signInWithEmail(String email, String password) async {
    try {
      final UserCredential userCredential =
          await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      final User? user = userCredential.user;
      return user?.uid;
    } catch (e) {
      print('Error during email login: $e');
      return null;
    }
  }

  // Sign out
  Future<void> signOut() async {
    try {
      await _firebaseAuth.signOut();
    } catch (e) {
      print('Error during sign out: $e');
    }
  }

  // Get the current user
  User? getCurrentUser() {
    final User? user = _firebaseAuth.currentUser;
    return user;
  }

  // Stream to listen for authentication state changes
  Stream<User?> get authStateChanges => _firebaseAuth.authStateChanges();
}
