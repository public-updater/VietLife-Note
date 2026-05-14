import 'package:vietlife_note/data/database/app_database.dart' as db;
import 'package:vietlife_note/domain/entities/holiday.dart';
import 'package:drift/drift.dart';

abstract class HolidayLocalDataSource {
  Future<List<Holiday>> getAllHolidays();
  Future<List<Holiday>> getHolidaysByYear(int year);
  Future<List<Holiday>> getUpcomingHolidays();
  Future<Holiday?> getHolidayById(String id);
  Future<void> insertHoliday(Holiday holiday);
  Future<void> updateHoliday(Holiday holiday);
  Future<void> deleteHoliday(String id);
  Future<void> insertHolidays(List<Holiday> holidays);
}

class HolidayLocalDataSourceImpl implements HolidayLocalDataSource {
  final db.AppDatabase database;

  HolidayLocalDataSourceImpl({required this.database});

  @override
  Future<List<Holiday>> getAllHolidays() async {
    final holidays = await database.getAllHolidays();
    return holidays.map(_mapToEntity).toList();
  }

  @override
  Future<List<Holiday>> getHolidaysByYear(int year) async {
    final holidays = await database.getHolidaysByYear(year);
    return holidays.map(_mapToEntity).toList();
  }

  @override
  Future<List<Holiday>> getUpcomingHolidays() async {
    final holidays = await database.getUpcomingHolidays();
    return holidays.map(_mapToEntity).toList();
  }

  @override
  Future<Holiday?> getHolidayById(String id) async {
    final holiday = await database.getHolidayById(id);
    return holiday != null ? _mapToEntity(holiday) : null;
  }

  @override
  Future<void> insertHoliday(Holiday holiday) async {
    await database.insertHoliday(_mapToTable(holiday));
  }

  @override
  Future<void> updateHoliday(Holiday holiday) async {
    await database.updateHoliday(_mapToTable(holiday));
  }

  @override
  Future<void> deleteHoliday(String id) async {
    final holiday = await database.getHolidayById(id);
    if (holiday != null) {
      await database.deleteHoliday(holiday);
    }
  }

  @override
  Future<void> insertHolidays(List<Holiday> holidays) async {
    for (final holiday in holidays) {
      await database.insertHoliday(_mapToTable(holiday));
    }
  }

  Holiday _mapToEntity(db.Holiday holiday) {
    return Holiday(
      id: holiday.id,
      title: holiday.title,
      date: holiday.date,
      type: holiday.type,
      color: holiday.color,
      shortDescription: holiday.shortDescription,
      longDescription: holiday.longDescription,
      imageUrl: holiday.imageUrl,
      isHoliday: holiday.isHoliday,
      isLunarDate: holiday.isLunarDate,
      quote: holiday.quote,
      endDate: holiday.endDate,
      tags: _decodeTags(holiday.tags),
    );
  }

  db.Holiday _mapToTable(Holiday holiday) {
    return db.Holiday(
      id: holiday.id,
      title: holiday.title,
      date: holiday.date,
      type: holiday.type,
      color: holiday.color,
      shortDescription: holiday.shortDescription,
      longDescription: holiday.longDescription,
      imageUrl: holiday.imageUrl,
      isHoliday: holiday.isHoliday,
      isLunarDate: holiday.isLunarDate,
      quote: holiday.quote,
      endDate: holiday.endDate,
      tags: _encodeTags(holiday.tags),
    );
  }

  List<String> _decodeTags(String tagsJson) {
    try {
      return List<String>.from(
        // Simple JSON decode - in production use dart:convert
        tagsJson.replaceAll('[', '').replaceAll(']', '').replaceAll('"', '').split(',').map((e) => e.trim()).where((e) => e.isNotEmpty),
      );
    } catch (e) {
      return [];
    }
  }

  String _encodeTags(List<String> tags) {
    return tags.map((e) => '"$e"').join(',');
  }
}
