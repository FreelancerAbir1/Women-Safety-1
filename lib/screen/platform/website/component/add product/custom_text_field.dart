import 'package:flutter/material.dart';

import '../../../../../constant.dart';

class CustomField extends StatelessWidget {
  final String hintText;
  final String labelText;
  final TextEditingController controller;

  final Function(String)? onChange;

  final Function(String) onFieldSubmitted;

  const CustomField({
    Key? key,
    required this.hintText,
    required this.labelText,
    required this.controller,
    required this.onChange,
    required this.onFieldSubmitted,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: TextFormField(
        onFieldSubmitted: onFieldSubmitted,
        onChanged: onChange,
        controller: controller,
        decoration: InputDecoration(
          border: buildOulineInputBorder(),
          focusedBorder: buildOulineInputBorder(),
          errorBorder: buildOulineInputBorder(),
          focusedErrorBorder: buildOulineInputBorder(),
          hintText: hintText,
          labelText: labelText,
        ),
      ),
    );
  }
}
