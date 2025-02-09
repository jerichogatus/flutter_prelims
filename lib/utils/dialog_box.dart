import 'package:flutter/material.dart';
import 'button.dart';

class DialogBox extends StatelessWidget {
  const DialogBox({super.key, required this.textController, required this.onSave, required this.onCancel});

  final TextEditingController textController;
  final VoidCallback onSave;
  final VoidCallback onCancel;

  @override
  Widget build(BuildContext context) {
    if (textController.text.isEmpty) {
      textController.text = 'Frank Ocean - ';
    }

    return AlertDialog(
      backgroundColor: Colors.grey[900],
      title: Text(
        "Add a Song",
        style: TextStyle(fontFamily: 'NexaHeavy', color: Colors.white),
      ),
      content: SizedBox(
        height: 150,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: textController,
              style: TextStyle(fontFamily: 'NexaHeavy', color: Colors.white),
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.black,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Button(text: 'Save', onPressed: onSave),
                Button(text: 'Cancel', onPressed: onCancel),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
