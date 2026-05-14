import 'package:vietlife_note/domain/entities/note.dart';
import 'package:json_annotation/json_annotation.dart';

part 'note_model.g.dart';

@JsonSerializable()
class NoteModel {
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
  final List<ChecklistItemModel> checklist;
  final List<String> attachments;
  final String? voiceNotePath;
  final String? location;
  final bool isPinned;
  final bool isArchived;
  final DateTime createdAt;
  final DateTime updatedAt;

  NoteModel({
    required this.id,
    required this.title,
    required this.content,
    required this.date,
    this.startTime,
    this.endTime,
    required this.hasReminder,
    this.reminderTime,
    required this.repeatType,
    required this.priority,
    this.mood,
    required this.color,
    required this.tags,
    required this.checklist,
    required this.attachments,
    this.voiceNotePath,
    this.location,
    required this.isPinned,
    required this.isArchived,
    required this.createdAt,
    required this.updatedAt,
  });

  factory NoteModel.fromJson(Map<String, dynamic> json) =>
      _$NoteModelFromJson(json);

  Map<String, dynamic> toJson() => _$NoteModelToJson(this);

  Note toEntity() {
    return Note(
      id: id,
      title: title,
      content: content,
      date: date,
      startTime: startTime,
      endTime: endTime,
      hasReminder: hasReminder,
      reminderTime: reminderTime,
      repeatType: repeatType,
      priority: priority,
      mood: mood,
      color: color,
      tags: tags,
      checklist: checklist.map((item) => item.toEntity()).toList(),
      attachments: attachments,
      voiceNotePath: voiceNotePath,
      location: location,
      isPinned: isPinned,
      isArchived: isArchived,
      createdAt: createdAt,
      updatedAt: updatedAt,
    );
  }

  factory NoteModel.fromEntity(Note note) {
    return NoteModel(
      id: note.id,
      title: note.title,
      content: note.content,
      date: note.date,
      startTime: note.startTime,
      endTime: note.endTime,
      hasReminder: note.hasReminder,
      reminderTime: note.reminderTime,
      repeatType: note.repeatType,
      priority: note.priority,
      mood: note.mood,
      color: note.color,
      tags: note.tags,
      checklist: note.checklist.map((item) => ChecklistItemModel.fromEntity(item)).toList(),
      attachments: note.attachments,
      voiceNotePath: note.voiceNotePath,
      location: note.location,
      isPinned: note.isPinned,
      isArchived: note.isArchived,
      createdAt: note.createdAt,
      updatedAt: note.updatedAt,
    );
  }
}

@JsonSerializable()
class ChecklistItemModel {
  final String id;
  final String content;
  final bool isCompleted;
  final int order;

  ChecklistItemModel({
    required this.id,
    required this.content,
    required this.isCompleted,
    required this.order,
  });

  factory ChecklistItemModel.fromJson(Map<String, dynamic> json) =>
      _$ChecklistItemModelFromJson(json);

  Map<String, dynamic> toJson() => _$ChecklistItemModelToJson(this);

  ChecklistItem toEntity() {
    return ChecklistItem(
      id: id,
      content: content,
      isCompleted: isCompleted,
      order: order,
    );
  }

  factory ChecklistItemModel.fromEntity(ChecklistItem item) {
    return ChecklistItemModel(
      id: item.id,
      content: item.content,
      isCompleted: item.isCompleted,
      order: item.order,
    );
  }
}
