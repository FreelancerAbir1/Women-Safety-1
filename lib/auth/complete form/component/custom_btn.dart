
import 'package:flutter/material.dart';

import '../../../constant.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final Function()? onPress;

  final bool onRelaod;
  const CustomButton({
    super.key,
    required this.text,
    required this.onPress,
    required this.onRelaod ,
  });
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: 50,
      width: size.width / 1.1,
      decoration: const BoxDecoration(),
      child: MaterialButton(
          color: kPrimaryColor,
          onPressed: onPress,
          child: onRelaod == true
              ? Text(
                  text,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: kTextLightColor,
                    fontSize: 20,
                  ),
                )
              : const Center(
                  child: CircularProgressIndicator(),
                )),
    );
  }
}