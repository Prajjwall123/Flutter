import 'package:flutter/material.dart';
import 'package:my_app/view_models/app_view_modal.dart';
import 'package:my_app/views/task_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: ((context) => AppViewModal()), child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'To Do App',
      home: TaskPage(),
    );
  }
}
