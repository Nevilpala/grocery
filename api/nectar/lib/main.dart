import 'package:flutter/material.dart';
import 'package:nectar/Demp_Api/demo.dart';
import 'package:nectar/flash_screen.dart';
import 'package:nectar/home_page.dart';


void main() async{
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      // home: const FlashScreen(),
      // home:  Demo(title: 'title'),
      home: const HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}