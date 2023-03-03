import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:women_safety_1/screen/platform/platform_check.dart';
import 'package:women_safety_1/screen/platform/website/website.dart';
import 'screen/platform/android/android.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: 'AIzaSyC4pGn2qzWQYneg5tRT74HmWUBFjiDV3fk',
      appId: '1:617369470412:web:285e15a03e8e64069b8969',
      messagingSenderId: '617369470412',
      projectId: 'women-safety-1-a45e7',
      authDomain: 'women-safety-1-a45e7.firebaseapp.com',
      storageBucket: 'women-safety-1-a45e7.appspot.com',
      measurementId: 'G-KPXWHF24B9',
    ),
  );
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(builder: (context, orientation, screenType) {
      return const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        home: PlatformCheck(
          android: AndroidPlatform(),
          windows: WebsitePlatform(),
        ),
      );
    });
  }
}
