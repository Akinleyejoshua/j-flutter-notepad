class Todo {
  final String content;

  Todo({
    required this.content,
  });

  Todo.fromMap(Map<String, dynamic> item) : content = item["content"];

  Map<String, Object> toMap() {
    return {
      "content": content,
    };
  }
}
