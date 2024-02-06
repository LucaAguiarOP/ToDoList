import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive/hive.dart';


class TodoDataBase {

  List toDoList = [];

  final _myBox = Hive.box('mybox');


void createInitialData() {
  toDoList = [
    ["Make Tutorial", false],
    ["Do exercise", false],
  ];
}

void loadData() {
  toDoList = _myBox.get("TODOLIST");
  
}

void updateDataBase() {
  _myBox.put("TODOLIST", toDoList);
}

}