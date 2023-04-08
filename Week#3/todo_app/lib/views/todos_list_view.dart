import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/todos.dart';
import '../widgets/todo_item.dart';

class TodosListView extends StatelessWidget {
  final VoidCallback showSheetFunction;
  TodosListView(this.showSheetFunction);

  @override
  Widget build(BuildContext context) {
    final todosList = Provider.of<Todos>(context);
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'Todos Management App'),
        ),
        actions: [
          IconButton(
            onPressed: showSheetFunction,
            icon: Icon(Icons.add),
          ),
        ],
      ),
      body: ListView.builder(
        itemBuilder: (ctx, i) => TodoItem(
          id: todosList.todos[i].id,
          title: todosList.todos[i].title,
          date: todosList.todos[i].date,
        ),
        itemCount: todosList.todos.length,
      ),
    );
  }
}