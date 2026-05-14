import 'package:dartz/dartz.dart';
import 'package:vietlife_note/core/errors/failures.dart';
import 'package:vietlife_note/domain/repositories/holiday_repository.dart';

class InitializeHolidays {
  final HolidayRepository repository;

  InitializeHolidays(this.repository);

  Future<Either<Failure, void>> call() {
    return repository.initializeHolidays();
  }
}
