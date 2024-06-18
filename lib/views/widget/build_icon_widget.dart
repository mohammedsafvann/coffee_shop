import 'package:flutter/material.dart';

class BuildIconWidget extends StatelessWidget {
  final IconData iconData;
  final double? size;
  final Color? color;
  const BuildIconWidget(
      {super.key,
      required this.iconData,
       this.size,
       this.color});

  @override
  Widget build(BuildContext context) {
    return Icon(
      iconData,
      size: size,
      color: color,
    );
  }
}
