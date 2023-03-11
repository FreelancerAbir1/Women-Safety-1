import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
 import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:women_safety_1/screen/platform/platform_check.dart';
import 'package:women_safety_1/screen/platform/website/website.dart';
import 'firebase_options.dart';
import 'screen/platform/android/android.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  static const MaterialColor themeBlack = MaterialColor(
    _themeBlackPrimaryValue,
    <int, Color>{
      50: Color(_themeBlackPrimaryValue),
      100: Color(_themeBlackPrimaryValue),
      200: Color(_themeBlackPrimaryValue),
      300: Color(_themeBlackPrimaryValue),
      400: Color(_themeBlackPrimaryValue),
      500: Color(_themeBlackPrimaryValue),
      600: Color(_themeBlackPrimaryValue),
      700: Color(_themeBlackPrimaryValue),
      800: Color(_themeBlackPrimaryValue),
      900: Color(_themeBlackPrimaryValue),
    },
  );
  static const int _themeBlackPrimaryValue = 0xFF222222;
  static const Color themeTextPrimary = Color(0xFF9D9D9D);

  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(builder: (context, orientation, screenType) {
      return MaterialApp(
        theme: ThemeData(
          primarySwatch: themeBlack,
          textTheme: Theme.of(context).textTheme.apply(
                bodyColor: themeBlack,
              ),
          primaryTextTheme: Theme.of(context).textTheme.apply(
                bodyColor: themeTextPrimary,
              ),
          primaryIconTheme: const IconThemeData(
            color: themeTextPrimary,
          ),
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        
        debugShowCheckedModeBanner: false,
        title: 'Women Safety App version 1.0.0',
        home: const PlatformCheck(
          website: WebsitePlatform(),
          android: AndroidPlatform(),
          windows: WebsitePlatform(),
        ),
      );
    });
  }
}
