import 'package:bloc_prac/bloc/todo_bloc/todo_bloc.dart';
import 'package:bloc_prac/bloc/todo_bloc/todo_event.dart';
import 'package:bloc_prac/bloc/todo_bloc/todo_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class TodoScreen extends StatefulWidget {
  const TodoScreen({super.key});

  @override
  State<TodoScreen> createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          for(int i=1; i<=10; i++)
            {
              context.read<TodoBloc>().add(TodoAddEvent(task: 'Saad ${i.toString()}'));
            }

        },
        child: Icon(Icons.add),
      ),
      body: BlocBuilder<TodoBloc,TodoState>(builder: (BuildContext context, state) {
        if(state.todoList.isEmpty)
          {
            return Center(
              child: Text('No Data'),
            );
          }
        else if(state.todoList.isNotEmpty)
          {
            return ListView.builder(
              itemCount: state.todoList.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text('${state.todoList[index]}'),
                  trailing: GestureDetector(
                      onTap: (){
                        context.read<TodoBloc>().add(RemoveTodoEvent(task: state.todoList[index]));
                      },
                      child: Icon(Icons.delete)),
                );
              },);

          }
        else
          {
            return SizedBox();
          }

      },

      )
    );
  }
}
