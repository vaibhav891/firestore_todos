part of 'todos_bloc.dart';

abstract class TodosState extends Equatable {
  const TodosState();

  @override
  List<Object> get props => [];
}

class TodosLoadInProgress extends TodosState{}

class TodosLoadSuccess extends TodosState {
  final List<Todo> todos;

  const TodosLoadSuccess(this.todos);

  @override
  List<Object> get props => [todos];


  @override
  String toString() => 'TodosLoadSuccess(todos: $todos)';
}

class TodosLoadFailure extends TodosState{}