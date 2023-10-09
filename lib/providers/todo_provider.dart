import 'package:flutter/foundation.dart';

import '../models/todo_model.dart';

class TodoProvider with ChangeNotifier{
  List<TodoModel> todoList = [];
  void addTodo(TodoModel model){
    todoList.add(model);
    notifyListeners();
  }
  void changeTodoStatus(TodoModel todoModel){
    final index = todoList.indexOf(todoModel);
    todoList[index].isCompleted = !todoList[index].isCompleted;
    notifyListeners();
  }
}