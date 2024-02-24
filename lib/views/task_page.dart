import 'package:flutter/material.dart';
import 'package:my_app/views/add_task_view.dart';
import 'package:my_app/views/header_view.dart';
import 'package:my_app/views/task_info_view.dart';
import 'package:my_app/views/task_list_view.dart';

class TaskPage extends StatelessWidget {
  const TaskPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Expanded(flex: 1, child: HeaderView(),),
            Expanded(flex: 1, child: TaskInfoView()),
            Expanded(flex: 7, child: TaskListView())
          ],
        ),
      ),
      floatingActionButton: const AddTaskView(),
    );
  }
}
