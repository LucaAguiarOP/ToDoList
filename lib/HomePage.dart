import 'package:flutter/material.dart';
import 'package:todolistflutter/todo_tile.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[200],
      appBar: AppBar(
        title: Text("To Do List"),
        backgroundColor: Colors.green,
        elevation: 3,
      ),
      body: ListView(
        children: [
          ToDoTile()
        ],
      ),
    );
  }
}