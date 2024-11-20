import 'package:assign_2/screens/signUp.dart';
import 'package:flutter/material.dart';
import 'package:assign_2/screens/login.dart';

void main() {
  runApp(const MyApp()); // Changed the root widget to `MyApp`
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const  LoginScreen(), // Setting the home to `CreateAccount`
      debugShowCheckedModeBanner: false,
    );
  }
}
