import 'package:flutter/material.dart';

import '../../../../constant.dart';

class SaveLifeHeadline extends StatelessWidget {
  const SaveLifeHeadline({
    super.key,
    required this.text,
  });
  final String text;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text,
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: kPrimaryColor,
                ),
          ),
          const Icon(
            Icons.arrow_forward,
          ),
        ],
      ),
    );
  }
}
