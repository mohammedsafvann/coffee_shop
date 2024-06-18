import 'package:flutter/material.dart';

import '../../utils/constants.dart';

class BuildTextWidget extends StatefulWidget {
  final String text;
  final Color? color;
  final TextDecoration? textDecoration;
  final double? size;
  final bool? isUnderlined;
  final FontWeight? fontWeight;
  final String? fontFamily;
  final Color? backgroundColor;
  const BuildTextWidget({
    super.key,
    required this.text,
    this.color,
    this.size,
    this.fontWeight,
    this.textDecoration,
    this.fontFamily,
    this.isUnderlined,
    this.backgroundColor,
  });

  @override
  State<BuildTextWidget> createState() => _BuildTextWidgetState();
}

class _BuildTextWidgetState extends State<BuildTextWidget> {
  @override
  Widget build(BuildContext context) {
    return Text(
      maxLines: 5,
      overflow: TextOverflow.ellipsis,
      widget.text,
      style: TextStyle(
          decoration: widget.textDecoration ?? TextDecoration.none,
          color: widget.color,
          // decorationStyle: TextDecorationStyle.dashed,
          decorationColor: Constants.kitGradients[0],
          fontSize: widget.size,
          fontWeight: widget.fontWeight,
          fontFamily: widget.fontFamily,
          backgroundColor: widget.backgroundColor),
    );
  }
}
