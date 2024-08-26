import 'package:equatable/equatable.dart';

abstract class TodoEvent extends Equatable
{
  const TodoEvent();
}

class TodoAddEvent extends TodoEvent
{
  final String task;
  TodoAddEvent({required this.task});
  @override
  List<Object> get props=>[];
}
class RemoveTodoEvent extends TodoEvent
{
  final Object task;
  RemoveTodoEvent({required this.task});
  @override
  List<Object> get props=>[];
}
