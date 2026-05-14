import 'package:equatable/equatable.dart';

class Note extends Equatable {
  final String id;
  final String title;
  final String content;
  final DateTime date;
  final DateTime? startTime;
  final DateTime? endTime;
  final bool hasReminder;
  final DateTime? reminderTime;
  final String repeatType;
  final String priority;
  final String? mood;
  final int color;
  final List<String> tags;
  final List<ChecklistItem> checklist;
  final List<String> attachments;
  final String? voiceNotePath;
  final String? location;
  final bool isPinned;
  final bool isArchived;
  final DateTime createdAt;
  final DateTime updatedAt;

  const Note({
    required this.id,
    required this.title,
    required this.content,
    required this.date,
    this.startTime,
    this.endTime,
    this.hasReminder = false,
    this.reminderTime,
    this.repeatType = 'none',
    this.priority = 'medium',
    this.mood,
    this.color = 0xFF4CAF50,
    this.tags = const [],
    this.checklist = const [],
    this.attachments = const [],
    this.voiceNotePath,
    this.location,
    this.isPinned = false,
    this.isArchived = false,
    required this.createdAt,
    required this.updatedAt,
  });

  bool get isToday {
    final now = DateTime.now();
    return now.year == date.year &&
        now.month == date.month &&
        now.day == date.day;
  }

  bool get isPast => date.isBefore(DateTime.now());
  bool get isFuture => date.isAfter(DateTime.now());

  bool get isCompleted {
    if (checklist.isEmpty) return false;
    return checklist.every((item) => item.isCompleted);
  }

  double get completionPercentage {
    if (checklist.isEmpty) return 0.0;
    final completed = checklist.where((item) => item.isCompleted).length;
    return completed / checklist.length;
  }

  bool get isOverdue {
    if (endTime == null) return false;
    return endTime!.isBefore(DateTime.now()) && !isCompleted;
  }

  Note copyWith({
    String? id,
    String? title,
    String? content,
    DateTime? date,
    DateTime? startTime,
    DateTime? endTime,
    bool? hasReminder,
    DateTime? reminderTime,
    String? repeatType,
    String? priority,
    String? mood,
    int? color,
    List<String>? tags,
    List<ChecklistItem>? checklist,
    List<String>? attachments,
    String? voiceNotePath,
    String? location,
    bool? isPinned,
    bool? isArchived,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return Note(
      id: id ?? this.id,
      title: title ?? this.title,
      content: content ?? this.content,
      date: date ?? this.date,
      startTime: startTime ?? this.startTime,
      endTime: endTime ?? this.endTime,
      hasReminder: hasReminder ?? this.hasReminder,
      reminderTime: reminderTime ?? this.reminderTime,
      repeatType: repeatType ?? this.repeatType,
      priority: priority ?? this.priority,
      mood: mood ?? this.mood,
      color: color ?? this.color,
      tags: tags ?? this.tags,
      checklist: checklist ?? this.checklist,
      attachments: attachments ?? this.attachments,
      voiceNotePath: voiceNotePath ?? this.voiceNotePath,
      location: location ?? this.location,
      isPinned: isPinned ?? this.isPinned,
      isArchived: isArchived ?? this.isArchived,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  List<Object?> get props => [
        id,
        title,
        content,
        date,
        startTime,
        endTime,
        hasReminder,
        reminderTime,
        repeatType,
        priority,
        mood,
        color,
        tags,
        checklist,
        attachments,
        voiceNotePath,
        location,
        isPinned,
        isArchived,
        createdAt,
        updatedAt,
      ];
}

class ChecklistItem extends Equatable {
  final String id;
  final String content;
  final bool isCompleted;
  final int order;

  const ChecklistItem({
    required this.id,
    required this.content,
    this.isCompleted = false,
    required this.order,
  });

  ChecklistItem copyWith({
    String? id,
    String? content,
    bool? isCompleted,
    int? order,
  }) {
    return ChecklistItem(
      id: id ?? this.id,
      content: content ?? this.content,
      isCompleted: isCompleted ?? this.isCompleted,
      order: order ?? this.order,
    );
  }

  @override
  List<Object?> get props => [id, content, isCompleted, order];
}
