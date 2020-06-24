import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class TodoEntity extends Equatable {

  final bool complete;
  final String id;
  final String note;
  final String task;
  const TodoEntity({
    this.complete,
    this.id,
    this.note,
    this.task,
  });
  
  @override
  List<Object> get props => [complete, id, note, task];

  TodoEntity copyWith({
    bool complete,
    String id,
    String note,
    String task,
  }) {
    return TodoEntity(
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

  static TodoEntity fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
  
    return TodoEntity(
      complete: map['complete'],
      id: map['id'],
      note: map['note'],
      task: map['task'],
    );
  }

  String toJson() => json.encode(toMap());

  static TodoEntity fromJson(String source) => fromMap(json.decode(source));

  @override
  String toString() {
    return 'TodoEntity(complete: $complete, id: $id, note: $note, task: $task)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
  
    return o is TodoEntity &&
      o.complete == complete &&
      o.id == id &&
      o.note == note &&
      o.task == task;
  }

  @override
  int get hashCode {
    return complete.hashCode ^
      id.hashCode ^
      note.hashCode ^
      task.hashCode;
  }

  static TodoEntity fromSnapshot( DocumentSnapshot snapshot){
    return TodoEntity(
      complete: snapshot.data['isComplete'],
      id: snapshot.documentID,
      note: snapshot.data['note'],
      task: snapshot.data['task'],
    );
  }

  toDocument(){
    return null;
  }
}
