import 'dart:ffi';

import 'package:flutter/material.dart';

import 'build_icon_widget.dart';

class BuildIconButtonWidget extends StatefulWidget {
  final IconData icon;
  final double iconSize;
  final Color iconColor;
  final Function onPressed;
  const BuildIconButtonWidget(
      {super.key,
      required this.icon,
      required this.iconSize,
      required this.iconColor,
      required this.onPressed});

  @override
  State<BuildIconButtonWidget> createState() => _BuildIconButtonWidgetState();
}

class _BuildIconButtonWidgetState extends State<BuildIconButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () {
          widget.onPressed();
        },
        icon: BuildIconWidget(
          iconData: widget.icon,
          color: widget.iconColor,
          size: widget.iconSize,
        ));
  }
}
