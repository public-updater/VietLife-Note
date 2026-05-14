import 'package:dartz/dartz.dart';
import 'package:vietlife_note/core/errors/failures.dart';
import 'package:vietlife_note/domain/entities/mood.dart';

abstract class MoodRepository {
  Future<Either<Failure, List<Mood>>> getAllMoods();
  Future<Either<Failure, List<Mood>>> getMoodsByMonth(int year, int month);
  Future<Either<Failure, Mood?>> getMoodByDate(DateTime date);
  Future<Either<Failure, void>> addMood(Mood mood);
  Future<Either<Failure, void>> updateMood(Mood mood);
  Future<Either<Failure, void>> deleteMood(String id);
  Future<Either<Failure, Map<String, int>>> getMoodStats(int year, int month);
}
