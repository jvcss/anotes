class Topic {
  final int id;
  final String title;
  final String description;
  final String responsible;
  final String assignments;

  Topic({
    required this.id,
    required this.title,
    required this.description,
    required this.responsible,
    required this.assignments,
  });

  factory Topic.fromMap(Map<String, dynamic> map) {
    return Topic(
      id: map['id'],
      title: map['title'],
      description: map['description'],
      responsible: map['responsible'],
      assignments: map['assignments'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'responsible': responsible,
      'assignments': assignments,
    };
  }
}
