import 'package:flutter/material.dart';
import 'package:password_validated_field/password_validated_field.dart';

class PasswordField extends StatelessWidget {
  const PasswordField(
      {Key? key,
      required this.labelText,
      required this.suffixIcon,
      required this.hintText,
      required this.prefixIcon,
      required this.focusNode,
      required this.onFieldSubmitted,
      required this.textInputAction,
      required this.controller})
      : super(key: key);
  final String labelText;
  final IconData suffixIcon;
  final String hintText;
  final IconData prefixIcon;
  final FocusNode focusNode;
  final String Function(String)? onFieldSubmitted;
  final TextInputAction textInputAction;
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return PasswordValidatedFields(
      textEditingController: controller,
      textInputAction: textInputAction,
      onFieldSubmitted: onFieldSubmitted,
      focusNode: focusNode,
      inActiveIcon: Icons.cancel,
      activeIcon: Icons.done_all,
      inputDecoration: InputDecoration(
        prefixIcon: Icon(prefixIcon),
        suffixIcon: Icon(suffixIcon),
        hintText: hintText,
        labelText: labelText,
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.transparent),
          borderRadius: BorderRadius.circular(10.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.green),
          borderRadius: BorderRadius.circular(10.0),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.red),
          borderRadius: BorderRadius.circular(10.0),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.red),
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }
}
