// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:women_safety_1/auth/create%20account/create_account.dart';
import 'package:women_safety_1/screen/my%20home%20page/component/bottom_navigaton_bar.dart';

import '../../../constant.dart';
import 'create_user_btn.dart';
import 'forgot_password.dart';
import 'login_button.dart';
import 'text_field.dart';
import 'text_user.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final FocusNode emailFocus = FocusNode();

  final FocusNode passwordFocus = FocusNode();

  final formKey = GlobalKey<FormState>();

  final String lottieFile =
      'https://assets4.lottiefiles.com/packages/lf20_vj11y6su.json';

  final TextEditingController emailAddress = TextEditingController();

  final TextEditingController password = TextEditingController();
  @override
  void dispose() {
    emailAddress.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) { 
    var width = MediaQuery.of(context).size.width;
    return LayoutBuilder(builder: (context, constraints) {
      return SizedBox(
        width: width,
        child: Padding(
          padding: constraints.maxWidth > 480
              ? EdgeInsets.symmetric(horizontal: 30.w)
              : const EdgeInsets.all(0),
          child: Form(
            key: formKey,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const UserLoginText(text: 'User Login'),
                  Lottie.network(
                    lottieFile,
                    fit: BoxFit.fill,
                    height: 30.h,
                    width: 30.h,
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  CustomTextFormField(
                    hintText: 'Email',
                    focusNode: emailFocus,
                    controller: emailAddress,
                    icon: Icons.email,
                    keyboardType: TextInputType.visiblePassword,
                    labelText: 'Email',
                    obscureText: false,
                    onChange: (value) {},
                    onFieldSubmitted: (value) {},
                    suffixIcon: const Icon(
                      Icons.visibility,
                    ),
                    textInputAction: TextInputAction.next,
                    validate: validateEmail,
                  ),
                  CustomTextFormField(
                    hintText: 'Password',
                    focusNode: passwordFocus,
                    controller: password,
                    icon: Icons.password,
                    keyboardType: TextInputType.visiblePassword,
                    labelText: 'Password',
                    obscureText: false,
                    onChange: (value) {},
                    onFieldSubmitted: (value) {
                      if (formKey.currentState!.validate()) {
                        signInWithEmailAndPassword(context);
                      }
                    },
                    suffixIcon: const Icon(
                      Icons.visibility,
                    ),
                    textInputAction: TextInputAction.done,
                    validate: validatePassword,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomButton(
                    onPress: () {
                      if (formKey.currentState!.validate()) {
                        signInWithEmailAndPassword(context);
                      }
                    },
                    text: 'Login Here',
                    onRelaod: true,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ForgottPassword(
                    onTap: () {},
                    text: 'Forget Password?',
                    txt: 'Click Here',
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CreateUserButton(
                    text: 'Create New User',
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const CreateAccount(),
                      ));
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }

  Future signInWithEmailAndPassword(context) async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailAddress.text,
        password: password.text,
      );
      if (credential.user != null) {
        buildAwesomeDialog(context,
            title: 'Login Success',
            desc: 'Lets your journey',
            btnCancelOnPress: () {},
            btnOkOnPress: () {},
            onDismissCallback: (v) {},
            dialogType: DialogType.success);

        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => const BottomNavigationState(),
        ));
        emailAddress.clear();
        password.clear();
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        buildAwesomeDialog(context,
            title: 'Warning!',
            desc: 'No user found for that email.',
            btnCancelOnPress: () {},
            btnOkOnPress: () {},
            onDismissCallback: (v) {},
            dialogType: DialogType.error);
      } else if (e.code == 'wrong-password') {
        buildAwesomeDialog(context,
            title: 'Warning!',
            desc: 'Wrong password provided for that user.',
            btnCancelOnPress: () {},
            btnOkOnPress: () {},
            onDismissCallback: (v) {},
            dialogType: DialogType.error);
      }
    }
  }
}
