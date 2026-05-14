import 'package:equatable/equatable.dart';

class Reminder extends Equatable {
  final String id;
  final String noteId;
  final DateTime reminderTime;
  final String repeatType;
  final bool isEnabled;
  final DateTime? lastTriggered;
  final DateTime createdAt;
  final DateTime updatedAt;

  const Reminder({
    required this.id,
    required this.noteId,
    required this.reminderTime,
    required this.repeatType,
    this.isEnabled = true,
    this.lastTriggered,
    required this.createdAt,
    required this.updatedAt,
  });

  bool get isDue {
    return DateTime.now().isAfter(reminderTime) && isEnabled;
  }

  Reminder copyWith({
    String? id,
    String? noteId,
    DateTime? reminderTime,
    String? repeatType,
    bool? isEnabled,
    DateTime? lastTriggered,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return Reminder(
      id: id ?? this.id,
      noteId: noteId ?? this.noteId,
      reminderTime: reminderTime ?? this.reminderTime,
      repeatType: repeatType ?? this.repeatType,
      isEnabled: isEnabled ?? this.isEnabled,
      lastTriggered: lastTriggered ?? this.lastTriggered,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  List<Object?> get props => [
        id,
        noteId,
        reminderTime,
        repeatType,
        isEnabled,
        lastTriggered,
        createdAt,
        updatedAt,
      ];
}
