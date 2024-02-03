import 'package:flutter/material.dart';
import 'package:todolistflutter/todo_tile.dart';
import 'package:todolistflutter/dialog_box.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final _controller = TextEditingController();

List toDoList = [
  ["trabalhar pela manha", false],
  ["123", false]
];

void checkboxChanged(bool? value, int index) {
  setState(() {
    toDoList[index][1] = !toDoList[index][1];
  });
}


void saveNewTask() {
  setState(() {
    toDoList.add([ _controller.text, false]);
    _controller.clear();
  });
  Navigator.of(context).pop();
}

void deleteTask(int index) {
  setState(() {
    toDoList.removeAt(index);
  });

}


void createNewTask() {
  showDialog(
    context: context,
     builder: (context) {
      return DialogBox(
        controller: _controller,
        onSave: saveNewTask,
        onCancel: () => Navigator.of(context).pop(),
      );
     }
     );
}




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[200],
      appBar: AppBar(
        title: Text("To Do List"),
        backgroundColor: Colors.green,
        elevation: 3,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green,
        onPressed: createNewTask,
        child: Icon(Icons.add),
      ),
      body: ListView.builder( 
        itemCount: toDoList.length,
        itemBuilder: (context, index) {
          return ToDoTile(
            taskName: toDoList[index][0],
            taskCompleted: toDoList[index][1],
            onChanged: (value) => checkboxChanged(value, index),
            deleteFuction: (context) => deleteTask(index)
        
      );
     },
    ),
    );
}
}