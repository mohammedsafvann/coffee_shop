import 'package:coffee/views/screens/home_screen.dart';
import 'package:coffee/views/widget/build_google_sign_in_button_widget.dart';

import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../controller/login_controller.dart';
import '../../utils/utils.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  LoginController loginController = LoginController();
  final GoogleSignIn googleSignIn = GoogleSignIn();
  bool isLoading = false;
  bool login = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Container(
          height: screenHeight(context),
          width: screenWidth(context),
          decoration: const BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage("assets/images/image 2.jpg"),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: screenHeight(context, dividedBy: 2),
              ),
              isLoading
                  ? const Center(
                      child: CircularProgressIndicator(color: Colors.white),
                    )
                  : BuildGoogleSignInButton(
                      onPress: () async {
                        setState(() {
                          isLoading = true;
                        });
                        login = await loginController.signInWithGoogle();
                        login == true
                            ? pushAndReplacement(context, HomeScreen())
                            : const LoginView();
                      },
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
