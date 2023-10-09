import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app1/pages/new_todo.dart';
import 'package:todo_app1/pages/todo_home.dart';
import 'package:todo_app1/providers/todo_provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => TodoProvider(),
      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: TodoHome.routeName,
      routes: {
        TodoHome.routeName : (context) => const TodoHome(),
        NewTodo.routeName : (context) => const NewTodo(),
      },
    );
  }
}


