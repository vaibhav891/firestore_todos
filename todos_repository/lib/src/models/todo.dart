import 'dart:convert';
import '../entities/entities.dart';

class Todo {
  final bool complete;
  final String id;
  final String note;
  final String task;
  Todo({
    this.complete,
    this.id,
    this.note,
    this.task,
  });

  Todo copyWith({
    bool complete,
    String id,
    String note,
    String task,
  }) {
    return Todo(
      complete: complete ?? this.complete,
      id: id ?? this.id,
      note: note ?? this.note,
      task: task ?? this.task,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'complete': complete,
      'id': id,
      'note': note,
      'task': task,
    };
  }

  static Todo fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Todo(
      complete: map['complete'],
      id: map['id'],
      note: map['note'],
      task: map['task'],
    );
  }

  String toJson() => json.encode(toMap());

  static Todo fromJson(String source) => fromMap(json.decode(source));

  @override
  String toString() {
    return 'Todo(complete: $complete, id: $id, note: $note, task: $task)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is Todo &&
        o.complete == complete &&
        o.id == id &&
        o.note == note &&
        o.task == task;
  }

  @override
  int get hashCode {
    return complete.hashCode ^ id.hashCode ^ note.hashCode ^ task.hashCode;
  }

  TodoEntity toEntity() {
    return TodoEntity(complete: complete, id: id, note: note, task: task);
  }

  static Todo fromEntity(TodoEntity todoEntity) {
    return Todo(
      complete: todoEntity.complete,
      id: todoEntity.id,
      note: todoEntity.note,
      task: todoEntity.task,
    );
  }
}
