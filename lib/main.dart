import 'package:flutter/material.dart';
import 'package:flutter_prelims/pages/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Frank Ocean Mix',
      theme: ThemeData(
        fontFamily: 'NexaHeavy',  // Apply the custom font globally
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.blueGrey),
        scaffoldBackgroundColor: Colors.black,
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
