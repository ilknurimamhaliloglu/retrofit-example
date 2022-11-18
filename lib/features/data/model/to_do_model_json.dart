import 'package:json_annotation/json_annotation.dart';

part 'to_do_model_json.g.dart';

@JsonSerializable()
class ToDoModelJsonSerializable {
  final String userId;
  final String id;
  final String title;
  final bool completed;

  ToDoModelJsonSerializable({
    required this.userId,
    required this.id,
    required this.title,
    required this.completed,
  });

  factory ToDoModelJsonSerializable.fromJson(Map<String, dynamic> json) =>
      _$ToDoModelJsonSerializableFromJson(json);

  Map<String, dynamic> toJson() => _$ToDoModelJsonSerializableToJson(this);
}
