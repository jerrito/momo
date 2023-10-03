//import 'package:mobile_money_project/Size_of_screen.dart';
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:momo/home/login_signup.dart';
import 'package:momo/main.dart';
import 'package:momo/models/userProvider.dart';
import 'package:provider/provider.dart';
//import 'package:flutter_native_splash/flutter_native_splash.dart';

class IndexPage extends StatelessWidget {
  const IndexPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<UserProvider>(
      builder: (context, userProvider, widget) {
        if (userProvider.appUser != null) {
          // return const Loginpage();
          return const MomoHomePage();
        }

        return const SignUpPage();
      },
    );
  }
}

class Splashscreen extends StatefulWidget {
  static const String routeName="/splash";
  const Splashscreen({Key? key}) : super(key: key);

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 0), () {
      // FlutterNativeSplash.remove();
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => IndexPage()));
    });
  }

  @override
  Widget build(BuildContext context) {
    // SizeConfig().init(context);
    return Scaffold(
      body: Container(
        color: Colors.white,
      ),
    );
  }
}
