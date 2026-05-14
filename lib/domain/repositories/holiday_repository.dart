import 'package:dartz/dartz.dart';
import 'package:vietlife_note/core/errors/failures.dart';
import 'package:vietlife_note/domain/entities/holiday.dart';

abstract class HolidayRepository {
  Future<Either<Failure, List<Holiday>>> getAllHolidays();
  Future<Either<Failure, List<Holiday>>> getHolidaysByYear(int year);
  Future<Either<Failure, List<Holiday>>> getUpcomingHolidays();
  Future<Either<Failure, Holiday>> getHolidayById(String id);
  Future<Either<Failure, void>> initializeHolidays();
  Future<Either<Failure, void>> addHoliday(Holiday holiday);
  Future<Either<Failure, void>> updateHoliday(Holiday holiday);
  Future<Either<Failure, void>> deleteHoliday(String id);
}
