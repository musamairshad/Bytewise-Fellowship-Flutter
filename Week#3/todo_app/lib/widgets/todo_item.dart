import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/todos.dart';
import 'package:intl/intl.dart';

class TodoItem extends StatelessWidget {
  final String id;
  final String title;
  final DateTime date;
  const TodoItem({required this.id, required this.title, required this.date, super.key});

  @override
  Widget build(BuildContext context) {
    final todoContainer = Provider.of<Todos>(context);
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
      elevation: 3,
      child: ListTile(
        title: Text(title),
        subtitle: Text(DateFormat.yMd().format(date)),
        trailing: Container(
          width: 100,
          child: Row(
            children: [
              IconButton(
                color: Theme.of(context).colorScheme.error,
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (ctx) => AlertDialog(
                            title: Text("Confirm delete"),
                            content: Text(
                                "Are you sure you want to delete this item?"),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: Text(
                                  "Cancel",
                                  style: TextStyle(
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor:
                                      Theme.of(context).colorScheme.error,
                                ),
                                onPressed: () {
                                  todoContainer.deleteTodo(id);
                                  Navigator.of(context).pop();
                                },
                                child: Text("Delete"),
                              ),
                            ],
                          ));
                },
                icon: Icon(Icons.delete),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.thumb_up_alt_outlined),
              ),
            ],
          ),
        ),
      ),
    );
  }
}