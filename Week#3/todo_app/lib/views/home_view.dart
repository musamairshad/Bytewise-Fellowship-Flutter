import 'package:flutter/material.dart';
import '../widgets/add_todo.dart';
import 'package:provider/provider.dart';
import '../providers/todos.dart';
import './todos_list_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final todosList = Provider.of<Todos>(context);
    void showSheet() {
      showModalBottomSheet(
          context: context,
          builder: (ctx) {
            return AddTodo();
          });
    }

    return Scaffold(
      body: todosList.todos.isEmpty
          ? Column(
              children: [
                SizedBox(height: 50),
                Center(child: Text("No Todos added yet!", style: TextStyle(
                  fontSize: 30,
                ),)),
                SizedBox(height: 50),
                Container(
                  height: 450,
                  child: Image.asset('assets/images/waiting.png',
                      fit: BoxFit.cover),
                ),
              ],
            )
          : TodosListView(showSheet),
      floatingActionButton: FloatingActionButton(
        onPressed: showSheet,
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}