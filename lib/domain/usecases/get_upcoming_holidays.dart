import 'package:dartz/dartz.dart';
import 'package:vietlife_note/core/errors/failures.dart';
import 'package:vietlife_note/domain/entities/holiday.dart';
import 'package:vietlife_note/domain/repositories/holiday_repository.dart';

class GetUpcomingHolidays {
  final HolidayRepository repository;

  GetUpcomingHolidays(this.repository);

  Future<Either<Failure, List<Holiday>>> call() {
    return repository.getUpcomingHolidays();
  }
}
