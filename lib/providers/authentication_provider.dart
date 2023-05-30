/**
 * 
 * Implement the authentication_provider.dart:
 * 
 *  provider will act as a bridge between the UI
 * and the authentication_service.dart.
 * 
 *  It should expose methods for user registration, 
 * user login, user logout, and accessing the current user's authentication state.
 * 
 * The provider can make use of the ChangeNotifier or ChangeNotifierProvider 
 * from the provider package to manage the authentication state and 
 * notify the listeners when the state changes.
 * 
 *  Inside the provider, you can initialize an instance of the 
 * authentication_service.dart and call the appropriate 
 * methods based on the actions triggered by the UI.
 * 
 */

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../services/authentication_service.dart';

class AuthenticationProvider with ChangeNotifier {
  final AuthenticationService _authenticationService;

  AuthenticationProvider() : _authenticationService = AuthenticationService();

  // Get the current user
  User? get currentUser => _authenticationService.currentUser;

  // Register a new user
  Future<String?> registerUser(String email, String password) async {
    try {
      await _authenticationService.registerUser(email, password);
      notifyListeners();
      return null; // Registration successful
    } catch (error) {
      return error.toString();
    }
  }

  // Log in a user
  Future<String?> loginUser(String email, String password) async {
    try {
      await _authenticationService.loginUser(email, password);
      notifyListeners();
      return null; // Login successful
    } catch (error) {
      return error.toString();
    }
  }

  // Log out the current user
  Future<void> logoutUser() async {
    await _authenticationService.logoutUser();
    notifyListeners();
  }
}
