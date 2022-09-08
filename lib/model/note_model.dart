class Note {
  final String title;
  final String content;
  final String timestamp;

  Note(
      {
      required this.title,
      required this.content,
      required this.timestamp});

  Note.fromMap(Map<String, dynamic> item)
      : 
        title = item["title"],
        content = item["content"],
        timestamp = item["timestamp"];

  Map<String, Object> toMap() {
    return {
      "title": title,
      "content": content,
      "timestamp": timestamp,
    };
  }
}
