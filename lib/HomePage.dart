import 'package:flutter/material.dart';
import 'package:todolistflutter/data.dart';
import 'package:todolistflutter/todo_tile.dart';
import 'package:todolistflutter/dialog_box.dart';
import 'package:hive/hive.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final _myBox = Hive.box('mybox');

  final bd = TodoDataBase();

  final _controller = TextEditingController();



@override
void initState() {

  if (_myBox.get("TODOLIST") == null) {
    bd.createInitialData();
  } else {
    bd.loadData();
  }

   super.initState();

}








void checkboxChanged(bool? value, int index) {
  setState(() {
    bd.toDoList[index][1] = !bd.toDoList[index][1];
  });
  bd.updateDataBase();
}


void saveNewTask() {
  setState(() {
    bd.toDoList.add([ _controller.text, false]);
    _controller.clear();
  });
  Navigator.of(context).pop();
  bd.updateDataBase();
}

void deleteTask(int index) {
  setState(() {
    bd.toDoList.removeAt(index);
  });
bd.updateDataBase();
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
        itemCount: bd.toDoList.length,
        itemBuilder: (context, index) {
          return ToDoTile(
            taskName: bd.toDoList[index][0],
            taskCompleted: bd.toDoList[index][1],
            onChanged: (value) => checkboxChanged(value, index),
            deleteFuction: (context) => deleteTask(index)
        
      );
     },
    ),
    );
}
}