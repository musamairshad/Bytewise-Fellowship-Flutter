import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/todos.dart';
import 'package:intl/intl.dart';

class AddTodo extends StatefulWidget {
  @override
  State<AddTodo> createState() => _AddTodoState();
}

class _AddTodoState extends State<AddTodo> {
  final idController = TextEditingController();

  final titleController = TextEditingController();

  DateTime? _selectedDate;

  @override
  Widget build(BuildContext context) {
    void _showDatePicker() {
      showDatePicker(
              context: context,
              initialDate: DateTime.now(),
              firstDate: DateTime(2023),
              lastDate: DateTime(2023, 12, 30))
          .then((pickedDate) {
        if (pickedDate == null) {
          return;
        } else {
          setState(() {
            _selectedDate = pickedDate;
          });
        }
      });
    }

    final TodoContainer = Provider.of<Todos>(context);
    return Form(
        child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          TextFormField(
            controller: titleController,
            decoration: const InputDecoration(
              labelText: "Enter Title",
            ),
          ),
          SizedBox(
            height: 80,
            child: Row(
              children: [
                Expanded(
                    child: Text(
                  _selectedDate == null
                      ? 'No Date Chosen!'
                      : 'Picked Date: ${DateFormat.yMd().format(_selectedDate!)}',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                )),
                ElevatedButton(
                  onPressed: _showDatePicker,
                  child: Text("Choose Date"),
                ),
              ],
            ),
          ),
          SizedBox(height: 15),
          ElevatedButton(
            onPressed: () {
              TodoContainer.addTodo(titleController.text, _selectedDate);
              Navigator.of(context).pop();
            },
            child: const Text("Add Todo"),
          ),
        ],
      ),
    ));
  }
}