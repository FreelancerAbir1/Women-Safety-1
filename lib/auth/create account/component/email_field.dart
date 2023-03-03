import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final String hintText;
  final String labelText;
  final IconData icon;
  final bool obscureText;
  final String? Function(String?)? validate;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final Function(String)? onChange;
  final Widget? suffixIcon;
  final FocusNode focusNode;
  final Function(String) onFieldSubmitted;
  final TextInputAction textInputAction;
  const CustomTextFormField({
    Key? key,
    required this.hintText,
    required this.labelText,
    required this.icon,
    required this.validate,
    required this.controller,
    required this.keyboardType,
    required this.onChange,
    required this.suffixIcon,
    required this.obscureText,
    required this.focusNode,
    required this.onFieldSubmitted,
    required this.textInputAction,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: TextFormField(
        textInputAction: textInputAction,
        onFieldSubmitted: onFieldSubmitted,
        focusNode: focusNode,
        obscureText: obscureText,
        onChanged: onChange,
        keyboardType: keyboardType,
        controller: controller,
        validator: validate,
        decoration: InputDecoration(
          border: InputBorder.none,
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.blue),
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
          prefixIcon: Icon(icon),
          suffixIcon: suffixIcon,
          hintText: hintText,
          labelText: labelText,
        ),
      ),
    );
  }
}
