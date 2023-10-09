import 'package:flutter/material.dart';

class TodoModel {
  int id;
  String name;
  String priority;
  DateTime date;
  TimeOfDay time;
  bool isCompleted;

  TodoModel(
      {required this.id,
      required this.name,
      required this.priority,
      required this.date,
      required this.time,
      this.isCompleted = false,
      });
}
