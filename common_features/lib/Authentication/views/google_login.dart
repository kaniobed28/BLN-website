import 'package:common_features/Authentication/controllers/with_google_controller.dart';
import 'package:common_features/firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:google_sign_in/google_sign_in.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
GoogleSignIn googleSignIn = GoogleSignIn(
    scopes: ['kaniobed28@gmail.com'],
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: LoginPage(),
    );
  }
}


class LoginPage extends StatelessWidget {
  final AuthController _authController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Google Sign-In'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            _authController.signInWithGoogle().then((userCredential) {
              // Handle successful sign-in
            }).catchError((error) {
              // Handle sign-in errors
            });
          },
          child: Text('Sign in with Google'),
        ),
      ),
    );
  }
}
