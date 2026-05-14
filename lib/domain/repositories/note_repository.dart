import 'package:dartz/dartz.dart';
import 'package:vietlife_note/core/errors/failures.dart';
import 'package:vietlife_note/domain/entities/note.dart';

abstract class NoteRepository {
  Future<Either<Failure, List<Note>>> getAllNotes();
  Future<Either<Failure, List<Note>>> getPinnedNotes();
  Future<Either<Failure, List<Note>>> getArchivedNotes();
  Future<Either<Failure, List<Note>>> getNotesByDate(DateTime date);
  Future<Either<Failure, Note>> getNoteById(String id);
  Future<Either<Failure, void>> addNote(Note note);
  Future<Either<Failure, void>> updateNote(Note note);
  Future<Either<Failure, void>> deleteNote(String id);
  Future<Either<Failure, void>> pinNote(String id);
  Future<Either<Failure, void>> unpinNote(String id);
  Future<Either<Failure, void>> archiveNote(String id);
  Future<Either<Failure, void>> unarchiveNote(String id);
  Future<Either<Failure, List<Note>>> searchNotes(String query);
}
