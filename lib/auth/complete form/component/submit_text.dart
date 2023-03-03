import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../constant.dart';

class SubmitText extends StatelessWidget {
  final String text;
  const SubmitText({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AutoSizeText(
      text,
      style: Theme.of(context)
          .textTheme
          .titleMedium!
          .copyWith(color: kPrimaryColor, fontSize: 24.sp),
      maxLines: 1,
    );
  }
}
