import 'dart:async';

import 'package:coffee/Utils/constants.dart';
import 'package:coffee/Utils/utils.dart';
import 'package:coffee/utils/shared_preference.dart';
import 'package:coffee/views/screens/home_screen.dart';
import 'package:coffee/views/screens/login_screen.dart';
import 'package:coffee/views/widget/build_text_widget.dart';
import 'package:coffee/views/widget/home_menu.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool isLogin = false;
  getData() async {
    bool? isLogin = await SharedPreferenceHelper.getBoolValue();

    Timer(const Duration(seconds: 3), () {
      if (isLogin != null || isLogin == true) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => const HomeMenu(),
          ),
        );
      } else {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => const LoginView(),
          ),
        );
      }
    });
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: screenHeight(context),
      width: screenWidth(context),
      decoration: const BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.fill,
          image: AssetImage("assets/images/splash_image.jpeg"),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 100, left: 70),
        child: BuildTextWidget(
          text: 'Enjoy.\n'
              'premium coffee.\n'
              'with the coolest.\n'
              'of flavours',
          fontFamily: "Bukhari Script.ttf",
          fontWeight: FontWeight.w600,
          size: 25,
          color: Constants.kitGradients[18].withOpacity(.70),
        ),
      ),
    );
  }
}
