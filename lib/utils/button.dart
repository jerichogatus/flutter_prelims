import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final String text; // Button text (e.g., "Save" or "Cancel")
  final VoidCallback onPressed; // Function when button is clicked

  const Button({
    super.key, 
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed, // When clicked, run the function
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blueGrey, // Button color
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)), // Rounded edges
      ),
      child: Text(
        text, // Show the button text
        style: TextStyle(
          fontFamily: 'NexaHeavy',
          color: Colors.white, // White text color
          fontSize: 16,
        ),
      ),
    );
  }
}