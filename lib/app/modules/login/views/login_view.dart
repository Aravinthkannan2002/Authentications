import 'package:auth/app/modules/home/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:get/get.dart';
import '../controllers/login_controller.dart';
import 'package:auth/app/modules/home/views/home_view.dart';

class LoginView extends GetView<LoginController> {
    final homeController = Get.put(HomeController());
    
  LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<LoginController>(
        builder: (controller) {
          return FlutterLogin(
            onLogin: (LoginData data) async {
              final result = await controller.authUser(data);
              if (result == null) {
                Get.offAll(() => HomeView()); // Navigate to Home on success
              } else {
                return result; // Show error if credentials are invalid
              }
            },
            onRecoverPassword: controller.recoverPassword,
            onSignup: (SignupData data) async {
              final result = await controller.signupUser(data);
              if (result == null) {
                Get.snackbar(
                  'Success',
                  'Signup successful',
                  snackPosition: SnackPosition.BOTTOM, // Position it at the bottom
                  backgroundColor:Color(0xFF534489), // Set background color for success
                  colorText: Colors.white, // Text color for better visibility
                  margin: EdgeInsets.all(
                    10,
                  ), // Optional: add margin around the snackbar
                  padding: EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 10,
                  ), // Optional: add padding for better spacing
                  borderRadius:
                      10, // Optional: add border radius for rounded corners
                  duration: Duration(
                    seconds: 2,
                  ), // Optional: set duration for how long the snackbar stays
                );
          
                // Navigate to home or other screen as needed
                Get.offAll(() => HomeView());
              } else {
                return result; // Show error if signup fails
              }
            },
            userValidator: controller.userValidator,
            passwordValidator: controller.passwordValidator,
          );
        }
      ),
    );
  }
}
