import 'package:bloc/bloc.dart';
import 'package:bloc_prac/bloc/todo_bloc/todo_event.dart';
import 'package:bloc_prac/bloc/todo_bloc/todo_state.dart';

class TodoBloc extends Bloc<TodoEvent,TodoState>
{
  final List<String> todoList=[];
  TodoBloc():super(const TodoState()){
    on<TodoAddEvent>(_todoAddEvent);
    on<RemoveTodoEvent>(_removeTodoEvent);
  }

  void _todoAddEvent(TodoAddEvent event,Emitter<TodoState> emit)
  {
    todoList.add(event.task);
    emit(state.copyWith(todoList:List.from(todoList) ));
  }

  void _removeTodoEvent(RemoveTodoEvent event,Emitter<TodoState> emit)
  {
    todoList.remove(event.task);
    emit(state.copyWith(todoList:List.from(todoList) ));
  }


}