import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todos_repository/src/models/todo.dart';

import 'todos_repository.dart';
import 'entities/entities.dart';

class FirestoreTodoRepo implements TodoRepository {
  final _collection = Firestore.instance.collection('todos');
  @override
  Future<void> addTodo(Todo todo) async {
    await _collection.add(todo.toEntity().toDocument());
  }

  @override
  Future<void> deleteTodo(Todo todo) async {
    await _collection.document(todo.id).delete();
  }

  @override
  Future<void> updateTodo(Todo todo) async {
    await _collection
        .document(todo.id)
        .updateData(todo.toEntity().toDocument());
  }

  @override
  Stream<List<Todo>> todos() {
    //return _collection.snapshots().map((event) => event.documents.map((e) => Todo.fromEntity(TodoEntity.fromSnapshot(e))));
    //return _collection.getDocuments().then((value) => value.documents.map((e) => Todo.fromEntity(TodoEntity.fromSnapshot(e))).toList());
    return _collection.getDocuments().asStream().map((event) => event.documents
        .map((e) => Todo.fromEntity(TodoEntity.fromSnapshot(e)))
        .toList());
  }
}
