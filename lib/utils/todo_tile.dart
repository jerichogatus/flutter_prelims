import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class TodoTile extends StatelessWidget {
  final String taskName;
  final bool taskCompleted;
  final Function(bool?) onChanged;
  final Function(BuildContext) onDelete;

  const TodoTile({
    super.key,
    required this.taskName,
    required this.taskCompleted,
    required this.onChanged,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 2), // Spacing
      child: Slidable(
        endActionPane: ActionPane(
          motion: ScrollMotion(),
          children: [
            SlidableAction(
              onPressed: onDelete, // Delete song
              icon: Icons.delete,
              foregroundColor: Colors.white, // Red delete button
              backgroundColor: Colors.red,
              borderRadius: BorderRadius.circular(12),
            ),
          ],
        ),
        child: Container(
          padding: EdgeInsets.all(18),
          decoration: BoxDecoration(
            color: Colors.grey[900], // Dark grey background
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.asset(
                  'images/album.jpeg', // Show album image
                  width: 50,
                  height: 50,
                  fit: BoxFit.cover,
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                    taskName,
                    style: TextStyle(
                      fontFamily: 'NexaHeavy',
                      color: Colors.white, // White text
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      decoration: taskCompleted ? TextDecoration.lineThrough : TextDecoration.none,
                    ),
                  ),
                ),
              ),
              Checkbox(
                value: taskCompleted,
                onChanged: onChanged, // Toggle checkbox
                activeColor: Colors.black,
                checkColor: Colors.blueAccent,
                fillColor: WidgetStateProperty.all(Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}