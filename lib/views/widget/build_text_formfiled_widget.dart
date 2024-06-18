import 'package:flutter/material.dart';

import '../../utils/constants.dart';

class BuildTexFormFieldWidget extends StatefulWidget {
  final String? Function(String?)? validation;
  final TextEditingController controller;
  final bool? obscure;
  final String hintText;
  final Widget? suffix;
  final double? radius;
  const BuildTexFormFieldWidget(
      {super.key,
      this.validation,
      required this.controller,
      this.obscure,
      required this.hintText,
      this.suffix,
      this.radius});

  @override
  State<BuildTexFormFieldWidget> createState() =>
      _BuildTexFormFieldWidgetState();
}

class _BuildTexFormFieldWidgetState extends State<BuildTexFormFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: Constants.kitGradients[0],
      validator: (value) => widget.validation!(value),
      controller: widget.controller,
      onTap: () {},
      style: TextStyle(
        color: Constants.kitGradients[0],
      ),
      obscureText: widget.obscure ?? false,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(10),
        fillColor: Constants.kitGradients[5].withOpacity(0.05),
        filled: true,
        hintText: widget.hintText,
        hintStyle: TextStyle(
          color: Constants.kitGradients[5].withOpacity(0.6),
          fontFamily: 'Helvetica.ttf',
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(widget.radius ?? 0),
          borderSide: BorderSide(
            color: Constants.kitGradients[5].withOpacity(0.05),
          ),
        ),
        //
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(widget.radius ?? 0),
          borderSide: BorderSide(
            width: 1,
            color: Constants.kitGradients[5].withOpacity(0.05),
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(widget.radius ?? 0),
          borderSide: BorderSide(
            color: Constants.kitGradients[5].withOpacity(0.05),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(widget.radius ?? 0),
          borderSide: BorderSide(
            color: Constants.kitGradients[5].withOpacity(0.05),
          ),
        ),
        suffixIcon: widget.suffix,
      ),
    );
  }
}
