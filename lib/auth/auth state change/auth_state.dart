import 'dart:async';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:women_safety_1/auth/login%20account/login_screen.dart';
import 'package:women_safety_1/screen/my%20home%20page/component/bottom_navigaton_bar.dart';


class AuthState extends StatefulWidget {
  const AuthState({Key? key}) : super(key: key);

  @override
  State<AuthState> createState() => _AuthStateState();
}

class _AuthStateState extends State<AuthState> {
  Future authStateChange() async {
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => const LoginScreen(),
        ));
      } else {
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => const BottomNavigationState(),
        ));
      }
    });
  }

  @override
  void initState() {
    Timer(const Duration(seconds: 5), () {
      authStateChange();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return   Scaffold(
      body: Center(
        child: Column(
          children: [
            const CircularProgressIndicator(),
            AutoSizeText('Checking Internet Connection..',style: Theme.of(context).textTheme.labelLarge,)
          ],
        ),
      ),
    );
  }
}
