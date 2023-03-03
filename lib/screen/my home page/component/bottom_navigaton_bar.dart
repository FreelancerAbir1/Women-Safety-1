
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

import '../../../constant.dart';
import 'pages.dart';

class BottomNavigationState extends StatefulWidget {
  const BottomNavigationState({super.key});

  @override
  State<BottomNavigationState> createState() => _BottomNavigationStateState();
}

class _BottomNavigationStateState extends State<BottomNavigationState> {
  int _page = 0;

  final GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        key: _bottomNavigationKey,
        index: _page,
        height: 60.0,
        items: const <Widget>[
          Icon(
            Icons.home,
            size: 30,
            color: kTextLightColor,
          ),
          Icon(
            Icons.contacts,
            size: 30,
            color: kTextLightColor,
          ),
          Icon(
            Icons.chat,
            size: 30,
            color: kTextLightColor,
          ),
          Icon(
            Icons.perm_identity,
            size: 30,
            color: kTextLightColor,
          ),
          Icon(
            Icons.star_border,
            size: 30,
            color: kTextLightColor,
          ),
        ],
        color: Colors.blueAccent,
        buttonBackgroundColor: kPrimaryColor,
        backgroundColor: Colors.white,
        animationCurve: Curves.easeInOut,
        animationDuration: const Duration(milliseconds: 600),
        onTap: (index) {
          setState(() {
            _page = index;
          });
        },
        letIndexChange: (index) => true,
      ),
      body: pages[_page],
    );
  }
}
