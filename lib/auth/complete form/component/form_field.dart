
import 'package:flutter/material.dart';

import '../../../constant.dart';

class CustomFormField extends StatelessWidget {
  final String hintText;
  final String? Function(String?)? validate;
  final Function(String)? onChange;
  final Widget suffix;
  final TextEditingController controller;
  final Function(String) onFieldSubmitted;
  final FocusNode focusNode;
  final TextInputAction textInputAction;
  const CustomFormField({
    Key? key,
    required this.hintText,
    this.onChange,
    required this.suffix,
    required this.controller,
    required this.onFieldSubmitted,
    required this.focusNode,
    required this.textInputAction,
    required this.validate,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autofocus: true,
      textInputAction: textInputAction,
      onFieldSubmitted: onFieldSubmitted,
      focusNode: focusNode,
      controller: controller,
      decoration: InputDecoration(
          hintText: hintText,
          hintStyle: const TextStyle(color: kTextColor),
          suffixIcon: suffix),
      validator: validate,
      onChanged: (value) {},
    );
  }
}