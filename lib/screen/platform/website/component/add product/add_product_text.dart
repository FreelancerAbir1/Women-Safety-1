
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class AddProductText extends StatelessWidget {
  const AddProductText({
    super.key, required this.text,
  });
  final String text;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context)
          .textTheme
          .displaySmall!
          .copyWith(fontWeight: FontWeight.bold, fontSize: 20.sp),
    );
  }
}
