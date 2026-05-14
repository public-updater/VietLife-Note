import 'package:dartz/dartz.dart';
import 'package:vietlife_note/core/errors/failures.dart';
import 'package:vietlife_note/domain/entities/note.dart';
import 'package:vietlife_note/domain/repositories/note_repository.dart';

class GetAllNotes {
  final NoteRepository repository;

  GetAllNotes(this.repository);

  Future<Either<Failure, List<Note>>> call() {
    return repository.getAllNotes();
  }
}

class GetPinnedNotes {
  final NoteRepository repository;

  GetPinnedNotes(this.repository);

  Future<Either<Failure, List<Note>>> call() {
    return repository.getPinnedNotes();
  }
}

class AddNote {
  final NoteRepository repository;

  AddNote(this.repository);

  Future<Either<Failure, void>> call(Note note) {
    return repository.addNote(note);
  }
}

class UpdateNote {
  final NoteRepository repository;

  UpdateNote(this.repository);

  Future<Either<Failure, void>> call(Note note) {
    return repository.updateNote(note);
  }
}

class DeleteNote {
  final NoteRepository repository;

  DeleteNote(this.repository);

  Future<Either<Failure, void>> call(String id) {
    return repository.deleteNote(id);
  }
}

class PinNote {
  final NoteRepository repository;

  PinNote(this.repository);

  Future<Either<Failure, void>> call(String id) {
    return repository.pinNote(id);
  }
}

class UnpinNote {
  final NoteRepository repository;

  UnpinNote(this.repository);

  Future<Either<Failure, void>> call(String id) {
    return repository.unpinNote(id);
  }
}

class ArchiveNote {
  final NoteRepository repository;

  ArchiveNote(this.repository);

  Future<Either<Failure, void>> call(String id) {
    return repository.archiveNote(id);
  }
}

class SearchNotes {
  final NoteRepository repository;

  SearchNotes(this.repository);

  Future<Either<Failure, List<Note>>> call(String query) {
    return repository.searchNotes(query);
  }
}
