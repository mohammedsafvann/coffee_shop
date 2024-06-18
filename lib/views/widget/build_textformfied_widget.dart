import 'package:flutter/material.dart';

import '../../utils/constants.dart';
import 'build_icon_widget.dart';

class BuildTextFormFieldWidget extends StatefulWidget {
  final String hintText;
  final Widget prefixIcon;
  final TextEditingController controller;
  final Function onChanged;
  const BuildTextFormFieldWidget(
      {super.key,
      required this.hintText,
      required this.prefixIcon,
      required this.controller,
      required this.onChanged});

  @override
  State<BuildTextFormFieldWidget> createState() =>
      _BuildTextFormFieldWidgetState();
}

class _BuildTextFormFieldWidgetState extends State<BuildTextFormFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: Constants.kitGradients[0],
      controller: widget.controller,
      onChanged: (value) {
        widget.onChanged(value);
      },
      style: TextStyle(color: Constants.kitGradients[0]),
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(8),
        filled: true,
        fillColor: Constants.kitGradients[5].withOpacity(0.05),
        hintText: widget.hintText,
        hintStyle: TextStyle(
            color: Constants.kitGradients[5].withOpacity(0.6), fontSize: 16),
        prefixIcon: widget.prefixIcon,
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.zero,
        ),
      ),
    );
  }
}
