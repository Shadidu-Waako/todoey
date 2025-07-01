import 'package:flutter/material.dart';
import 'package:todoey/widgets/task_tile.dart';
import 'package:todoey/models/tasks_data.dart';
import 'package:provider/provider.dart';

class TaskList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: (BuildContext context, TaskData value, Widget? child) {
        return ListView.builder(
          itemBuilder: (context, index) {
            final task = value.tasks[index];
            return TaskTile(
              taskTitle: task.name,
              isChecked: task.isDone,
              checkboxCallback: (bool? checkBoxState) {
                value.updateTask(task);
              },
            );
          },
          itemCount: value.taskCount,
        );
      },
    );
  }
}
