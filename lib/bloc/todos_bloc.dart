import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
//import 'package:firestore_todos/todo.dart';
import 'package:todos_repository/todos_repository.dart';

part 'todos_event.dart';
part 'todos_state.dart';

class TodosBloc extends Bloc<TodosEvent, TodosState> {

  final TodoRepository _todoRepository;

  TodosBloc(this._todoRepository);

  @override
  TodosState get initialState => TodosLoadInProgress();

  @override
  Stream<TodosState> mapEventToState(
    TodosEvent event,
  ) async* {
    if (event is TodoLoadSuccess) {
      yield* _mapTodoLoadSuccessEventToState();
    } else if (event is TodoAdded) {
      yield* _mapTodoAddedEventToState(event);
    } else if (event is TodoUpdated) {
      yield* _mapTodoUpdatedEventToState();
    } else if (event is TodoDeleted) {
      yield* _mapTodoDeletedEventToState();
    } else if (event is ClearCompleted) {
      yield* _mapCLearCompletedEventToState();
    } else if (event is ToggleAll) {
      yield* _mapToggleAllEventToState();
    }
  }

  Stream<TodosState> _mapTodoLoadSuccessEventToState() async*{
//final todos =   
_todoRepository.todos();
//yield TodosLoadSuccess(todos);
  }

  Stream<TodosState> _mapTodoAddedEventToState(TodoAdded todoAdded) async* {
    _todoRepository.addTodo(todoAdded.todo);
  }

  _mapTodoUpdatedEventToState() {}

  _mapTodoDeletedEventToState() {}

  _mapCLearCompletedEventToState() {}

  _mapToggleAllEventToState() {}
}
