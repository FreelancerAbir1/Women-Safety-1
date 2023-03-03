import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../../../constant.dart';

class UserLoginText extends StatelessWidget {
  const UserLoginText({
    super.key,
    required this.text,
  });
  final String text;
  @override
  Widget build(BuildContext context) {
    return AutoSizeText(
      text,
      style: Theme.of(context)
          .textTheme
          .displayMedium!
          .copyWith(color: kPrimaryColor, fontWeight: FontWeight.bold),
      maxLines: 1,
    );
  }
}
