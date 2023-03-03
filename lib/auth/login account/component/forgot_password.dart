import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../../../constant.dart';

class ForgottPassword extends StatelessWidget {
  const ForgottPassword({
    super.key,
    required this.text,
    required this.txt,
    required this.onTap,
  });
  final String text;
  final String txt;
  final GestureTapCallback onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AutoSizeText(
        '$text        $txt',
        style: Theme.of(context).textTheme.titleLarge!.copyWith(
              color: kPrimaryColor,
            ),
        maxLines: 1,
      ),
    );
  }
}
