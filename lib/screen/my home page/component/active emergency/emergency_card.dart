import 'package:flutter/material.dart';

import '../../../../constant.dart';

class EmergencyCard extends StatelessWidget {
  const EmergencyCard({
    super.key,
    required this.callNb,
    required this.headline,
    this.callOnPressed,
    required this.serviceImage,
  });
  final String callNb;
  final String headline;
  final Function()? callOnPressed;
  final String serviceImage;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Container(
          height: 200,
          width: 250,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                kPrimaryColor,
                kPrimaryColor,
                kPrimaryColor,
                kPrimaryColor.withAlpha(1),
              ],
            ),
            borderRadius: BorderRadius.circular(kDefaultPadding),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage(serviceImage),
                  radius: 30,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
                Text(
                  headline,
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: kTextLightColor,
                      ),
                ),
                Text(
                  callNb,
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                        color: kTextLightColor,
                      ),
                ),
                ElevatedButton.icon(
                  onPressed: callOnPressed,
                  icon: const Icon(Icons.call),
                  label: const Text('Call now'),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
