class Task {
  String id;
  String title;
  bool complete;

  Task({
    this.id = '', // Provide a default value for id
    required this.title,
    this.complete = false,
  });

  // Convert Task object to a Map
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'complete': complete,
    };
  }

  // Factory constructor to create a Task object from a Map
  factory Task.fromMap(Map<String, dynamic> map) {
    return Task(
      id: map['id'],
      title: map['title'],
      complete: map['complete'] ?? false,
    );
  }

  // Constructor to create a Task object from a string representation
  Task.fromString(String taskString)
      : id = '', // You might want to generate an id here or pass it from outside
        title = taskString,
        complete = false;
}
