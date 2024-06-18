import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../utils/constants.dart';
import '../../utils/utils.dart';
import 'build_text_widget.dart';

class BuildGoogleSignInButton extends StatefulWidget {
  final void Function() onPress;

  const BuildGoogleSignInButton({super.key, required this.onPress});

  @override
  State<BuildGoogleSignInButton> createState() =>
      _BuildGoogleSignInButtonState();
}

class _BuildGoogleSignInButtonState extends State<BuildGoogleSignInButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 53,
      width: screenWidth(context, dividedBy: 1.4),
      child: OutlinedButton(
        style: ButtonStyle(
          shape: MaterialStatePropertyAll(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18),
            ),
          ),
        ),
        onPressed: () {
          widget.onPress();
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              "assets/images/logos_google-icon.svg",
              height: 18,
              width: 18,
              color: Constants.kitGradients[0],
            ),
            const SizedBox(
              width: 20,
            ),
            BuildTextWidget(
              fontFamily: 'GeneralSans-Regular.ttf',
              size: 16,
              isUnderlined: false,
              text: "Continue with Google",
              color: Constants.kitGradients[0],
              fontWeight: FontWeight.w500,
            ),
          ],
        ),
      ),
    );
  }
}
