// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:women_safety_1/screen/my%20home%20page/component/carousel%20product/safe_webview.dart';
import 'package:women_safety_1/screen/my%20home%20page/component/save%20life%20location/save_life_headline.dart';

import '../../../auth/login account/login_screen.dart';
import 'active emergency/emergency_card.dart';
import 'active emergency/emergency_text.dart';
import 'carousel product/carousel_card.dart';
import 'carousel product/headline_text.dart';
import 'save life location/location.dart';
import 'send location/send_card.dart';

class Body extends StatefulWidget {
  const Body({
    super.key,
  });

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final firestore = FirebaseFirestore.instance;
  //! top product list here
  List carouselImageProduct = [];
  Future carouselImageFetch() async {
    final collection = await firestore.collection('Carousel Images').get();
    setState(() {
      for (int i = 0; i < collection.docs.length; i++) {
        carouselImageProduct.add(
          {
            'img': collection.docs[i]['img'],
            'headline': collection.docs[i]['headline'],
            'link': collection.docs[i]['link'],
          },
        );
      }
    });
  }

//! fire brigade fetch
  List emergencyNumberProduct = [];
  Future emergencyNumberFetch() async {
    final collection =
        await firestore.collection('Active Emergency Number').get();
    setState(() {
      for (int i = 0; i < collection.docs.length; i++) {
        emergencyNumberProduct.add(
          {
            'img': collection.docs[i]['img'],
            'field': collection.docs[i]['field'],
            'number': collection.docs[i]['number'],
          },
        );
      }
    });
  }

//!map location
  List exploreMapLocation = [];
  Future exploreMapLocationFetch() async {
    final collection = await firestore.collection('Explore SaveLife').get();
    setState(() {
      for (int i = 0; i < collection.docs.length; i++) {
        exploreMapLocation.add(
          {
            'map': collection.docs[i]['map'],
            'name': collection.docs[i]['name'],
          },
        );
      }
    });
  }

  @override
  void initState() {
    carouselImageFetch();
    emergencyNumberFetch();
    exploreMapLocationFetch();
    super.initState();
  }

  int selectedIndex = 0;
  void launchMap(String map) async {
    try {
      await launchUrl(map as Uri);
    } catch (e) {
      throw 'Could not launch Maps';
    }
  }

  Future<void> makePhoneCall(phoneNumber) async {
    final Uri launcUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    await launchUrl(launcUri);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SizedBox(
      height: double.infinity,
      child: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              HeadlineText(
                text: carouselImageProduct.isNotEmpty
                    ? carouselImageProduct[selectedIndex]['headline']
                    : '',
              ),
              const SizedBox(
                height: 10,
              ),
              CarouselCard(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => WebViewExample(
                          url: carouselImageProduct[selectedIndex]['link']),
                    ),
                  );
                },
                carouselImageProduct: carouselImageProduct,
                selectedIndex: selectedIndex,
                onPageChanged: (index, pages) {
                  setState(() {
                    selectedIndex = index;
                  });
                },
              ),
              const EmergencyText(text: 'Active Emergency'),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(
                    emergencyNumberProduct.length,
                    (index) => EmergencyCard(
                      callNb:
                          'Please call ${emergencyNumberProduct[index]['number']} for Emergency Call',
                      headline: emergencyNumberProduct.isNotEmpty
                          ? emergencyNumberProduct[index]['field']
                          : 'Loading..',
                      callOnPressed: () {
                        makePhoneCall(emergencyNumberProduct[index]['number']);
                      },
                      serviceImage: emergencyNumberProduct.isNotEmpty
                          ? emergencyNumberProduct[index]['img']
                          : '',
                    ),
                  ),
                ),
              ),
              const SaveLifeHeadline(text: 'Explore SaveLife'),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(
                    exploreMapLocation.length,
                    (index) => GestureDetector(
                      onTap: () {
                        launchMap(
                          exploreMapLocation[index]['map'],
                        );
                      },
                      child: LocationCard(
                        locationImg:
                            'https://media.istockphoto.com/id/469568948/photo/a-large-red-map-pointer-isolated-on-a-white-background.jpg?b=1&s=170667a&w=0&k=20&c=dHWkzrBQyMSG5soZ51-6BrfSVs_6YpBv2GqkBIhZmnE=',
                        text: exploreMapLocation.isNotEmpty
                            ? exploreMapLocation[index]['name']
                            : 'Loading..',
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 2.h,
              ),
              const ShareButton(),
              SizedBox(
                height: 5.h,
              ),
            ],
          ),
        ),
      ),
    ));
  }

  Future signOut(context) async {
    try {
      await FirebaseAuth.instance
          .signOut()
          .then((value) => Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const LoginScreen(),
              )));
    } on FirebaseAuthException {
      await FirebaseAuth.instance.signOut().then(
            (value) => Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const LoginScreen(),
              ),
            ),
          );
    }
  }
}
