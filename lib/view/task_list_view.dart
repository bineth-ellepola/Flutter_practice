import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../vierwmodels/task_viewmodel.dart';
import 'add_task_view.dart';

class TaskListView extends StatelessWidget {
  const TaskListView({super.key});

  @override
  Widget build(BuildContext context) {
    final taskVM = Provider.of<TaskViewModel>(context);

    return Scaffold(
      appBar: AppBar(title: const Text('My Tasks')),
      body: ListView.builder(
        itemCount: taskVM.tasks.length,
        itemBuilder: (context, index) {
          final task = taskVM.tasks[index];
          return ListTile(
            title: Text(
              task.title,
              style: TextStyle(
                color: task.isCompleted ? const Color.fromARGB(255, 158, 158, 158) : Colors.black,
                
                decoration:
                    task.isCompleted ? TextDecoration.lineThrough : null,
              ),
            ),
            trailing: Checkbox(
              value: task.isCompleted,
              onChanged: (_) => taskVM.toggleTask(task.id),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const AddTaskView()),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
