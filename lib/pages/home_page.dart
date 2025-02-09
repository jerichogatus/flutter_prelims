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
  int likeCount = 152;

  List songList = [
    ['Frank Ocean - White Ferrari', false],
    ['Frank Ocean - Pink + White', false],
    ['Frank Ocean - Ivy', false],
    ['Frank Ocean - Self Control', false],
    ['Frank Ocean - Nights', false],
    ['Frank Ocean - Seigfried', false],
    ['Frank Ocean - Godspeed', false],
    ['Frank Ocean - Futura Free', false],
    ['Frank Ocean - Chanel', false],
    ['Frank Ocean - Provider', false],
  ];

  void checkBoxChanged(bool? value, int index) {
    setState(() {
      songList[index][1] = !songList[index][1];
    });
  }

  void createNewSong() {
    showDialog(
      context: context,
      builder: (context) {
        return DialogBox(
          textController: _textController,
          onSave: saveNewSong,
          onCancel: () {
            setState(() {
              _textController.clear();
            });
            Navigator.pop(context);
          },
        );
      },
    );
  }

  void saveNewSong() {
    setState(() {
      songList.add([_textController.text, false]);
      _textController.clear();
    });
    Navigator.pop(context);
  }

  void deleteSong(int index) {
    setState(() {
      songList.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'Frank Ocean Mix',
            style: TextStyle(
              fontFamily: 'NexaHeavy',
              color: Colors.cyanAccent[100],
              fontWeight: FontWeight.bold,
              fontSize: 24,
            ),
          ),
        ),
        elevation: 0,
        backgroundColor: Colors.black,
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 15),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      color: Colors.redAccent,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      'Likes: $likeCount',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'NexaHeavy',
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 10),

                FloatingActionButton(
                  onPressed: () {
                    setState(() {
                      likeCount += 1;
                    });
                  },
                  backgroundColor: Colors.redAccent,
                  child: Icon(Icons.favorite, color: Colors.white),
                ),
              ],
            ),
          ),

          Expanded(
            child: ListView.builder(
              itemCount: songList.length,
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

          Container(
            color: Colors.blueGrey[900],
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12.0),
                  child: Image.asset(
                    'images/album.jpeg',
                    width: 80,
                    height: 80,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(width: 15),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Now Playing',
                        style: TextStyle(
                          fontFamily: 'NexaHeavy',
                          color: Colors.white70,
                          fontSize: 14,
                        ),
                      ),
                      Text(
                        'Frank Ocean - Nights',
                        style: TextStyle(
                          fontFamily: 'NexaHeavy',
                          color: Colors.white,
                          fontSize: 20,
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
        onPressed: createNewSong,
        backgroundColor: Colors.blueGrey,
        child: Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}
