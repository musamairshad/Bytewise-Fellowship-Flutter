import 'package:flutter/material.dart';
import '../models/todo.dart';

class Todos with ChangeNotifier {
  final List<Todo> _todos = [
    Todo(
      id: DateTime.now().toString(),
      title: "Do something nice for someone I care about.",
      date: DateTime.now(),
    ),
    Todo(
      id: DateTime.now().toString(),
      title: "Memorize the fifty states and their capitals.",
      date: DateTime.now(),
    ),
    Todo(
      id: DateTime.now().toString(),
      title: "Watch a classic movie.",
      date: DateTime.now(),
    ),
    Todo(
      id: DateTime.now().toString(),
      title:
          "Contribute code or a monetary donation to an open-source software project.",
      date: DateTime.now(),
    ),
    Todo(
      id: DateTime.now().toString(),
      title: "Solve a Rubik's cube.",
      date: DateTime.now(),
    ),
  ];

  List<Todo> get todos {
    return [..._todos];
  }

  void addTodo(String enteredTitle, DateTime? enteredDate) {
    if (enteredTitle.isEmpty || enteredDate == null) {
      return;
    }
    final newTodo = Todo(
        id: DateTime.now().toString(), title: enteredTitle, date: enteredDate);
    _todos.add(newTodo);
    notifyListeners();
  }

  void deleteTodo(String id) {
    _todos.removeWhere((todo) => todo.id == id);
    notifyListeners();
  }
}
