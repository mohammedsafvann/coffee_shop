import 'package:flutter/material.dart';

import '../../utils/constants.dart';
import 'build_text_widget.dart';

class BuildCommonButtonWidget extends StatefulWidget {
  final String buttonName;
  final double buttonWidth;
  final double buttonHeight;
  final String? fontfamily;
  final double? size;
  final Function? onPress;

  const BuildCommonButtonWidget(
      {super.key,
      required this.buttonName,
      required this.buttonWidth,
      required this.buttonHeight,
      this.fontfamily,
      this.size,
      this.onPress});

  @override
  State<BuildCommonButtonWidget> createState() =>
      _BuildCommonButtonWidgetState();
}

class _BuildCommonButtonWidgetState extends State<BuildCommonButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: ShapeDecoration(
        shape: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      ),
      width: widget.buttonWidth,
      height: widget.buttonHeight,
      child: ElevatedButton(
        onPressed: () {
          widget.onPress!();
        },
        child: BuildTextWidget(
            isUnderlined: false,
            text: widget.buttonName,
            color: Constants.kitGradients[15],
            fontWeight: FontWeight.w700,
            fontFamily: widget.fontfamily,
            size: widget.size),
      ),
    );
  }
}
