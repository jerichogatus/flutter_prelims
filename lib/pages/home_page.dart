import 'package:flutter/material.dart';
import 'package:flutter_prelims/utils/dialog_box.dart';
import 'package:flutter_prelims/utils/todo_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _textController = TextEditingController();
  int likeCount = 842; // Like counter

  // List of songs (with checkbox state)
  List songList = [
    ['Frank Ocean - White Ferrari', false],
    ['Frank Ocean - Pink + White', false],
    ['Frank Ocean - Ivy', false],
    ['Frank Ocean - Godspeed', false],
  ];

  // Change checkbox when tapped
  void checkBoxChanged(bool? value, int index) {
    setState(() {
      songList[index][1] = !songList[index][1]; // Toggle the checkbox
    });
  }

  // Show dialog box to add a new song
  void createNewSong() {
    showDialog(
      context: context,
      builder: (context) {
        return DialogBox(
          textController: _textController,
          onSave: saveNewSong,
          onCancel: () {
            setState(() {
              _textController.clear(); // Clear input field
            });
            Navigator.pop(context); // Close dialog
          },
        );
      },
    );
  }

  // Save new song to the list
  void saveNewSong() {
    setState(() {
      songList.add([_textController.text, false]); // Add new song with checkbox false
      _textController.clear();
    });
    Navigator.pop(context);
  }

  // Delete a song from the list
  void deleteSong(int index) {
    setState(() {
      songList.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, // Set background to black
      appBar: AppBar(
        title: Center(
          child: Text(
            'Frank Ocean Mix', // App title
            style: TextStyle(
              fontFamily: 'NexaHeavy', // Custom font
              color: Color(0xFFA9B5DF), // Cyan color
              fontWeight: FontWeight.bold,
              fontSize: 24,
            ),
          ),
        ),
        elevation: 0,
        backgroundColor: Colors.black, // Black background
      ),
      body: Column(
        children: [
          // Likes counter
          Container(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      color: Color(0xFF2D336B), // Blue container
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      'Likes:  $likeCount',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: Colors.white, // White text
                        fontFamily: 'NexaHeavy',
                        fontSize: 15,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 10), // Add spacing

                FloatingActionButton(
                  onPressed: () {
                    setState(() {
                      likeCount += 1; // Increase like count
                    });
                  },
                  backgroundColor: Colors.redAccent, // Red heart button
                  child: Icon(Icons.favorite, color: Colors.white),
                ),
              ],
            ),
          ),

          // Song List
          Expanded(
            child: ListView.builder(
              itemCount: songList.length, // Dynamically show songs
              itemBuilder: (context, index) {
                return TodoTile(
                  taskName: songList[index][0],
                  taskCompleted: songList[index][1],
                  onChanged: (value) => checkBoxChanged(value, index),
                  onDelete: (context) => deleteSong(index),
                );
              },
            ),
          ),

          // Now Playing section
          Container(
            color: Colors.blueGrey[900], // Dark blue-grey background
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12.0),
                  child: Image.asset(
                    'images/album.jpeg', // Show album image
                    width: 80,
                    height: 80,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(width: 15), // Spacing
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Now Playing',
                        style: TextStyle(
                          fontFamily: 'NexaHeavy',
                          color: Colors.grey[400], // Grey text
                          fontSize: 12,
                        ),
                      ),
                      Text(
                        'Frank Ocean - Nights',
                        style: TextStyle(
                          fontFamily: 'NexaHeavy',
                          color: Colors.white, // White text
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: createNewSong, // Add song button
        backgroundColor: Colors.blueGrey,
        child: Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}