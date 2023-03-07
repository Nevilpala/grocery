import 'package:flutter/material.dart';
import 'package:nectar/flash_screen.dart';
import 'data/database.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DataBase.connect();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const FlashScreen(),
      // home:  Demo(title: 'title'),
      // home: const HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}