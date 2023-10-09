import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:todo_app1/models/todo_model.dart';
import 'package:todo_app1/providers/todo_provider.dart';
import 'package:todo_app1/utils/helper_funtion.dart';

class NewTodo extends StatefulWidget {
  static const String routeName = '/new';
  const NewTodo({super.key});

  @override
  State<NewTodo> createState() => _NewTodoState();
}

class _NewTodoState extends State<NewTodo> {
  final _todoController = TextEditingController();
  final _priorityList = const ['Low', 'Normal', 'High'];
  String? priority;
  TimeOfDay? selectTime;
  DateTime? currentDate = DateTime.now();
  DateTime? selectedDate;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Todo'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          TextField(
            controller: _todoController,
            decoration: const InputDecoration(labelText: 'What to do?'),
          ),
          const SizedBox(height: 15,),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: DropdownButton<String>(
                  value: priority,
                  hint: const Text('Select Prority'),
                  underline: null,
                  isExpanded: true,
                  items: _priorityList
                      .map((e) => DropdownMenuItem<String>(
                            value: e,
                            child: Text(e),
                          ))
                      .toList(),
                  onChanged: (value) {
                    setState(() {
                      priority = value;
                    });
                  }),
            ),
          ),
          const SizedBox(height: 15,),

          Center(
            child: SizedBox(
              width: 200,
              child: ElevatedButton(
                onPressed: _selectdate,
                child: Text(
                    selectedDate == null ? 'Select Date' : getFormattedDate(selectedDate!)),
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepPurple,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                    )),
              ),
            ),
          ),
          const SizedBox(height: 15,),
          Center(
            child: SizedBox(
              width: 200,
              child: ElevatedButton(
                onPressed: _selectTime,
                child: Text(
                    selectTime == null ? 'Select Time' : getFormattedTime(selectTime!)),
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepPurple,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                    )),
              ),
            ),
          ),
          const SizedBox(height: 50,),

          Center(
              child: OutlinedButton(
                  onPressed: _svaeTodo,
                  child: const Text('Save Todo')))
        ],
      ),
    );
  }

  @override
  void dispose() {
    _todoController.dispose();
    super.dispose();
  }

  void _selectdate() async {
    final date = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime.now(),
        lastDate: DateTime.now().add(const Duration(days: 60)));
    if (date != null) {
      setState(() {
        selectedDate = date;
      });
    }
  }



  void _selectTime() async {
    final time =
        await showTimePicker(context: context, initialTime: TimeOfDay.now());
    if (time != null) {
      setState(() {
        selectTime = time;
      });
    }
  }

  void _svaeTodo() {
    if(_todoController.text.isEmpty){
      showMsg(context, 'Todo name not found');
      return;
    }
    if(priority == null ){
      showMsg(context, 'Priority not found');
      return;
    }
    if(selectedDate == null){
      showMsg(context, 'Chose an date');
      return;
    }
    if(selectTime == null ){
      showMsg(context, 'slect your time');
      return;
    }
    final todo = TodoModel(
        id: DateTime.now().millisecondsSinceEpoch,
        name: _todoController.text,
        priority: priority!,
        date: selectedDate!,
        time: selectTime!,
    );
    Provider.of<TodoProvider>(context,listen: false).addTodo(todo);
    Navigator.pop(context);
  }
}
