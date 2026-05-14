import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:vietlife_note/data/database/app_database.dart';

class CloudSyncService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Collection reference for user notes
  CollectionReference<Map<String, dynamic>> _userNotesCollection(String userId) {
    return _firestore.collection('users').doc(userId).collection('notes');
  }

  // Upload a local note to Firestore
  Future<void> uploadNote(NoteEntityData note) async {
    final user = _auth.currentUser;
    if (user == null) return;

    await _userNotesCollection(user.uid).doc(note.id).set({
      'id': note.id,
      'title': note.title,
      'content': note.content,
      'createdAt': note.createdAt.toIso8601String(),
      'updatedAt': note.updatedAt.toIso8601String(),
      'colorValue': note.colorValue,
      'isPinned': note.isPinned,
      'isArchived': note.isArchived,
      'hasAlarm': note.hasAlarm,
      'alarmTime': note.alarmTime?.toIso8601String(),
      'categoryId': note.categoryId,
      'mood': note.mood,
    });
  }

  // Delete a note from Firestore
  Future<void> deleteNote(String noteId) async {
    final user = _auth.currentUser;
    if (user == null) return;

    await _userNotesCollection(user.uid).doc(noteId).delete();
  }

  // Sync all local notes to Firestore (for backup)
  Future<void> backupAllNotes(List<NoteEntityData> notes) async {
    final user = _auth.currentUser;
    if (user == null) return;

    final batch = _firestore.batch();
    final collection = _userNotesCollection(user.uid);

    for (final note in notes) {
      final docRef = collection.doc(note.id);
      batch.set(docRef, {
        'id': note.id,
        'title': note.title,
        'content': note.content,
        'createdAt': note.createdAt.toIso8601String(),
        'updatedAt': note.updatedAt.toIso8601String(),
        'colorValue': note.colorValue,
        'isPinned': note.isPinned,
        'isArchived': note.isArchived,
        'hasAlarm': note.hasAlarm,
        'alarmTime': note.alarmTime?.toIso8601String(),
        'categoryId': note.categoryId,
        'mood': note.mood,
      });
    }

    await batch.commit();
  }

  // Get all notes from Firestore (for restore)
  Future<List<Map<String, dynamic>>> restoreAllNotes() async {
    final user = _auth.currentUser;
    if (user == null) return [];

    final snapshot = await _userNotesCollection(user.uid).get();
    return snapshot.docs.map((doc) => doc.data()).toList();
  }
}

final cloudSyncService = CloudSyncService();
