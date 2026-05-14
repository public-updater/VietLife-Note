import 'dart:convert';
import 'package:vietlife_note/data/database/app_database.dart' as db;
import 'package:vietlife_note/domain/entities/note.dart';
import 'package:drift/drift.dart';

abstract class NoteLocalDataSource {
  Future<List<Note>> getAllNotes();
  Future<List<Note>> getPinnedNotes();
  Future<List<Note>> getArchivedNotes();
  Future<List<Note>> getNotesByDate(DateTime date);
  Future<Note?> getNoteById(String id);
  Future<void> insertNote(Note note);
  Future<void> bulkUpsertNotes(List<Note> noteList);
  Future<void> updateNote(Note note);
  Future<void> deleteNote(String id);
  Future<void> pinNote(String id);
  Future<void> unpinNote(String id);
  Future<void> archiveNote(String id);
  Future<void> unarchiveNote(String id);
}

class NoteLocalDataSourceImpl implements NoteLocalDataSource {
  final db.AppDatabase database;

  NoteLocalDataSourceImpl({required this.database});

  @override
  Future<List<Note>> getAllNotes() async {
    final notes = await database.getAllNotes();
    return notes.map(_mapToEntity).toList();
  }

  @override
  Future<List<Note>> getPinnedNotes() async {
    final notes = await database.getPinnedNotes();
    return notes.map(_mapToEntity).toList();
  }

  @override
  Future<List<Note>> getArchivedNotes() async {
    final notes = await database.getArchivedNotes();
    return notes.map(_mapToEntity).toList();
  }

  @override
  Future<List<Note>> getNotesByDate(DateTime date) async {
    final notes = await database.getNotesByDate(date);
    return notes.map(_mapToEntity).toList();
  }

  @override
  Future<Note?> getNoteById(String id) async {
    final note = await database.getNoteById(id);
    return note != null ? _mapToEntity(note) : null;
  }

  @override
  Future<void> insertNote(Note note) async {
    await database.insertNote(_mapToTable(note));
  }

  @override
  Future<void> bulkUpsertNotes(List<Note> noteList) async {
    await database.bulkUpsertNotes(noteList.map(_mapToTable).toList());
  }

  @override
  Future<void> updateNote(Note note) async {
    await database.updateNote(_mapToTable(note));
  }

  @override
  Future<void> deleteNote(String id) async {
    final note = await database.getNoteById(id);
    if (note != null) {
      await database.deleteNote(note);
    }
  }

  @override
  Future<void> pinNote(String id) async {
    final note = await database.getNoteById(id);
    if (note != null) {
      await database.updateNote(note.copyWith(isPinned: true));
    }
  }

  @override
  Future<void> unpinNote(String id) async {
    final note = await database.getNoteById(id);
    if (note != null) {
      await database.updateNote(note.copyWith(isPinned: false));
    }
  }

  @override
  Future<void> archiveNote(String id) async {
    final note = await database.getNoteById(id);
    if (note != null) {
      await database.updateNote(note.copyWith(isArchived: true));
    }
  }

  @override
  Future<void> unarchiveNote(String id) async {
    final note = await database.getNoteById(id);
    if (note != null) {
      await database.updateNote(note.copyWith(isArchived: false));
    }
  }

  Note _mapToEntity(db.Note note) {
    return Note(
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
      tags: _decodeTags(note.tags),
      checklist: _decodeChecklist(note.checklist),
      attachments: _decodeAttachments(note.attachments),
      voiceNotePath: note.voiceNotePath,
      location: note.location,
      isPinned: note.isPinned,
      isArchived: note.isArchived,
      createdAt: note.createdAt,
      updatedAt: note.updatedAt,
    );
  }

  db.Note _mapToTable(Note note) {
    return db.Note(
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
      tags: _encodeTags(note.tags),
      checklist: _encodeChecklist(note.checklist),
      attachments: _encodeAttachments(note.attachments),
      voiceNotePath: note.voiceNotePath,
      location: note.location,
      isPinned: note.isPinned,
      isArchived: note.isArchived,
      createdAt: note.createdAt,
      updatedAt: note.updatedAt,
    );
  }

  List<String> _decodeTags(String tagsJson) {
    try {
      if (tagsJson.isEmpty) return [];
      final List<dynamic> decoded = jsonDecode(tagsJson);
      return decoded.map((e) => e.toString()).toList();
    } catch (e) {
      return [];
    }
  }

  String _encodeTags(List<String> tags) {
    return jsonEncode(tags);
  }

  List<ChecklistItem> _decodeChecklist(String checklistJson) {
    try {
      if (checklistJson.isEmpty) return [];
      final List<dynamic> decoded = jsonDecode(checklistJson);
      return decoded.map((item) {
        final map = item as Map<String, dynamic>;
        return ChecklistItem(
          id: map['id'] as String,
          content: map['content'] as String,
          isCompleted: map['isCompleted'] as bool? ?? false,
          order: map['order'] as int? ?? 0,
        );
      }).toList();
    } catch (e) {
      return [];
    }
  }

  String _encodeChecklist(List<ChecklistItem> checklist) {
    return jsonEncode(checklist.map((item) => {
      'id': item.id,
      'content': item.content,
      'isCompleted': item.isCompleted,
      'order': item.order,
    }).toList());
  }

  List<String> _decodeAttachments(String attachmentsJson) {
    try {
      if (attachmentsJson.isEmpty) return [];
      final List<dynamic> decoded = jsonDecode(attachmentsJson);
      return decoded.map((e) => e.toString()).toList();
    } catch (e) {
      return [];
    }
  }

  String _encodeAttachments(List<String> attachments) {
    return jsonEncode(attachments);
  }
}
