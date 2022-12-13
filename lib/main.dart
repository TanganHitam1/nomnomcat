import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:page_transition/page_transition.dart';
import 'package:tukir/controller/auth_controller.dart';
import 'package:tukir/models/btm_app_bar.dart';
import 'package:tukir/page/home.dart';
import 'package:tukir/page/login.dart';
import 'package:tukir/page/register.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  late var uid, email;
  MyApp({super.key});
  final authC = Get.put(AuthController(), permanent: true);
  static const routeName = '/';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        routes: {
          '/': (context) => AnimatedSplashScreen(
                duration: 50,
                splash: Image.asset(
                  'assets/nomnom1.png',
                ),
                nextScreen: const Login(),
                splashTransition: SplashTransition.fadeTransition,
                pageTransitionType: PageTransitionType.leftToRightWithFade,
              ),
          Login.routeName: (context) => const Login(),
          BtmAppBar.routeName: (context) => const BtmAppBar(),
          Register.routeName: (context) => const Register(),
          Home.routeName: (context) => Home(uid),
        },
        theme: ThemeData(
            inputDecorationTheme: const InputDecorationTheme(
                labelStyle: TextStyle(color: Colors.white)),
            textTheme: const TextTheme(
              bodyText2: TextStyle(color: Colors.white),
              bodyText1: TextStyle(color: Colors.white),
              caption: TextStyle(color: Colors.white),
            ),
            primaryColor: const Color.fromARGB(255, 0, 74, 173),
            bottomAppBarColor: const Color.fromARGB(255, 0, 74, 173),
            primarySwatch: Colors.blue,
            backgroundColor: const Color.fromARGB(255, 0, 74, 173),
            iconTheme: const IconThemeData(color: Colors.white)),
        // theme: ThemeData.dark(),
        debugShowCheckedModeBanner: false);
  }
}
