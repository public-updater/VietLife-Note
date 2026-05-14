import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vietlife_note/data/datasources/note_local_datasource.dart';
import 'package:vietlife_note/data/datasources/mood_local_datasource.dart';
import 'package:vietlife_note/domain/entities/note.dart';
import 'package:vietlife_note/domain/entities/mood.dart';

class SyncService {
  // Singleton pattern
  static final SyncService _instance = SyncService._internal();
  factory SyncService() => _instance;
  SyncService._internal();

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  String? get _userId => _auth.currentUser?.uid;

  /// Check if user is logged in
  bool get isLoggedIn => _userId != null;

  // Collection references
  DocumentReference _userDoc(String uid) => _firestore.collection('users').doc(uid);
  CollectionReference _notesCol(String uid) => _userDoc(uid).collection('notes');
  CollectionReference _moodsCol(String uid) => _userDoc(uid).collection('moods');

  /// Upload a single note to Firestore
  Future<bool> uploadSingleNote(Note note) async {
    final uid = _userId;
    if (uid == null || note.id.isEmpty) return false;
    try {
      await _notesCol(uid)
          .doc(note.id)
          .set(_noteToMap(note), SetOptions(merge: true))
          .timeout(const Duration(seconds: 15));
      debugPrint('[Sync] Auto-backed up note: ${note.id}');
      return true;
    } catch (e) {
      debugPrint('[Sync] Failed to auto-backup note ${note.id}: $e');
      return false;
    }
  }

  /// Delete a note from Firestore
  Future<bool> deleteNoteFromCloud(String noteId) async {
    final uid = _userId;
    if (uid == null) return false;
    try {
      await _notesCol(uid)
          .doc(noteId)
          .delete()
          .timeout(const Duration(seconds: 15));
      debugPrint('[Sync] Deleted note from cloud: $noteId');
      return true;
    } catch (e) {
      debugPrint('[Sync] Failed to delete note from cloud $noteId: $e');
      return false;
    }
  }

  /// Upload a single mood to Firestore
  Future<bool> uploadSingleMood(Mood mood) async {
    final uid = _userId;
    if (uid == null || mood.id.isEmpty) return false;
    try {
      await _moodsCol(uid)
          .doc(mood.id)
          .set(_moodToMap(mood), SetOptions(merge: true))
          .timeout(const Duration(seconds: 15));
      debugPrint('[Sync] Auto-backed up mood: ${mood.id}');
      return true;
    } catch (e) {
      debugPrint('[Sync] Failed to auto-backup mood ${mood.id}: $e');
      return false;
    }
  }

  Map<String, dynamic> _noteToMap(Note note) => {
    'id': note.id,
    'title': note.title,
    'content': note.content,
    'date': note.date.toIso8601String(),
    'startTime': note.startTime?.toIso8601String(),
    'endTime': note.endTime?.toIso8601String(),
    'hasReminder': note.hasReminder,
    'reminderTime': note.reminderTime?.toIso8601String(),
    'repeatType': note.repeatType,
    'priority': note.priority,
    'mood': note.mood,
    'color': note.color,
    'tags': note.tags,
    'checklist': note.checklist.map((item) => {
      'id': item.id,
      'content': item.content,
      'isCompleted': item.isCompleted,
      'order': item.order,
    }).toList(),
    'voiceNotePath': note.voiceNotePath,
    'location': note.location,
    'isPinned': note.isPinned,
    'isArchived': note.isArchived,
    'createdAt': note.createdAt.toIso8601String(),
    'updatedAt': note.updatedAt.toIso8601String(),
  };

  Map<String, dynamic> _moodToMap(Mood mood) => {
    'id': mood.id,
    'moodType': mood.moodType,
    'date': mood.date.toIso8601String(),
    'note': mood.note,
    'tags': mood.tags,
    'createdAt': mood.createdAt.toIso8601String(),
  };

  /// Upload notes in batches
  Future<bool> uploadNotes(List<Note> notes) async {
    final uid = _userId;
    if (uid == null) throw Exception('Chưa đăng nhập');
    if (notes.isEmpty) return true;

    final notesCol = _notesCol(uid);
    const batchSize = 100;

    for (int i = 0; i < notes.length; i += batchSize) {
      final chunk = notes.skip(i).take(batchSize).toList();
      final batch = _firestore.batch();
      int written = 0;

      for (final note in chunk) {
        if (note.id.isEmpty) continue;
        batch.set(notesCol.doc(note.id), _noteToMap(note), SetOptions(merge: true));
        written++;
      }

      if (written > 0) {
        await batch.commit().timeout(const Duration(seconds: 30));
      }
    }
    return true;
  }

  /// Upload moods in batches
  Future<bool> uploadMoods(List<Mood> moods) async {
    final uid = _userId;
    if (uid == null) throw Exception('Chưa đăng nhập');
    if (moods.isEmpty) return true;

    final moodsCol = _moodsCol(uid);
    const batchSize = 100;

    for (int i = 0; i < moods.length; i += batchSize) {
      final chunk = moods.skip(i).take(batchSize).toList();
      final batch = _firestore.batch();
      int written = 0;

      for (final mood in chunk) {
        if (mood.id.isEmpty) continue;
        batch.set(moodsCol.doc(mood.id), _moodToMap(mood), SetOptions(merge: true));
        written++;
      }

      if (written > 0) {
        await batch.commit().timeout(const Duration(seconds: 30));
      }
    }
    return true;
  }

  /// Sync local settings to Firestore — stored in user document
  Future<bool> uploadSettings() async {
    final uid = _userId;
    if (uid == null) return false;

    try {
      final prefs = await SharedPreferences.getInstance();
      final isDark = prefs.getBool('is_dark_mode') ?? false;
      final accentColor = prefs.getInt('accent_color') ?? Colors.blue.value;

      await _userDoc(uid).set({
        'settings': {
          'is_dark_mode': isDark,
          'accent_color': accentColor,
          'updatedAt': FieldValue.serverTimestamp(),
        }
      }, SetOptions(merge: true)).timeout(const Duration(seconds: 10));

      debugPrint('[Sync] Settings uploaded to user doc');
      return true;
    } catch (e) {
      debugPrint('[Sync] Error uploading settings: $e');
      return false;
    }
  }

  /// Download everything from server
  Future<bool> downloadAndSync({
    required NoteLocalDataSource noteDataSource,
    required MoodLocalDataSource moodDataSource,
  }) async {
    final uid = _userId;
    if (uid == null) return false;

    try {
      // 1. Download Settings
      final userSnap = await _userDoc(uid).get().timeout(const Duration(seconds: 15));
      if (userSnap.exists) {
        final data = userSnap.data() as Map<String, dynamic>?;
        final settings = data?['settings'] as Map<String, dynamic>?;
        if (settings != null) {
          final prefs = await SharedPreferences.getInstance();
          if (settings['is_dark_mode'] != null) {
            await prefs.setBool('is_dark_mode', settings['is_dark_mode'] as bool);
          }
          if (settings['accent_color'] != null) {
            await prefs.setInt('accent_color', settings['accent_color'] as int);
          }
        }
      }

      // 2. Download Notes
      final notesSnap = await _notesCol(uid).get().timeout(const Duration(seconds: 30));
      final List<Note> serverNotes = [];
      for (final doc in notesSnap.docs) {
        if (doc.id == '__settings__') continue; // Legacy skip
        try {
          final data = doc.data() as Map<String, dynamic>;
          serverNotes.add(_mapToNote(doc.id, data));
        } catch (e) {
          debugPrint('[Sync] Error parsing note ${doc.id}: $e');
        }
      }
      if (serverNotes.isNotEmpty) await noteDataSource.bulkUpsertNotes(serverNotes);

      // 3. Download Moods
      final moodsSnap = await _moodsCol(uid).get().timeout(const Duration(seconds: 30));
      for (final doc in moodsSnap.docs) {
        try {
          final data = doc.data() as Map<String, dynamic>;
          await moodDataSource.insertMood(_mapToMood(doc.id, data));
        } catch (e) {
          debugPrint('[Sync] Error parsing mood ${doc.id}: $e');
        }
      }

      return true;
    } catch (e) {
      debugPrint('[Sync] Download Error: $e');
      return false;
    }
  }

  Note _mapToNote(String id, Map<String, dynamic> data) {
    return Note(
      id: id,
      title: data['title'] as String? ?? '',
      content: data['content'] as String? ?? '',
      date: DateTime.parse(data['date'] as String),
      startTime: data['startTime'] != null ? DateTime.parse(data['startTime'] as String) : null,
      endTime: data['endTime'] != null ? DateTime.parse(data['endTime'] as String) : null,
      hasReminder: data['hasReminder'] as bool? ?? false,
      reminderTime: data['reminderTime'] != null ? DateTime.parse(data['reminderTime'] as String) : null,
      repeatType: data['repeatType'] as String? ?? 'none',
      priority: data['priority'] as String? ?? 'medium',
      mood: data['mood'] as String?,
      color: data['color'] as int? ?? 0xFF4CAF50,
      tags: data['tags'] != null ? List<String>.from(data['tags'] as List) : [],
      checklist: data['checklist'] != null
          ? (data['checklist'] as List).map((item) {
              final map = Map<String, dynamic>.from(item as Map);
              return ChecklistItem(
                id: map['id'] as String? ?? '',
                content: map['content'] as String? ?? '',
                isCompleted: map['isCompleted'] as bool? ?? false,
                order: map['order'] as int? ?? 0,
              );
            }).toList()
          : [],
      voiceNotePath: data['voiceNotePath'] as String?,
      location: data['location'] as String?,
      isPinned: data['isPinned'] as bool? ?? false,
      isArchived: data['isArchived'] as bool? ?? false,
      createdAt: data['createdAt'] != null ? DateTime.parse(data['createdAt'] as String) : DateTime.now(),
      updatedAt: data['updatedAt'] != null ? DateTime.parse(data['updatedAt'] as String) : DateTime.now(),
    );
  }

  Mood _mapToMood(String id, Map<String, dynamic> data) {
    return Mood(
      id: id,
      moodType: data['moodType'] as String? ?? 'happy',
      date: DateTime.parse(data['date'] as String),
      note: data['note'] as String?,
      tags: data['tags'] != null ? List<String>.from(data['tags'] as List) : [],
      createdAt: data['createdAt'] != null ? DateTime.parse(data['createdAt'] as String) : DateTime.now(),
    );
  }
}