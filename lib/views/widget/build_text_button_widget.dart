import 'package:flutter/material.dart';

import 'build_text_widget.dart';

class BuildTextButtonWidget extends StatefulWidget {
  final String text;
  final Color? color;
  final FontWeight? fontWeight;
  final Function onPress;
  const BuildTextButtonWidget(
      {super.key,
      required this.text,
      this.color,
      this.fontWeight,
      required this.onPress});

  @override
  State<BuildTextButtonWidget> createState() => _BuildTextButtonWidgetState();
}

class _BuildTextButtonWidgetState extends State<BuildTextButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        widget.onPress!();
      },
      child: BuildTextWidget(
        fontFamily: 'Helvetica.ttf',
        size: 15,
        isUnderlined: true,
        text: widget.text,
        color: widget.color,
        fontWeight: widget.fontWeight,
      ),
    );
  }
}
