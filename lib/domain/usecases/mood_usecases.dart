import 'package:dartz/dartz.dart';
import 'package:vietlife_note/core/errors/failures.dart';
import 'package:vietlife_note/domain/entities/mood.dart';
import 'package:vietlife_note/domain/repositories/mood_repository.dart';

class GetAllMoods {
  final MoodRepository repository;

  GetAllMoods(this.repository);

  Future<Either<Failure, List<Mood>>> call() {
    return repository.getAllMoods();
  }
}

class GetMoodsByMonth {
  final MoodRepository repository;

  GetMoodsByMonth(this.repository);

  Future<Either<Failure, List<Mood>>> call(int year, int month) {
    return repository.getMoodsByMonth(year, month);
  }
}

class GetMoodByDate {
  final MoodRepository repository;

  GetMoodByDate(this.repository);

  Future<Either<Failure, Mood?>> call(DateTime date) {
    return repository.getMoodByDate(date);
  }
}

class AddMood {
  final MoodRepository repository;

  AddMood(this.repository);

  Future<Either<Failure, void>> call(Mood mood) {
    return repository.addMood(mood);
  }
}

class UpdateMood {
  final MoodRepository repository;

  UpdateMood(this.repository);

  Future<Either<Failure, void>> call(Mood mood) {
    return repository.updateMood(mood);
  }
}

class GetMoodStats {
  final MoodRepository repository;

  GetMoodStats(this.repository);

  Future<Either<Failure, Map<String, int>>> call(int year, int month) {
    return repository.getMoodStats(year, month);
  }
}
