import 'package:comp/config/theme/theme.dart';
import 'package:comp/features/home/view/home_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Comp',
        debugShowCheckedModeBanner: false,
        theme: theme(),
        home: HomeScreen());
  }
}
