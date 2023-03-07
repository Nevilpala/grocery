import 'dart:async';

import 'package:flutter/material.dart';
import 'package:nectar/started_page.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FlashScreen extends StatefulWidget {
  const FlashScreen({Key? key}) : super(key: key);

  @override
  State<FlashScreen> createState() => _FlashScreenState();
}

class _FlashScreenState extends State<FlashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3),() {
        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const StartedPage()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.green[500],
        child: Center(
            child: SvgPicture.asset('assets/icons/splash_screen_icon.svg'),
          )
        )
      );
  }
}
