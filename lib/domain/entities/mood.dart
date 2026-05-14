import 'package:equatable/equatable.dart';

class Mood extends Equatable {
  final String id;
  final String moodType;
  final DateTime date;
  final String? note;
  final List<String> tags;
  final DateTime createdAt;

  const Mood({
    required this.id,
    required this.moodType,
    required this.date,
    this.note,
    this.tags = const [],
    required this.createdAt,
  });

  bool get isToday {
    final now = DateTime.now();
    return now.year == date.year &&
        now.month == date.month &&
        now.day == date.day;
  }

  Mood copyWith({
    String? id,
    String? moodType,
    DateTime? date,
    String? note,
    List<String>? tags,
    DateTime? createdAt,
  }) {
    return Mood(
      id: id ?? this.id,
      moodType: moodType ?? this.moodType,
      date: date ?? this.date,
      note: note ?? this.note,
      tags: tags ?? this.tags,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  List<Object?> get props => [id, moodType, date, note, tags, createdAt];
}
