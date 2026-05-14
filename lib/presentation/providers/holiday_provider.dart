import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vietlife_note/data/datasources/holiday_local_datasource.dart';
import 'package:vietlife_note/data/datasources/vietnamese_holidays_data.dart';
import 'package:vietlife_note/data/database/app_database.dart' as db;
import 'package:vietlife_note/data/repositories/holiday_repository_impl.dart';
import 'package:vietlife_note/domain/entities/holiday.dart';
import 'package:vietlife_note/domain/repositories/holiday_repository.dart';
import 'package:vietlife_note/domain/usecases/get_upcoming_holidays.dart';
import 'package:vietlife_note/domain/usecases/initialize_holidays.dart';

// Database Provider
final databaseProvider = Provider<db.AppDatabase>((ref) {
  return db.AppDatabase.create();
});

// Holiday Local Data Source Provider
final holidayLocalDataSourceProvider = Provider<HolidayLocalDataSource>((ref) {
  final database = ref.watch(databaseProvider);
  return HolidayLocalDataSourceImpl(database: database);
});

// Holiday Repository Provider
final holidayRepositoryProvider = Provider<HolidayRepository>((ref) {
  final localDataSource = ref.watch(holidayLocalDataSourceProvider);
  return HolidayRepositoryImpl(localDataSource: localDataSource);
});

// Use Cases Providers
final initializeHolidaysProvider = Provider<InitializeHolidays>((ref) {
  final repository = ref.watch(holidayRepositoryProvider);
  return InitializeHolidays(repository);
});

final getUpcomingHolidaysProvider = Provider<GetUpcomingHolidays>((ref) {
  final repository = ref.watch(holidayRepositoryProvider);
  return GetUpcomingHolidays(repository);
});

// Holiday State
enum HolidayStatus { initial, loading, loaded, error }

class HolidayState {
  final HolidayStatus status;
  final List<Holiday> holidays;
  final String? errorMessage;

  HolidayState({
    this.status = HolidayStatus.initial,
    this.holidays = const [],
    this.errorMessage,
  });

  HolidayState copyWith({
    HolidayStatus? status,
    List<Holiday>? holidays,
    String? errorMessage,
  }) {
    return HolidayState(
      status: status ?? this.status,
      holidays: holidays ?? this.holidays,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}

// Holiday Notifier
class HolidayNotifier extends StateNotifier<HolidayState> {
  final InitializeHolidays _initializeHolidays;
  final GetUpcomingHolidays _getUpcomingHolidays;

  HolidayNotifier(this._initializeHolidays, this._getUpcomingHolidays)
      : super(HolidayState()) {
    initialize();
  }

  Future<void> initialize() async {
    state = state.copyWith(status: HolidayStatus.loading);
    
    // First, initialize holidays in database
    final result = await _initializeHolidays();
    result.fold(
      (failure) => state = state.copyWith(
        status: HolidayStatus.error,
        errorMessage: failure.message,
      ),
      (_) async {
        // Then load upcoming holidays
        await loadUpcomingHolidays();
      },
    );
  }

  Future<void> loadUpcomingHolidays() async {
    state = state.copyWith(status: HolidayStatus.loading);
    
    final result = await _getUpcomingHolidays();
    result.fold(
      (failure) => state = state.copyWith(
        status: HolidayStatus.error,
        errorMessage: failure.message,
      ),
      (holidays) => state = state.copyWith(
        status: HolidayStatus.loaded,
        holidays: holidays,
      ),
    );
  }

  Future<void> refresh() async {
    await loadUpcomingHolidays();
  }
}

// Holiday Provider
final holidayProvider = StateNotifierProvider<HolidayNotifier, HolidayState>(
  (ref) {
    final initializeHolidays = ref.watch(initializeHolidaysProvider);
    final getUpcomingHolidays = ref.watch(getUpcomingHolidaysProvider);
    return HolidayNotifier(initializeHolidays, getUpcomingHolidays);
  },
);
