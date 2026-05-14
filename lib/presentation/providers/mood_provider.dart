import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';
import 'package:vietlife_note/data/datasources/mood_local_datasource.dart';
import 'package:vietlife_note/presentation/providers/holiday_provider.dart';
import 'package:vietlife_note/data/repositories/mood_repository_impl.dart';
import 'package:vietlife_note/domain/entities/mood.dart';
import 'package:vietlife_note/domain/repositories/mood_repository.dart';
import 'package:vietlife_note/domain/usecases/mood_usecases.dart';

// Mood Local Data Source Provider
final moodLocalDataSourceProvider = Provider<MoodLocalDataSource>((ref) {
  final database = ref.watch(databaseProvider);
  return MoodLocalDataSourceImpl(database: database);
});

// Mood Repository Provider
final moodRepositoryProvider = Provider<MoodRepository>((ref) {
  final localDataSource = ref.watch(moodLocalDataSourceProvider);
  return MoodRepositoryImpl(localDataSource: localDataSource);
});

// Use Cases Providers
final getAllMoodsProvider = Provider<GetAllMoods>((ref) {
  final repository = ref.watch(moodRepositoryProvider);
  return GetAllMoods(repository);
});

final getMoodsByMonthProvider = Provider<GetMoodsByMonth>((ref) {
  final repository = ref.watch(moodRepositoryProvider);
  return GetMoodsByMonth(repository);
});

final getMoodByDateProvider = Provider<GetMoodByDate>((ref) {
  final repository = ref.watch(moodRepositoryProvider);
  return GetMoodByDate(repository);
});

final addMoodProvider = Provider<AddMood>((ref) {
  final repository = ref.watch(moodRepositoryProvider);
  return AddMood(repository);
});

final updateMoodProvider = Provider<UpdateMood>((ref) {
  final repository = ref.watch(moodRepositoryProvider);
  return UpdateMood(repository);
});

final getMoodStatsProvider = Provider<GetMoodStats>((ref) {
  final repository = ref.watch(moodRepositoryProvider);
  return GetMoodStats(repository);
});

// Mood State
enum MoodStatus { initial, loading, loaded, error }

class MoodState {
  final MoodStatus status;
  final List<Mood> moods;
  final Mood? todayMood;
  final Map<String, int> moodStats;
  final String? errorMessage;

  MoodState({
    this.status = MoodStatus.initial,
    this.moods = const [],
    this.todayMood,
    this.moodStats = const {},
    this.errorMessage,
  });

  MoodState copyWith({
    MoodStatus? status,
    List<Mood>? moods,
    Mood? todayMood,
    Map<String, int>? moodStats,
    String? errorMessage,
  }) {
    return MoodState(
      status: status ?? this.status,
      moods: moods ?? this.moods,
      todayMood: todayMood ?? this.todayMood,
      moodStats: moodStats ?? this.moodStats,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}

// Mood Notifier
class MoodNotifier extends StateNotifier<MoodState> {
  final GetAllMoods _getAllMoods;
  final GetMoodsByMonth _getMoodsByMonth;
  final GetMoodByDate _getMoodByDate;
  final AddMood _addMood;
  final UpdateMood _updateMood;
  final GetMoodStats _getMoodStats;
  final SyncService _syncService = SyncService();

  MoodNotifier(
    this._getAllMoods,
    this._getMoodsByMonth,
    this._getMoodByDate,
    this._addMood,
    this._updateMood,
    this._getMoodStats,
  ) : super(MoodState()) {
    loadTodayMood();
  }

  Future<void> loadTodayMood() async {
    state = state.copyWith(status: MoodStatus.loading);
    
    final today = DateTime.now();
    final result = await _getMoodByDate(today);
    
    result.fold(
      (failure) => state = state.copyWith(
        status: MoodStatus.error,
        errorMessage: failure.message,
      ),
      (mood) {
        state = state.copyWith(
          status: MoodStatus.loaded,
          todayMood: mood,
        );
        _loadMoodStats();
      },
    );
  }

  Future<void> loadMoodsByMonth(int year, int month) async {
    state = state.copyWith(status: MoodStatus.loading);
    
    final result = await _getMoodsByMonth(year, month);
    
    result.fold(
      (failure) => state = state.copyWith(
        status: MoodStatus.error,
        errorMessage: failure.message,
      ),
      (moods) => state = state.copyWith(
        status: MoodStatus.loaded,
        moods: moods,
      ),
    );
  }

  void _autoBackupMood(Mood mood) {
    if (_syncService.isLoggedIn) {
      _syncService.uploadSingleMood(mood).catchError((e) {
        print('[AutoBackup] Mood Failed: $e');
      });
    }
  }

  Future<void> addMood({
    required String moodType,
    String? note,
    List<String> tags = const [],
  }) async {
    final now = DateTime.now();
    final mood = Mood(
      id: const Uuid().v4(),
      moodType: moodType,
      date: now,
      note: note,
      tags: tags,
      createdAt: now,
    );

    final result = await _addMood(mood);
    result.fold(
      (failure) => state = state.copyWith(
        status: MoodStatus.error,
        errorMessage: failure.message,
      ),
      (_) {
        _autoBackupMood(mood);
        loadTodayMood();
      },
    );
  }

  Future<void> updateMood(Mood mood) async {
    final result = await _updateMood(mood);
    result.fold(
      (failure) => state = state.copyWith(
        status: MoodStatus.error,
        errorMessage: failure.message,
      ),
      (_) {
        _autoBackupMood(mood);
        loadTodayMood();
      },
    );
  }

  Future<void> _loadMoodStats() async {
    final now = DateTime.now();
    final result = await _getMoodStats(now.year, now.month);
    
    result.fold(
      (failure) => null,
      (stats) => state = state.copyWith(moodStats: stats),
    );
  }

  Future<void> refresh() async {
    await loadTodayMood();
  }
}

// Mood Provider
final moodProvider = StateNotifierProvider<MoodNotifier, MoodState>(
  (ref) {
    return MoodNotifier(
      ref.watch(getAllMoodsProvider),
      ref.watch(getMoodsByMonthProvider),
      ref.watch(getMoodByDateProvider),
      ref.watch(addMoodProvider),
      ref.watch(updateMoodProvider),
      ref.watch(getMoodStatsProvider),
    );
  },
);
