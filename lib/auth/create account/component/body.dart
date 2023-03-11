import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:women_safety_1/auth/create%20account/component/password_field.dart';
import 'package:women_safety_1/auth/login%20account/component/login_button.dart';

import '../../../constant.dart';
import '../../complete form/complete_form.dart';
import 'email_field.dart';
import 'register_text.dart';

class Body extends StatelessWidget {
  Body({
    super.key,
  });

  final FocusNode emailFocus = FocusNode();

  final FocusNode passwordFocus = FocusNode();

  final formKey = GlobalKey<FormState>();

  final String lottieFile =
      'https://assets4.lottiefiles.com/packages/lf20_vj11y6su.json';

  final TextEditingController emailAddress = TextEditingController();

  final TextEditingController password = TextEditingController();

  Future createUserWithEmailAndPassword(context) async {
    try {
      if (emailAddress.text.isNotEmpty && password.text.isNotEmpty) {
        final credential =
            await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailAddress.text,
          password: password.text,
        );
        if (credential.user != null) {
          buildAwesomeDialog(context,
              title: 'Good job!',
              desc: 'Create user successfully',
              btnCancelOnPress: () {},
              btnOkOnPress: () {},
              onDismissCallback: (v) {},
              dialogType: DialogType.success);

          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => CompleteForm(
                  email: emailAddress,
                  password: password,
                ),
              ));
        }
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        buildAwesomeDialog(context,
            title: 'Warning!',
            desc: 'The password provided is too weak.',
            btnCancelOnPress: () {},
            btnOkOnPress: () {},
            onDismissCallback: (v) {},
            dialogType: DialogType.warning);
      } else if (e.code == 'email-already-in-use') {
        buildAwesomeDialog(context,
            title: 'Warning!',
            desc: 'The account already exists for that email.',
            btnCancelOnPress: () {},
            btnOkOnPress: () {},
            onDismissCallback: (v) {},
            dialogType: DialogType.warning);
      }
    } catch (e) {
      flutterToast(text: '$e');
    }
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
                  const RegisterAsChildText(
                    text: 'Register As Child',
                  ),
                  Lottie.network(
                    lottieFile,
                    fit: BoxFit.fill,
                    height: 30.h,
                    width: 30.h,
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
                  PasswordField(
                    controller: password,
                    onFieldSubmitted: (value) {
                      if (formKey.currentState!.validate()) {
                        createUserWithEmailAndPassword(context);
                      }
                      return '';
                    },
                    labelText: 'Password',
                    suffixIcon: Icons.visibility,
                    hintText: 'Password',
                    prefixIcon: Icons.lock,
                    focusNode: passwordFocus,
                    textInputAction: TextInputAction.done,
                  ),
                  CustomButton(
                    text: 'Register',
                    onPress: () {
                      if (formKey.currentState!.validate()) {
                        createUserWithEmailAndPassword(context);
                      }
                    },
                    onRelaod: true,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
