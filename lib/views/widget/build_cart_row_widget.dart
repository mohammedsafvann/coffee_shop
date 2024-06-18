import 'package:flutter/material.dart';

import '../../Utils/constants.dart';
import '../../Utils/utils.dart';
import 'build_text_widget.dart';

class BuildCartRowWidget extends StatefulWidget {
  final String? infoText;
  final String? resultText;
  final double? boxWidth;
  const BuildCartRowWidget({
    super.key,
    this.infoText,
    this.resultText,
    this.boxWidth,
  });

  @override
  State<BuildCartRowWidget> createState() => _BuildCartRowWidgetState();
}

class _BuildCartRowWidgetState extends State<BuildCartRowWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        const SizedBox(
          width: 10,
        ),
        SizedBox(
          width: screenWidth(context, dividedBy: 3),
          child: BuildTextWidget(
            text: widget.infoText.toString(),
            color: Constants.kitGradients[5].withOpacity(.6),
            fontFamily: "Helvetica.ttf",
            fontWeight: FontWeight.w400,
            size: 16,
          ),
        ),
        const Spacer(),
        BuildTextWidget(
          text: "INR ",
          color: Constants.kitGradients[0],
          fontFamily: "Helvetica.ttf",
          fontWeight: FontWeight.w400,
          size: 16,
        ),
        BuildTextWidget(
          text: widget.resultText.toString(),
          color: Constants.kitGradients[0],
          fontFamily: "Helvetica.ttf",
          fontWeight: FontWeight.w400,
          size: 16,
        )
      ],
    );
  }
}
