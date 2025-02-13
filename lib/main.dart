import 'package:flutter/material.dart';
import 'package:flutter_prelims/pages/home_page.dart';

void main() {
  runApp(MyApp()); // Start the app
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Frank Ocean Mix', // App name
      theme: ThemeData(
        fontFamily: 'NexaHeavy', // Use custom font
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.blueGrey), // Use blue-grey color theme
        scaffoldBackgroundColor: Colors.black, // Make background black
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: HomePage(), // Go to HomePage
    );
  }
}
