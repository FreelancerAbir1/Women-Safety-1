
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../constant.dart';

class InformationText extends StatelessWidget {
  final String text;
  const InformationText({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context)
          .textTheme
          .titleMedium!
          .copyWith(color: kTextColor, fontSize: 16.sp),
    );
  }
}
