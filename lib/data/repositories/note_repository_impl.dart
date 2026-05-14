import 'package:vietlife_note/core/errors/exceptions.dart';
import 'package:vietlife_note/core/errors/failures.dart';
import 'package:vietlife_note/core/utils/string_utils.dart';
import 'package:vietlife_note/data/datasources/note_local_datasource.dart';
import 'package:vietlife_note/domain/entities/note.dart';
import 'package:vietlife_note/domain/repositories/note_repository.dart';
import 'package:dartz/dartz.dart';

class NoteRepositoryImpl implements NoteRepository {
  final NoteLocalDataSource localDataSource;

  NoteRepositoryImpl({required this.localDataSource});

  @override
  Future<Either<Failure, List<Note>>> getAllNotes() async {
    try {
      final notes = await localDataSource.getAllNotes();
      final activeNotes = notes.where((note) => !note.isArchived).toList();
      return Right(activeNotes);
    } on CacheException catch (e) {
      return Left(CacheFailure(e.message));
    } catch (e) {
      return Left(UnknownFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<Note>>> getPinnedNotes() async {
    try {
      final notes = await localDataSource.getPinnedNotes();
      return Right(notes);
    } on CacheException catch (e) {
      return Left(CacheFailure(e.message));
    } catch (e) {
      return Left(UnknownFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<Note>>> getArchivedNotes() async {
    try {
      final notes = await localDataSource.getArchivedNotes();
      return Right(notes);
    } on CacheException catch (e) {
      return Left(CacheFailure(e.message));
    } catch (e) {
      return Left(UnknownFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<Note>>> getNotesByDate(DateTime date) async {
    try {
      final notes = await localDataSource.getNotesByDate(date);
      return Right(notes);
    } on CacheException catch (e) {
      return Left(CacheFailure(e.message));
    } catch (e) {
      return Left(UnknownFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, Note>> getNoteById(String id) async {
    try {
      final note = await localDataSource.getNoteById(id);
      if (note == null) {
        return Left(CacheFailure('Note not found'));
      }
      return Right(note);
    } on CacheException catch (e) {
      return Left(CacheFailure(e.message));
    } catch (e) {
      return Left(UnknownFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> addNote(Note note) async {
    try {
      await localDataSource.insertNote(note);
      return Right(null);
    } on CacheException catch (e) {
      return Left(CacheFailure(e.message));
    } catch (e) {
      return Left(UnknownFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> updateNote(Note note) async {
    try {
      await localDataSource.updateNote(note);
      return Right(null);
    } on CacheException catch (e) {
      return Left(CacheFailure(e.message));
    } catch (e) {
      return Left(UnknownFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> deleteNote(String id) async {
    try {
      await localDataSource.deleteNote(id);
      return Right(null);
    } on CacheException catch (e) {
      return Left(CacheFailure(e.message));
    } catch (e) {
      return Left(UnknownFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> pinNote(String id) async {
    try {
      await localDataSource.pinNote(id);
      return Right(null);
    } on CacheException catch (e) {
      return Left(CacheFailure(e.message));
    } catch (e) {
      return Left(UnknownFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> unpinNote(String id) async {
    try {
      await localDataSource.unpinNote(id);
      return Right(null);
    } on CacheException catch (e) {
      return Left(CacheFailure(e.message));
    } catch (e) {
      return Left(UnknownFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> archiveNote(String id) async {
    try {
      await localDataSource.archiveNote(id);
      return Right(null);
    } on CacheException catch (e) {
      return Left(CacheFailure(e.message));
    } catch (e) {
      return Left(UnknownFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> unarchiveNote(String id) async {
    try {
      await localDataSource.unarchiveNote(id);
      return Right(null);
    } on CacheException catch (e) {
      return Left(CacheFailure(e.message));
    } catch (e) {
      return Left(UnknownFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<Note>>> searchNotes(String query) async {
    try {
      final notes = await localDataSource.getAllNotes();
      final normalizedQuery = StringUtils.normalizeForSearch(query);
      
      final filteredNotes = notes.where((note) {
        final normalizedTitle = StringUtils.normalizeForSearch(note.title);
        final normalizedContent = StringUtils.normalizeForSearch(note.content);
        final normalizedTags = note.tags.map((t) => StringUtils.normalizeForSearch(t)).join(' ');
        
        return normalizedTitle.contains(normalizedQuery) ||
               normalizedContent.contains(normalizedQuery) ||
               normalizedTags.contains(normalizedQuery);
      }).toList();
      
      return Right(filteredNotes);
    } on CacheException catch (e) {
      return Left(CacheFailure(e.message));
    } catch (e) {
      return Left(UnknownFailure(e.toString()));
    }
  }
}
