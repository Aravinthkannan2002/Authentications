import 'package:get/get.dart';
import 'package:flutter_login/flutter_login.dart';

class LoginController extends GetxController {
  // Loading time
  Duration get loadingTime => const Duration(milliseconds: 2000);

  // Login authentication
  Future<String?> authUser(LoginData data) async {
    await Future.delayed(loadingTime);
    if (data.name == "aravi@gmail.com" && data.password == "Password123") {
      return null; // Success
    } else {
      return "Invalid credentials"; // Failure
    }
  }

  // Forgot password recovery function
  Future<String?> recoverPassword(String email) async {
    await Future.delayed(
      loadingTime,
    ); // Simulate a delay (e.g., network request)

    if (email == "aravi@gmail.com") {
      // If the email matches the predefined one, simulate success
      return null;
    } else {
      // If the email doesn't match, return an error message
      return "Email address not found.";
    }
  }

  Future<String?> signupUser(SignupData data) async {
    await Future.delayed(loadingTime); // Simulate loading time

    // Add real signup logic here, e.g., API call
    return null; // Simulate successful signup
  }

  // Email validation
  String? userValidator(String? email) {
    if (email == null || email.isEmpty) {
      return "Email can't be empty";
    }
    final emailRegex = RegExp(
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
    );
    if (!emailRegex.hasMatch(email)) {
      return "Enter a valid email address";
    }
    return null;
  }

  // Password validation
  String? passwordValidator(String? password) {
    if (password == null || password.isEmpty) {
      return "Password can't be empty";
    }
    if (password.length < 6) {
      return "Password must be at least 6 characters long";
    }
    if (!RegExp(r'[A-Z]').hasMatch(password)) {
      return "Password must contain at least one uppercase letter";
    }
    if (!RegExp(r'[0-9]').hasMatch(password)) {
      return "Password must contain at least one number";
    }
    return null;
  }
}
