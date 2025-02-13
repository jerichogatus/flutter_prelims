import 'package:flutter/material.dart';
import 'button.dart';

class DialogBox extends StatelessWidget {
  const DialogBox({
    super.key, 
    required this.textController, 
    required this.onSave, 
    required this.onCancel,
  });

  final TextEditingController textController; // This stores the text input
  final VoidCallback onSave; // Function when "Save" is clicked
  final VoidCallback onCancel; // Function when "Cancel" is clicked

  @override
  Widget build(BuildContext context) {
    if (textController.text.isEmpty) {
      textController.text = 'Frank Ocean - '; // Default text
    }

    return AlertDialog(
      backgroundColor: Colors.grey[900], // Dark grey background
      title: Text(
        "Add a Song", // Title of the dialog box
        style: TextStyle(fontFamily: 'NexaHeavy', color: Colors.white),
      ),
      content: SizedBox(
        height: 150, // Set height
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // Center items
          children: [
            TextField(
              controller: textController, // This is where the user types
              style: TextStyle(fontFamily: 'NexaHeavy', color: Colors.white), // White text
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.black, // Black input background
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12), // Rounded corners
                ),
              ),
            ),
            SizedBox(height: 20), // Space between text box and buttons

            // Buttons Row (Save & Cancel)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Button(text: 'Save', onPressed: onSave), // Save button
                Button(text: 'Cancel', onPressed: onCancel), // Cancel button
              ],
            ),
          ],
        ),
      ),
    );
  }
}