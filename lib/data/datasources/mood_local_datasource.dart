import 'dart:convert';
import 'package:vietlife_note/data/database/app_database.dart' as db;
import 'package:vietlife_note/domain/entities/mood.dart';
import 'package:drift/drift.dart';

abstract class MoodLocalDataSource {
  Future<List<Mood>> getAllMoods();
  Future<List<Mood>> getMoodsByMonth(int year, int month);
  Future<Mood?> getMoodByDate(DateTime date);
  Future<void> insertMood(Mood mood);
  Future<void> updateMood(Mood mood);
  Future<void> deleteMood(String id);
}

class MoodLocalDataSourceImpl implements MoodLocalDataSource {
  final db.AppDatabase database;

  MoodLocalDataSourceImpl({required this.database});

  @override
  Future<List<Mood>> getAllMoods() async {
    final moods = await database.getAllMoods();
    return moods.map(_mapToEntity).toList();
  }

  @override
  Future<List<Mood>> getMoodsByMonth(int year, int month) async {
    final moods = await database.getMoodsByMonth(year, month);
    return moods.map(_mapToEntity).toList();
  }

  @override
  Future<Mood?> getMoodByDate(DateTime date) async {
    final mood = await database.getMoodByDate(date);
    return mood != null ? _mapToEntity(mood) : null;
  }

  @override
  Future<void> insertMood(Mood mood) async {
    await database.insertMood(_mapToTable(mood));
  }

  @override
  Future<void> updateMood(Mood mood) async {
    await database.updateMood(_mapToTable(mood));
  }

  @override
  Future<void> deleteMood(String id) async {
    final mood = await database.getMoodById(id);
    if (mood != null) {
      await database.deleteMood(mood);
    }
  }

  Mood _mapToEntity(db.Mood mood) {
    return Mood(
      id: mood.id,
      moodType: mood.moodType,
      date: mood.date,
      note: mood.note,
      tags: _decodeTags(mood.tags),
      createdAt: mood.createdAt,
    );
  }

  db.Mood _mapToTable(Mood mood) {
    return db.Mood(
      id: mood.id,
      moodType: mood.moodType,
      date: mood.date,
      note: mood.note,
      tags: _encodeTags(mood.tags),
      createdAt: mood.createdAt,
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
}
