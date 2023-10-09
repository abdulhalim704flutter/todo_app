import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app1/pages/new_todo.dart';
import 'package:todo_app1/providers/todo_provider.dart';
import 'package:todo_app1/utils/helper_funtion.dart';

class TodoHome extends StatelessWidget {
  static const String routeName = '/';
  const TodoHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo List'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pushNamed(context, NewTodo.routeName),
        child: const Icon(Icons.add),
      ),
      body: Consumer<TodoProvider>(
        builder: (context, provider, _) => ListView.builder(
          itemCount: provider.todoList.length,
          itemBuilder: (context, index) {
            final todo = provider.todoList[index];
            return ListTile(
              leading: Icon(Icons.star,size: 36.0,color: getPriorityColor(todo.priority),),
                title: Text(todo.name),
                subtitle: Text(
                    todo.isCompleted ? 'Completed':'${getFormattedDate(todo.date)} ${getFormattedTime(todo.time)}'),
              trailing: Checkbox(
                value: todo.isCompleted,
                onChanged: todo.isCompleted ? null : (value){
                  provider.changeTodoStatus(todo);
                },
              ),
                );
          },
        ),
      ),
    );
  }
  Color getPriorityColor(String priority){
    if(priority=='Low'){
      return Colors.yellow;
    }else if(priority == 'Normal'){
      return Colors.green;
    }else{
      return Colors.red;
    }
  }
}
