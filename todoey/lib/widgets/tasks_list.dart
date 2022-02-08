import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey/model/task_data.dart';
import 'package:todoey/widgets/task_tile.dart';

class TasksList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: (_, taskData, __) {
        return ListView.builder(
          itemBuilder: (context, index) {
            return TaskTile(
              isChecked: taskData.tasks[index].isDone,
              taskTitle: taskData.tasks[index].name,
              checkboxCallback: (checkboxState) {
                taskData.tasks[index].toggleDone();
              },
            );
          },
          itemCount: taskData.getCount(),
        );
      }
    );
  }
}

// class TasksList extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return ListView.builder(
//       itemBuilder: (context, index) {
//         return TaskTile(
//           isChecked: context.read<TaskData>().tasks[index].isDone,
//           taskTitle: context.read<TaskData>().tasks[index].name,
//           checkboxCallback: (checkboxState) {
//             // context.read<TaskData>().tasks[index].toggleDone();
//           },
//         );
//       },
//       itemCount: context.read<TaskData>().tasks.length,
//     );
//   }
// }
