
import 'package:flutter/material.dart';

class PlatformCheck extends StatelessWidget {
  const PlatformCheck({
    super.key,
    required this.android,
    required this.windows,
  });
  final Widget android;
  final Widget windows;
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, orientation) {
      if (orientation.maxWidth >= 480) {
        return windows;
      }
      return android;
    });
  }
}
