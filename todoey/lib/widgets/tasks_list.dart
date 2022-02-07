import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';
import 'package:todoey/model/task.dart';
import 'package:todoey/model/task_data.dart';
import 'package:todoey/widgets/task_tile.dart';

class TasksList extends StatefulWidget {
  //List<Task> tasks;
  //TasksList(this.tasks);
  @override
  State<TasksList> createState() => _TasksListState();
}

// class _TasksListState extends State<TasksList> {
//
//
//   @override
//   Widget build(BuildContext context) {
//     return ListView.builder(
//       itemCount: widget.tasks.length,
//       itemBuilder: (context, index) {
//         return TaskTile(
//           isChecked: widget.tasks[index].isDone,
//           taskTitle: widget.tasks[index].name,
//           checkboxCallback: (checkboxState) {
//             setState(() {
//               widget.tasks[index].toggleDone();
//             });
//           },
//         );
//       },
//     );
//   }
// }
class _TasksListState extends State<TasksList> {


  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return TaskTile(
          isChecked: context.read<TaskData>().tasks[index].isDone,
          taskTitle: context.read<TaskData>().tasks[index].name,
          checkboxCallback: (checkboxState) {
            setState(() {
              context.read<TaskData>().tasks[index].toggleDone();
            });
          },
        );
      },
      itemCount: context.read<TaskData>().tasks.length,
    );
  }
}