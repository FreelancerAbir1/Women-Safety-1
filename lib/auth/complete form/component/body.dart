import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:women_safety_1/screen/my%20home%20page/home_page.dart';
import '../../../constant.dart';
import 'custom_btn.dart';
import 'form_field.dart';
import 'info_text.dart';
import 'submit_text.dart';

class Body extends StatefulWidget {
  const Body({super.key, required this.email, required this.password});
  final TextEditingController email;
  final TextEditingController password;

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  FirebaseAuth auth = FirebaseAuth.instance;
  User? currentUser = FirebaseAuth.instance.currentUser;
  List item = ['Male', 'Female'];
  String? items;
  final TextEditingController name = TextEditingController();
  final TextEditingController phone = TextEditingController();
  final TextEditingController birth = TextEditingController();
  final TextEditingController genders = TextEditingController();
  final TextEditingController age = TextEditingController();

  @override
  void dispose() {
    widget.email.dispose();
    widget.password.dispose();
    name.dispose();
    phone.dispose();
    birth.dispose();
    genders.dispose();
    age.dispose();
    fullNameNode.dispose();
    numberNode.dispose();
    dateNode.dispose();
    hourNode.dispose();
    ageNode.dispose();
    genderNode.dispose();
    super.dispose();
  }

  bool onReload = true;
  FocusNode fullNameNode = FocusNode();
  FocusNode numberNode = FocusNode();
  FocusNode dateNode = FocusNode();
  FocusNode hourNode = FocusNode();
  FocusNode ageNode = FocusNode();
  FocusNode genderNode = FocusNode();
//! Global Key
  final _key = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return LayoutBuilder(builder: (context, constraints) {
      return SizedBox(
        width: width,
        child: Padding(
          padding: constraints.maxWidth > 480
              ? EdgeInsets.symmetric(horizontal: 30.w)
              : const EdgeInsets.all(5),
          child: Form(
            key: _key,
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: kDefaultPadding),
                  const SubmitText(text: 'Submit the form to continue'),
                  const SizedBox(height: kDefaultPadding),
                  const InformationText(
                      text: 'We will not share information with anyone.'),
                  const SizedBox(height: kDefaultPadding),
                  CustomFormField(
                    textInputAction: TextInputAction.next,
                    focusNode: fullNameNode,
                    onFieldSubmitted: (value) {
                      FocusScope.of(context).requestFocus(numberNode);
                    },
                    controller: name,
                    suffix: const Text(''),
                    hintText: 'Full Name',
                    onChange: (p0) {},
                    validate: validateName,
                  ),
                  const SizedBox(height: kDefaultPadding),
                  CustomFormField(
                    textInputAction: TextInputAction.next,
                    focusNode: numberNode,
                    onFieldSubmitted: (value) {
                      FocusScope.of(context).requestFocus(dateNode);
                    },
                    controller: phone,
                    suffix: const Text(''),
                    hintText: 'Phone Number',
                    onChange: (p0) {},
                    validate: validateMobile,
                  ),
                  const SizedBox(height: kDefaultPadding),
                  pickDateTime(context),
                  const SizedBox(height: kDefaultPadding),
                  CustomFormField(
                    textInputAction: TextInputAction.next,
                    focusNode: genderNode,
                    onFieldSubmitted: (value) {
                      FocusScope.of(context).requestFocus(ageNode);
                    },
                    controller: genders,
                    suffix: DropdownButton(
                      hint: const Text('Choose'),
                      value: items,
                      items: item
                          .map(
                            (e) => DropdownMenuItem(
                              value: e,
                              child: Text(e),
                            ),
                          )
                          .toList(),
                      onChanged: (value) {
                        setState(() {
                          items = value as String?;
                        });
                      },
                    ),
                    hintText: items == null ? 'Gender' : items.toString(),
                    onChange: (p0) {},
                    validate: (value) {
                      return null;
                    },
                  ),
                  const SizedBox(height: kDefaultPadding),
                  CustomFormField(
                    textInputAction: TextInputAction.next,
                    focusNode: ageNode,
                    onFieldSubmitted: (value) {
                      FocusScope.of(context).unfocus();
                      if (_key.currentState!.validate()) {
                        sendProfileDataToDb();
                      } else {
                        setState(() {
                          onReload = true;
                        });
                      }
                    },
                    controller: age,
                    suffix: const Text(''),
                    hintText: 'Age',
                    onChange: (p0) {},
                    validate: (value) {
                      if (value!.length >= 3 || value.length <= 1) {
                        return 'Valid age';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: kDefaultPadding + kDefaultPadding),
                  CustomButton(
                    text: 'Submit',
                    onPress: () {
                      if (_key.currentState!.validate()) {
                        sendProfileDataToDb();
                      } else {
                        setState(() {
                          onReload = true;
                        });
                      }
                    },
                    onRelaod: onReload,
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }

  DateTimePicker pickDateTime(BuildContext context) {
    return DateTimePicker(
        focusNode: dateNode,
        dateHintText: 'Choose Birth Date',
        onFieldSubmitted: (value) {
          FocusScope.of(context).requestFocus(genderNode);
        },
        initialValue: '',
        decoration: const InputDecoration(
            hintText: 'Choose Date',
            suffixIcon: Icon(
              Icons.calendar_month,
            )),
        firstDate: DateTime(1990),
        lastDate: DateTime(2100),
        dateLabelText: 'Birth Date',
        onChanged: (val) => setState(() {
              birth.text = val;
            }),
        validator: (value) {
          if (value!.isEmpty) {
            return 'Please choose birthday date';
          }
          return null;
        },
        onSaved: (val) {});
  }

  final user = FirebaseFirestore.instance.collection('User Profile Data');
  Future sendProfileDataToDb() async {
    setState(() {
      onReload = false;
    });
    if (name.text.isNotEmpty &&
        phone.text.isNotEmpty &&
        items!.isNotEmpty &&
        age.text.isNotEmpty &&
        widget.email.text.isNotEmpty &&
        widget.password.text.isNotEmpty) {
      return user.doc(currentUser!.email).set({
        'email': widget.email.text,
        'password': widget.password.text,
        'name': name.text,
        'phone': phone.text,
        'birth': birth.text,
        'gender': items,
        'age': age.text,
      }).then((value) {
        flutterToast(text: 'User details add successfully');
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => const MyHomePage(),
        ));
        widget.email.clear();
        widget.password.clear();
        name.clear();
        phone.clear();
        birth.clear();
        genders.clear();
        age.clear();
        setState(() {
          onReload = true;
        });
      });
    } else {
      setState(() {
        onReload = true;
      });
    }
  }
}
