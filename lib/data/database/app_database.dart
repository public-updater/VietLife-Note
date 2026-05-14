import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'dart:io';

part 'app_database.g.dart';

class Notes extends Table {
  TextColumn get id => text()();
  TextColumn get title => text()();
  TextColumn get content => text()();
  DateTimeColumn get date => dateTime()();
  DateTimeColumn get startTime => dateTime().nullable()();
  DateTimeColumn get endTime => dateTime().nullable()();
  BoolColumn get hasReminder => boolean().withDefault(const Constant(false))();
  DateTimeColumn get reminderTime => dateTime().nullable()();
  TextColumn get repeatType => text().withDefault(const Constant('none'))();
  TextColumn get priority => text().withDefault(const Constant('medium'))();
  TextColumn get mood => text().nullable()();
  IntColumn get color => integer().withDefault(const Constant(0xFF4CAF50))();
  TextColumn get tags => text().withDefault(const Constant('[]'))();
  TextColumn get checklist => text().withDefault(const Constant('[]'))();
  TextColumn get attachments => text().withDefault(const Constant('[]'))();
  TextColumn get voiceNotePath => text().nullable()();
  TextColumn get location => text().nullable()();
  BoolColumn get isPinned => boolean().withDefault(const Constant(false))();
  BoolColumn get isArchived => boolean().withDefault(const Constant(false))();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();

  @override
  Set<Column> get primaryKey => {id};
}

class Holidays extends Table {
  TextColumn get id => text()();
  TextColumn get title => text()();
  DateTimeColumn get date => dateTime()();
  TextColumn get type => text()();
  IntColumn get color => integer()();
  TextColumn get shortDescription => text()();
  TextColumn get longDescription => text()();
  TextColumn get imageUrl => text().nullable()();
  BoolColumn get isHoliday => boolean()();
  BoolColumn get isLunarDate => boolean()();
  TextColumn get quote => text().nullable()();
  DateTimeColumn get endDate => dateTime().nullable()();
  TextColumn get tags => text().withDefault(const Constant('[]'))();

  @override
  Set<Column> get primaryKey => {id};
}

class Moods extends Table {
  TextColumn get id => text()();
  TextColumn get moodType => text()();
  DateTimeColumn get date => dateTime()();
  TextColumn get note => text().nullable()();
  TextColumn get tags => text().withDefault(const Constant('[]'))();
  DateTimeColumn get createdAt => dateTime()();

  @override
  Set<Column> get primaryKey => {id};
}

class UserSettings extends Table {
  TextColumn get id => text()();
  TextColumn get themeMode => text().withDefault(const Constant('system'))();
  TextColumn get accentColor => text().withDefault(const Constant('blue'))();
  BoolColumn get notificationsEnabled => boolean().withDefault(const Constant(true))();
  BoolColumn get biometricEnabled => boolean().withDefault(const Constant(false))();
  TextColumn get pin => text().nullable()();
  TextColumn get language => text().withDefault(const Constant('vi'))();
  BoolColumn get syncEnabled => boolean().withDefault(const Constant(true))();
  DateTimeColumn get lastSyncTime => dateTime()();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();

  @override
  Set<Column> get primaryKey => {id};
}

@DriftDatabase(tables: [Notes, Holidays, Moods, UserSettings])
class AppDatabase extends _$AppDatabase {
  AppDatabase(QueryExecutor e) : super(e);

  @override
  int get schemaVersion => 1;

  static AppDatabase create() {
    final executor = LazyDatabase(() async {
      final dbDir = await getApplicationDocumentsDirectory();
      final file = File(p.join(dbDir.path, 'vietlife_note.db'));
      return NativeDatabase.createInBackground(file);
    });
    return AppDatabase(executor);
  }

  // Note queries
  Future<List<Note>> getAllNotes() => select(notes).get();
  Future<List<Note>> getPinnedNotes() => (select(notes)..where((tbl) => tbl.isPinned.equals(true))).get();
  Future<List<Note>> getArchivedNotes() => (select(notes)..where((tbl) => tbl.isArchived.equals(true))).get();
  Future<List<Note>> getNotesByDate(DateTime date) {
    final start = DateTime(date.year, date.month, date.day);
    final end = DateTime(date.year, date.month, date.day, 23, 59, 59);
    return (select(notes)..where((tbl) => tbl.date.isBetweenValues(start, end))).get();
  }
  Future<Note?> getNoteById(String id) => (select(notes)..where((tbl) => tbl.id.equals(id))).getSingleOrNull();
  Future<int> insertNote(Note note) => into(notes).insert(note, mode: InsertMode.insertOrReplace);
  Future<bool> updateNote(Note note) => update(notes).replace(note);
  Future<int> deleteNote(Note note) => delete(notes).delete(note);
  Future<void> bulkUpsertNotes(List<Note> noteList) => transaction(() async {
    for (final note in noteList) {
      await into(notes).insert(note, mode: InsertMode.insertOrReplace);
    }
  });

  // Holiday queries
  Future<List<Holiday>> getAllHolidays() => select(holidays).get();
  Future<List<Holiday>> getHolidaysByYear(int year) {
    final start = DateTime(year, 1, 1);
    final end = DateTime(year, 12, 31, 23, 59, 59);
    return (select(holidays)..where((tbl) => tbl.date.isBetweenValues(start, end))).get();
  }
  Future<List<Holiday>> getUpcomingHolidays() {
    final now = DateTime.now();
    return (select(holidays)..where((tbl) => tbl.date.isBiggerThanValue(now))..orderBy([(tbl) => OrderingTerm.asc(tbl.date)])).get();
  }
  Future<Holiday?> getHolidayById(String id) => (select(holidays)..where((tbl) => tbl.id.equals(id))).getSingleOrNull();
  Future<int> insertHoliday(Holiday holiday) => into(holidays).insert(holiday, mode: InsertMode.insertOrReplace);
  Future<bool> updateHoliday(Holiday holiday) => update(holidays).replace(holiday);
  Future<int> deleteHoliday(Holiday holiday) => delete(holidays).delete(holiday);

  // Mood queries
  Future<List<Mood>> getAllMoods() => select(moods).get();
  Future<List<Mood>> getMoodsByMonth(int year, int month) {
    final start = DateTime(year, month, 1);
    final end = DateTime(year, month + 1, 0, 23, 59, 59);
    return (select(moods)..where((tbl) => tbl.date.isBetweenValues(start, end))).get();
  }
  Future<Mood?> getMoodByDate(DateTime date) {
    final start = DateTime(date.year, date.month, date.day);
    final end = DateTime(date.year, date.month, date.day, 23, 59, 59);
    return (select(moods)..where((tbl) => tbl.date.isBetweenValues(start, end))).getSingleOrNull();
  }
  Future<Mood?> getMoodById(String id) => (select(moods)..where((tbl) => tbl.id.equals(id))).getSingleOrNull();
  Future<int> insertMood(Mood mood) => into(moods).insert(mood, mode: InsertMode.insertOrReplace);
  Future<bool> updateMood(Mood mood) => update(moods).replace(mood);
  Future<int> deleteMood(Mood mood) => delete(moods).delete(mood);

  // Settings queries
  Future<UserSetting?> getSettings() => select(userSettings).getSingleOrNull();
  Future<int> insertSettings(UserSetting settings) => into(userSettings).insert(settings, mode: InsertMode.insertOrReplace);
  Future<bool> updateSettings(UserSetting settings) => update(userSettings).replace(settings);
}
