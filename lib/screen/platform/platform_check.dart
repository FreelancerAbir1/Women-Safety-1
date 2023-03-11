
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class PlatformCheck extends StatelessWidget {
  const PlatformCheck({
    super.key,
    required this.android,
    required this.windows, required this.website,
  });
  final Widget android;
  final Widget windows;
  final Widget website;
  @override
  Widget build(BuildContext context) {
    if (kIsWeb) {
      return  website ;
    }
    return LayoutBuilder(builder: (context, orientation) {
      if (orientation.maxWidth >= 480) {
        return windows;
      }
      return android;
    });
  }
}
