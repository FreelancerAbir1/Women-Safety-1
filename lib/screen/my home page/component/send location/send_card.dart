import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class ShareButton extends StatelessWidget {
  const ShareButton({
    super.key,
  });

  final String lottieFile =
      'https://assets10.lottiefiles.com/packages/lf20_9ti102vm.json';

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: SizedBox(
          height: 100,
          width: 250,
          child: Row(
            children: [
              const Expanded(
                flex: 2,
                child: ListTile(
                  title: AutoSizeText(
                    'Location',
                    maxLines: 1,
                  ),
                  subtitle: AutoSizeText(
                    'Send Your Location',
                    maxLines: 1,
                  ),
                ),
              ),
              Expanded(
                  flex: 2,
                  child: Container(
                    child: Lottie.network(lottieFile, fit: BoxFit.fitHeight),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
