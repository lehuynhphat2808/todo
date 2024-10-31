class Todo {
  String title;
  bool isComplete;

  Todo({required this.title, this.isComplete = false});

  factory Todo.fromJson(Map<String, dynamic> json) {
    return Todo(title: json['title'], isComplete: json['isComplete']);
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'isComplete': isComplete,
    };
  }
}
