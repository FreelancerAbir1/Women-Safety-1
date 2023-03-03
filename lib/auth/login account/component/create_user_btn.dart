import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../../../constant.dart';

class CreateUserButton extends StatelessWidget {
  const CreateUserButton({
    super.key,
    required this.text,
    required this.onTap,
  });
  final String text;
  final GestureTapCallback onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AutoSizeText(
        text,
        style: Theme.of(context).textTheme.headlineSmall!.copyWith(
              color: kPrimaryColor,
              fontWeight: FontWeight.bold,
            ),
        maxLines: 1,
      ),
    );
  }
}
