import 'package:flutter/material.dart';
// import 'package:grocery/data/mongodb.dart';
import 'package:nectar/flash_screen.dart';


void main() async{
  // WidgetsFlutterBinding.ensureInitialized();
  // await MongoDBConnection.connect();
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
      home: const FlashScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}