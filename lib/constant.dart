import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

const kPrimaryColor = Color(0xFFFF7643);
const kTextColor = Color(0xFF757575);
const kTextLightColor = Color(0xFFFAFAFA);
const kDefaultFontBold = TextStyle(fontWeight: FontWeight.bold);
const kDefaultFontNormal = TextStyle(fontWeight: FontWeight.normal);
const kDefaultPadding = 21.0;

  OutlineInputBorder buildOulineInputBorder() {
    return OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.blue),
      borderRadius: BorderRadius.circular(10.0),
    );
  }

Orientation orientation = Orientation.landscape;
//! userProfile stream fetch
final userProfileCollection = FirebaseFirestore.instance
    .collection('user-profile')
    .doc(FirebaseAuth.instance.currentUser!.email);
//! collection stream fetch
final cartItemCollection = FirebaseFirestore.instance
    .collection('cart-items')
    .doc(FirebaseAuth.instance.currentUser!.uid)
    .collection('added-cart-items');
//! Flutter toast here
flutterToast({required text}) {
  Fluttertoast.showToast(
      msg: text,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.SNACKBAR,
      timeInSecForIosWeb: 2,
      backgroundColor: Colors.grey,
      textColor: Colors.white,
      fontSize: 16.0);
}

String? validateName(String? fullName) {
  String patttern = r'^[a-z A-Z,.\-]+$';
  RegExp regExp = RegExp(patttern);
  if (fullName!.isEmpty) {
    return 'Please enter full name';
  } else if (!regExp.hasMatch(fullName)) {
    return 'Please enter valid full name';
  }
  return null;
}
 
AwesomeDialog buildAwesomeDialog(
  BuildContext context, {
  required title,
  required desc,
  required btnCancelOnPress,
  required btnOkOnPress,
  required onDismissCallback,
  required dialogType
}) {
  return AwesomeDialog(
    context: context,
    dialogType:dialogType,
    borderSide: const BorderSide(
      color: Colors.green,
      width: 2,
    ),
    width: 280,
    buttonsBorderRadius: const BorderRadius.all(
      Radius.circular(2),
    ),
    dismissOnTouchOutside: true,
    dismissOnBackKeyPress: true,
    onDismissCallback: onDismissCallback,
    headerAnimationLoop: true,
    animType: AnimType.bottomSlide,
    title: title,
    desc: desc,
    showCloseIcon: true,
    btnCancelOnPress: btnCancelOnPress,
    btnOkOnPress: btnOkOnPress,
  )..show();
}

String? validatePassword(String? value) {
  // RegExp regex =
  //     RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');

  var passNonNullValue = value ?? "";
  if (passNonNullValue.isEmpty) {
    return ("Password is required");
  } else if (passNonNullValue.length < 6) {
    return ("Password Must be more than 5 characters");
    // } else if (!regex.hasMatch(passNonNullValue)) {
    //   return ("Password should contain upper,lower,digit and Special character ");
  }
  return null;
}

String? validateEmail(String? value) {
  const pattern = r"(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'"
      r'*+/=?^_`{|}~-]+)*|"(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21\x23-\x5b\x5d-'
      r'\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])*")@(?:(?:[a-z0-9](?:[a-z0-9-]*'
      r'[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\[(?:(?:(2(5[0-5]|[0-4]'
      r'[0-9])|1[0-9][0-9]|[1-9]?[0-9]))\.){3}(?:(2(5[0-5]|[0-4][0-9])|1[0-9]'
      r'[0-9]|[1-9]?[0-9])|[a-z0-9-]*[a-z0-9]:(?:[\x01-\x08\x0b\x0c\x0e-\x1f\'
      r'x21-\x5a\x53-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])+)\])';
  final regex = RegExp(pattern);
  if (!regex.hasMatch(value!)) {
    return 'Enter a valid email address';
  } else if (value.isEmpty) {
    return 'Black field not allow';
  }
  return null;
}

String? validateMobile(String? value) {
  String patttern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
  RegExp regExp = RegExp(patttern);
  if (value!.isEmpty) {
    return 'Please enter mobile number';
  } else if (!regExp.hasMatch(value)) {
    return 'Please enter valid mobile number';
  }
  return null;
}
