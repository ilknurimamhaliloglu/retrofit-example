class ToDoModel {
  final int userId;
  final int id;
  final String title;
  final bool completed;

  ToDoModel({
    required this.userId,
    required this.id,
    required this.title,
    required this.completed,
  });

  factory ToDoModel.fromJson(Map<String, dynamic> json) {
    return ToDoModel(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
      completed: json['completed'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'id': id,
      'title': title,
      'completed': completed,
    };
  }
}
