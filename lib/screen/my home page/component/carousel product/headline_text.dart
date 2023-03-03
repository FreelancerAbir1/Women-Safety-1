import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class HeadlineText extends StatelessWidget {
  const HeadlineText({
    super.key,
    required this.text,
  });
  final String text;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context).textTheme.displaySmall!.copyWith(
          fontStyle: FontStyle.italic,
          fontWeight: FontWeight.bold,
          fontSize: 20.sp),
      textAlign: TextAlign.center,
      maxLines: 1,
    );
  }
}
