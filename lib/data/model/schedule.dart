class Schedule {
  final int id;
  final String title;
  final String description;
  final DateTime dueDate;
  final bool isCompleted;
  final DateTime createdAt;

  Schedule(
      {required this.id,
      required this.title,
      required this.description,
      required this.dueDate,
      required this.isCompleted,
      required this.createdAt
      });

  Schedule copyWith({
    int? id,
    String? title,
    String? description,
    DateTime? dueDate,
    bool? isCompleted,
    DateTime? createdAt,
}) {
    return Schedule(
        id: id ?? this.id,
        title: title ?? this.title,
        description: description ?? this.description,
        dueDate: dueDate ?? this.dueDate,
        isCompleted: isCompleted ?? this.isCompleted,
        createdAt: createdAt ?? this.createdAt,
    );
  }
}
