import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../../../../constant.dart';

class LocationCard extends StatelessWidget {
  const LocationCard({
    Key? key,
    required this.locationImg,
    required this.text,
  }) : super(key: key);
  final String locationImg;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(kDefaultPadding),
      ),
      child: Padding(
        padding: const EdgeInsets.all(5),
        child: Column(
          children: [
            
            ClipOval(
              child: Container(
                height: 80,
                width: 80,
                decoration: BoxDecoration(
                  borderRadius:
                      BorderRadius.circular(kDefaultPadding + kDefaultPadding),
                ),
                child: Image.network(
                  locationImg,
                  fit: BoxFit.fill,
                ),
              ),
            ),
            AutoSizeText(
              text,
              maxLines: 1,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: kTextColor,
              ),
            ),
          
          ],
        ),
      ),
    );
  }
}
