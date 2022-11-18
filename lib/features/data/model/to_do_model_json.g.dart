// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'to_do_model_json.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ToDoModelJsonSerializable _$ToDoModelJsonSerializableFromJson(
        Map<String, dynamic> json) =>
    ToDoModelJsonSerializable(
      userId: json['userId'] as String,
      id: json['id'] as String,
      title: json['title'] as String,
      completed: json['completed'] as bool,
    );

Map<String, dynamic> _$ToDoModelJsonSerializableToJson(
        ToDoModelJsonSerializable instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'id': instance.id,
      'title': instance.title,
      'completed': instance.completed,
    };
