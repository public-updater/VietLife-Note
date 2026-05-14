import 'package:vietlife_note/core/errors/exceptions.dart';
import 'package:vietlife_note/core/errors/failures.dart';
import 'package:vietlife_note/data/datasources/mood_local_datasource.dart';
import 'package:vietlife_note/domain/entities/mood.dart';
import 'package:vietlife_note/domain/repositories/mood_repository.dart';
import 'package:dartz/dartz.dart';

class MoodRepositoryImpl implements MoodRepository {
  final MoodLocalDataSource localDataSource;

  MoodRepositoryImpl({required this.localDataSource});

  @override
  Future<Either<Failure, List<Mood>>> getAllMoods() async {
    try {
      final moods = await localDataSource.getAllMoods();
      return Right(moods);
    } on CacheException catch (e) {
      return Left(CacheFailure(e.message));
    } catch (e) {
      return Left(UnknownFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<Mood>>> getMoodsByMonth(int year, int month) async {
    try {
      final moods = await localDataSource.getMoodsByMonth(year, month);
      return Right(moods);
    } on CacheException catch (e) {
      return Left(CacheFailure(e.message));
    } catch (e) {
      return Left(UnknownFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, Mood?>> getMoodByDate(DateTime date) async {
    try {
      final mood = await localDataSource.getMoodByDate(date);
      return Right(mood);
    } on CacheException catch (e) {
      return Left(CacheFailure(e.message));
    } catch (e) {
      return Left(UnknownFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> addMood(Mood mood) async {
    try {
      await localDataSource.insertMood(mood);
      return Right(null);
    } on CacheException catch (e) {
      return Left(CacheFailure(e.message));
    } catch (e) {
      return Left(UnknownFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> updateMood(Mood mood) async {
    try {
      await localDataSource.updateMood(mood);
      return Right(null);
    } on CacheException catch (e) {
      return Left(CacheFailure(e.message));
    } catch (e) {
      return Left(UnknownFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> deleteMood(String id) async {
    try {
      await localDataSource.deleteMood(id);
      return Right(null);
    } on CacheException catch (e) {
      return Left(CacheFailure(e.message));
    } catch (e) {
      return Left(UnknownFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, Map<String, int>>> getMoodStats(int year, int month) async {
    try {
      final moods = await localDataSource.getMoodsByMonth(year, month);
      final stats = <String, int>{};
      
      for (final mood in moods) {
        stats[mood.moodType] = (stats[mood.moodType] ?? 0) + 1;
      }
      
      return Right(stats);
    } on CacheException catch (e) {
      return Left(CacheFailure(e.message));
    } catch (e) {
      return Left(UnknownFailure(e.toString()));
    }
  }
}
