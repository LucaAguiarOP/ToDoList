import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';


// ignore: must_be_immutable
class ToDoTile extends StatelessWidget {
  final String taskName;
  final bool taskCompleted;
  Function(bool?)? onChanged;
  Function(BuildContext)? deleteFuction;



   ToDoTile({
   super.key,
   required this.taskName,
   required this.taskCompleted,
   required this.onChanged,
   required this.deleteFuction,

  });

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.only(left:25.0, right: 25, top: 25),
      child: Slidable(
        endActionPane: ActionPane(
          motion: StretchMotion(),
          children: [
            SlidableAction(onPressed: deleteFuction,
            borderRadius: BorderRadius.circular(12),
            icon: Icons.delete,
            backgroundColor: Colors.red.shade300,
            )
          ],
        ),
        child: Container(
          padding: EdgeInsets.all(24),
          child: Row (
            children: [
              Checkbox(
                value: taskCompleted,
                onChanged: onChanged,
                activeColor: Colors.black,
                ),
          Text(
            taskName,
            style: TextStyle(
              decoration: taskCompleted
              ? TextDecoration.lineThrough
              : TextDecoration.none,
              ),
            ),
            ],
          ),
        decoration: BoxDecoration(
          color: Colors.green,
          borderRadius: BorderRadius.circular(12),
        ),
            ),
      ),
    );
  }
}