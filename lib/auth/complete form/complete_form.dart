import 'package:flutter/material.dart';

import '../../constant.dart';
import 'component/body.dart';

class CompleteForm extends StatelessWidget {
  static const route = '/completeform';

  const CompleteForm({super.key, required this.email, required this.password});
  final TextEditingController email;
  final TextEditingController password;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kTextLightColor,
      ),
      body:   SafeArea(child: Body(email: email,password: password,)),
    );
  }
}
