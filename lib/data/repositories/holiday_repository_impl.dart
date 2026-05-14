import 'package:vietlife_note/core/errors/exceptions.dart';
import 'package:vietlife_note/core/errors/failures.dart';
import 'package:vietlife_note/data/datasources/holiday_local_datasource.dart';
import 'package:vietlife_note/data/datasources/vietnamese_holidays_data.dart';
import 'package:vietlife_note/domain/entities/holiday.dart';
import 'package:vietlife_note/domain/repositories/holiday_repository.dart';
import 'package:dartz/dartz.dart';

class HolidayRepositoryImpl implements HolidayRepository {
  final HolidayLocalDataSource localDataSource;

  HolidayRepositoryImpl({required this.localDataSource});

  @override
  Future<Either<Failure, List<Holiday>>> getAllHolidays() async {
    try {
      final holidays = await localDataSource.getAllHolidays();
      return Right(holidays);
    } on CacheException catch (e) {
      return Left(CacheFailure(e.message));
    } catch (e) {
      return Left(UnknownFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<Holiday>>> getHolidaysByYear(int year) async {
    try {
      final holidays = await localDataSource.getHolidaysByYear(year);
      return Right(holidays);
    } on CacheException catch (e) {
      return Left(CacheFailure(e.message));
    } catch (e) {
      return Left(UnknownFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<Holiday>>> getUpcomingHolidays() async {
    try {
      final holidays = await localDataSource.getUpcomingHolidays();
      return Right(holidays);
    } on CacheException catch (e) {
      return Left(CacheFailure(e.message));
    } catch (e) {
      return Left(UnknownFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, Holiday>> getHolidayById(String id) async {
    try {
      final holiday = await localDataSource.getHolidayById(id);
      if (holiday == null) {
        return Left(CacheFailure('Holiday not found'));
      }
      return Right(holiday);
    } on CacheException catch (e) {
      return Left(CacheFailure(e.message));
    } catch (e) {
      return Left(UnknownFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> initializeHolidays() async {
    try {
      final currentYear = DateTime.now().year;
      final holidays = VietnameseHolidaysData.getHolidaysForYear(currentYear);
      await localDataSource.insertHolidays(holidays);
      return Right(null);
    } on CacheException catch (e) {
      return Left(CacheFailure(e.message));
    } catch (e) {
      return Left(UnknownFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> addHoliday(Holiday holiday) async {
    try {
      await localDataSource.insertHoliday(holiday);
      return Right(null);
    } on CacheException catch (e) {
      return Left(CacheFailure(e.message));
    } catch (e) {
      return Left(UnknownFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> updateHoliday(Holiday holiday) async {
    try {
      await localDataSource.updateHoliday(holiday);
      return Right(null);
    } on CacheException catch (e) {
      return Left(CacheFailure(e.message));
    } catch (e) {
      return Left(UnknownFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> deleteHoliday(String id) async {
    try {
      await localDataSource.deleteHoliday(id);
      return Right(null);
    } on CacheException catch (e) {
      return Left(CacheFailure(e.message));
    } catch (e) {
      return Left(UnknownFailure(e.toString()));
    }
  }
}
