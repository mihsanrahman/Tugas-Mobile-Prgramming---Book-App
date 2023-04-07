import 'package:e_book_app/onboardingscreen/introduction.dart';
import 'package:e_book_app/routes.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: Intro.routeName,
      routes: routes,
    );
  }
}
