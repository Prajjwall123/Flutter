import 'dart:async';

import 'package:flutter/material.dart';
import '../models/task_modal.dart';
import '../models/user_modal.dart';
import 'package:firebase_database/firebase_database.dart';

class AppViewModal extends ChangeNotifier {
  late DatabaseReference _databaseReference;

  List<Task> tasks = <Task>[];
  User user = User("I9XRG9voOwXE4KqHPpjN4pGjOIE2", "Prajwal");

  Color clrLvl1 = Colors.blue.shade50;
  Color clrLvl2 = Colors.blue.shade200;
  Color clrLvl3 = Colors.blue.shade800;
  Color clrLvl4 = Colors.blue.shade900;

  int get numTasks => tasks.length;

  int get numTasksRemaining =>
      tasks
          .where((task) => !task.complete)
          .length;

  String get username => user.username;

  AppViewModal() {
    _initDatabase();
    _fetchTasks();
  }

  Future<void> _initDatabase() async {
    _databaseReference = FirebaseDatabase.instance.reference();
  }

  String getTaskTitle(int taskIndex) {
    return tasks[taskIndex].title;
  }

  void _fetchTasks() {
    _databaseReference
        .child('user_tasks')
        .child(user.id)
        .once()
        .then((DatabaseEvent event) {
      DataSnapshot snapshot = event.snapshot;
      if (snapshot.value != null && snapshot.value is Map<dynamic, dynamic>) {
        Map<dynamic, dynamic> tasksMap = snapshot.value as Map<dynamic, dynamic>;
        tasks = tasksMap.entries.map((entry) {
          Map<dynamic, dynamic> taskMap = entry.value;
          return Task(
            id: entry.key.toString(),
            title: taskMap['title'].toString(),
            complete: taskMap['complete'] as bool? ?? false,
          );
        }).toList();
      } else {
        tasks = []; // Reset tasks if snapshot value is not valid
      }
      notifyListeners();
    }).catchError((error) {
      print('Error fetching tasks: $error');
    });
  }


  void _saveTasks() {
    // Not needed, as tasks are managed directly in Firebase Realtime Database
  }

  void addTask(Task newTask) {
    String taskId = _databaseReference.child('user_tasks').child(user.id).push().key ?? '';
    _databaseReference.child('user_tasks').child(user.id).child(taskId).set(newTask.toMap());
  }

  void deleteTask(String taskId) {
    _databaseReference.child('user_tasks').child(user.id).child(taskId).remove();
  }

  void deleteAllTask() {
    _databaseReference.child('user_tasks').child(user.id).remove();
  }

  void deleteCompletedTask() {
    tasks.forEach((task) {
      if (task.complete) {
        deleteTask(task.id);
      }
    });
  }

  void setTaskValue(String taskId, bool taskValue) {
    _databaseReference.child('user_tasks').child(user.id).child(taskId).update({'complete': taskValue});
  }

  void updateUsername(String newUsername) {
    user.username = newUsername;
    notifyListeners();
  }

  void bottomSheetBuilder(Widget bottomSheetView, BuildContext context) {
    showModalBottomSheet(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      context: context,
      builder: (context) {
        return bottomSheetView;
      },
    );
  }
}
