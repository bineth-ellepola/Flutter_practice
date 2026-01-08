import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'vierwmodels/task_viewmodel.dart';
import 'view/login_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => TaskViewModel(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Task Manager',
        home: const LoginView(),
      ),
    );
  }
}