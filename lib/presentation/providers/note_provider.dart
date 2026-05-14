import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';
import 'package:vietlife_note/data/datasources/note_local_datasource.dart';
import 'package:vietlife_note/data/datasources/mood_local_datasource.dart';
import 'package:vietlife_note/presentation/providers/holiday_provider.dart';
import 'package:vietlife_note/presentation/providers/mood_provider.dart';
import 'package:vietlife_note/data/repositories/note_repository_impl.dart';
import 'package:vietlife_note/domain/entities/note.dart';
import 'package:vietlife_note/domain/repositories/note_repository.dart';
import 'package:vietlife_note/domain/usecases/note_usecases.dart';
import 'package:vietlife_note/services/sync/sync_service.dart';

// Note Local Data Source Provider
final noteLocalDataSourceProvider = Provider<NoteLocalDataSource>((ref) {
  final database = ref.watch(databaseProvider);
  return NoteLocalDataSourceImpl(database: database);
});

// Note Repository Provider
final noteRepositoryProvider = Provider<NoteRepository>((ref) {
  final localDataSource = ref.watch(noteLocalDataSourceProvider);
  return NoteRepositoryImpl(localDataSource: localDataSource);
});

// Use Cases Providers
final getAllNotesProvider = Provider<GetAllNotes>((ref) {
  final repository = ref.watch(noteRepositoryProvider);
  return GetAllNotes(repository);
});

final getPinnedNotesProvider = Provider<GetPinnedNotes>((ref) {
  final repository = ref.watch(noteRepositoryProvider);
  return GetPinnedNotes(repository);
});

final addNoteProvider = Provider<AddNote>((ref) {
  final repository = ref.watch(noteRepositoryProvider);
  return AddNote(repository);
});

final updateNoteProvider = Provider<UpdateNote>((ref) {
  final repository = ref.watch(noteRepositoryProvider);
  return UpdateNote(repository);
});

final deleteNoteProvider = Provider<DeleteNote>((ref) {
  final repository = ref.watch(noteRepositoryProvider);
  return DeleteNote(repository);
});

final pinNoteProvider = Provider<PinNote>((ref) {
  final repository = ref.watch(noteRepositoryProvider);
  return PinNote(repository);
});

final unpinNoteProvider = Provider<UnpinNote>((ref) {
  final repository = ref.watch(noteRepositoryProvider);
  return UnpinNote(repository);
});

final archiveNoteProvider = Provider<ArchiveNote>((ref) {
  final repository = ref.watch(noteRepositoryProvider);
  return ArchiveNote(repository);
});

final searchNotesProvider = Provider<SearchNotes>((ref) {
  final repository = ref.watch(noteRepositoryProvider);
  return SearchNotes(repository);
});

// Note State
enum NoteStatus { initial, loading, loaded, error }

class SyncResult {
  final bool success;
  final String? message;
  final int notesBackedUp;
  final int moodsBackedUp;
  final int settingsBackedUp;

  const SyncResult({
    this.success = false,
    this.message,
    this.notesBackedUp = 0,
    this.moodsBackedUp = 0,
    this.settingsBackedUp = 0,
  });

  factory SyncResult.backupSuccess(int notesCount, int moodsCount, int settingsCount) => 
      SyncResult(
        success: true, 
        message: 'Sao lưu thành công: $notesCount ghi chú, $moodsCount tâm trạng', 
        notesBackedUp: notesCount, 
        moodsBackedUp: moodsCount,
        settingsBackedUp: settingsCount,
      );
  
  factory SyncResult.restoreSuccess(int notesCount, int moodsCount) => 
      SyncResult(success: true, message: 'Khôi phục thành công: $notesCount ghi chú, $moodsCount tâm trạng');
  
  factory SyncResult.failure(String msg) => SyncResult(success: false, message: msg);
  factory SyncResult.notLoggedIn() => SyncResult(success: false, message: 'Chưa đăng nhập');
}

class NoteState {
  final NoteStatus status;
  final List<Note> notes;
  final List<Note> pinnedNotes;
  final List<Note> searchResults;
  final String? errorMessage;
  final SyncResult? lastSyncResult;
  final DateTime? lastSyncTime;

  NoteState({
    this.status = NoteStatus.initial,
    this.notes = const [],
    this.pinnedNotes = const [],
    this.searchResults = const [],
    this.errorMessage,
    this.lastSyncResult,
    this.lastSyncTime,
  });

  NoteState copyWith({
    NoteStatus? status,
    List<Note>? notes,
    List<Note>? pinnedNotes,
    List<Note>? searchResults,
    String? errorMessage,
    SyncResult? lastSyncResult,
    DateTime? lastSyncTime,
  }) {
    return NoteState(
      status: status ?? this.status,
      notes: notes ?? this.notes,
      pinnedNotes: pinnedNotes ?? this.pinnedNotes,
      searchResults: searchResults ?? this.searchResults,
      errorMessage: errorMessage ?? this.errorMessage,
      lastSyncResult: lastSyncResult ?? this.lastSyncResult,
      lastSyncTime: lastSyncTime ?? this.lastSyncTime,
    );
  }
}

// Note Notifier
class NoteNotifier extends StateNotifier<NoteState> {
  final GetAllNotes _getAllNotes;
  final GetPinnedNotes _getPinnedNotes;
  final AddNote _addNote;
  final UpdateNote _updateNote;
  final DeleteNote _deleteNote;
  final PinNote _pinNote;
  final UnpinNote _unpinNote;
  final ArchiveNote _archiveNote;
  final SearchNotes _searchNotes;
  final NoteLocalDataSource _localDataSource;
  final MoodLocalDataSource _moodDataSource;
  final SyncService _syncService = SyncService();
  final Ref _ref;

  NoteNotifier(
    this._getAllNotes,
    this._getPinnedNotes,
    this._addNote,
    this._updateNote,
    this._deleteNote,
    this._pinNote,
    this._unpinNote,
    this._archiveNote,
    this._searchNotes,
    this._localDataSource,
    this._moodDataSource,
    this._ref,
  ) : super(NoteState()) {
    _initialize();
  }

  Future<void> _initialize() async {
    await loadNotes();
  }

  Future<void> loadNotes() async {
    if (state.notes.isEmpty) {
      state = state.copyWith(status: NoteStatus.loading);
    }
    
    final notesResult = await _getAllNotes();
    final pinnedResult = await _getPinnedNotes();
    
    notesResult.fold(
      (failure) => state = state.copyWith(
        status: NoteStatus.error,
        errorMessage: failure.message,
      ),
      (notes) {
        pinnedResult.fold(
          (failure) => state = state.copyWith(
            status: NoteStatus.loaded,
            notes: notes,
          ),
          (pinnedNotes) => state = state.copyWith(
            status: NoteStatus.loaded,
            notes: notes,
            pinnedNotes: pinnedNotes,
          ),
        );
      },
    );
  }

  void _autoBackupNote(Note note) {
    if (_syncService.isLoggedIn) {
      _syncService.uploadSingleNote(note).catchError((e) {
        debugPrint('[AutoBackup] Note Failed: $e');
      });
    }
  }

  void _autoDeleteNoteFromCloud(String id) {
    if (_syncService.isLoggedIn) {
      _syncService.deleteNoteFromCloud(id).catchError((e) {
        debugPrint('[AutoBackup] Delete Failed: $e');
      });
    }
  }

  Future<void> addNote({
    required String title,
    required String content,
    DateTime? date,
    String? mood,
    List<String> tags = const [],
  }) async {
    final now = DateTime.now();
    final note = Note(
      id: const Uuid().v4(),
      title: title,
      content: content,
      date: date ?? now,
      mood: mood,
      tags: tags,
      createdAt: now,
      updatedAt: now,
    );

    final result = await _addNote(note);
    result.fold(
      (failure) => state = state.copyWith(
        status: NoteStatus.error,
        errorMessage: failure.message,
      ),
      (_) {
        _autoBackupNote(note);
        loadNotes();
      },
    );
  }

  Future<void> updateNote(Note note) async {
    final updatedNote = note.copyWith(updatedAt: DateTime.now());
    final result = await _updateNote(updatedNote);
    result.fold(
      (failure) => state = state.copyWith(
        status: NoteStatus.error,
        errorMessage: failure.message,
      ),
      (_) {
        _autoBackupNote(updatedNote);
        loadNotes();
      },
    );
  }

  Future<void> deleteNote(String id) async {
    _autoDeleteNoteFromCloud(id);
    final result = await _deleteNote(id);
    result.fold(
      (failure) => state = state.copyWith(
        status: NoteStatus.error,
        errorMessage: failure.message,
      ),
      (_) => loadNotes(),
    );
  }

  Future<void> pinNote(String id) async {
    final result = await _pinNote(id);
    result.fold(
      (failure) => state = state.copyWith(
        status: NoteStatus.error,
        errorMessage: failure.message,
      ),
      (_) async {
        await loadNotes();
        final updated = await _localDataSource.getNoteById(id);
        if (updated != null) _autoBackupNote(updated);
      },
    );
  }

  Future<void> unpinNote(String id) async {
    final result = await _unpinNote(id);
    result.fold(
      (failure) => state = state.copyWith(
        status: NoteStatus.error,
        errorMessage: failure.message,
      ),
      (_) async {
        await loadNotes();
        final updated = await _localDataSource.getNoteById(id);
        if (updated != null) _autoBackupNote(updated);
      },
    );
  }

  Future<void> archiveNote(String id) async {
    final result = await _archiveNote(id);
    result.fold(
      (failure) => state = state.copyWith(
        status: NoteStatus.error,
        errorMessage: failure.message,
      ),
      (_) async {
        await loadNotes();
        final updated = await _localDataSource.getNoteById(id);
        if (updated != null) _autoBackupNote(updated);
      },
    );
  }

  Future<void> searchNotes(String query) async {
    if (query.isEmpty) {
      state = state.copyWith(searchResults: []);
      return;
    }

    state = state.copyWith(status: NoteStatus.loading);
    
    final result = await _searchNotes(query);
    result.fold(
      (failure) => state = state.copyWith(
        status: NoteStatus.error,
        errorMessage: failure.message,
      ),
      (results) => state = state.copyWith(
        status: NoteStatus.loaded,
        searchResults: results,
      ),
    );
  }

  Future<void> refresh() async {
    await loadNotes();
  }

  Future<void> performBackup() async {
    if (!_syncService.isLoggedIn) {
      state = state.copyWith(lastSyncResult: SyncResult.notLoggedIn(), lastSyncTime: DateTime.now());
      return;
    }

    try {
      debugPrint('[Backup] Starting comprehensive backup...');
      
      final notes = await _localDataSource.getAllNotes();
      final moods = await _moodDataSource.getAllMoods();

      bool notesOk = false;
      bool moodsOk = false;
      bool settingsOk = false;

      await Future.wait([
        _syncService.uploadNotes(notes).then((v) => notesOk = v),
        _syncService.uploadMoods(moods).then((v) => moodsOk = v),
        _syncService.uploadSettings().then((v) => settingsOk = v),
      ]).timeout(const Duration(minutes: 2));

      state = state.copyWith(
        lastSyncResult: notesOk && moodsOk
            ? SyncResult.backupSuccess(notes.length, moods.length, settingsOk ? 1 : 0)
            : SyncResult.failure('Một số dữ liệu không thể sao lưu'),
        lastSyncTime: DateTime.now(),
      );
    } catch (e) {
      debugPrint('[Backup] Error: $e');
      state = state.copyWith(lastSyncResult: SyncResult.failure('Lỗi: $e'), lastSyncTime: DateTime.now());
    }
  }

  Future<void> performFullSync() async {
    if (!_syncService.isLoggedIn) {
      state = state.copyWith(lastSyncResult: SyncResult.notLoggedIn(), lastSyncTime: DateTime.now());
      return;
    }

    try {
      debugPrint('[Sync] Starting full restore...');
      final ok = await _syncService.downloadAndSync(
        noteDataSource: _localDataSource,
        moodDataSource: _moodDataSource,
      );

      if (ok) {
        await loadNotes();
        await _ref.read(moodProvider.notifier).loadTodayMood();
        final noteCount = state.notes.length;
        final moodCount = _ref.read(moodProvider).moods.length;
        
        state = state.copyWith(
          lastSyncResult: SyncResult.restoreSuccess(noteCount, moodCount),
          lastSyncTime: DateTime.now(),
        );
      } else {
        state = state.copyWith(
          lastSyncResult: SyncResult.failure('Không thể khôi phục dữ liệu'),
          lastSyncTime: DateTime.now(),
        );
      }
    } catch (e) {
      debugPrint('[Sync] Error: $e');
      state = state.copyWith(lastSyncResult: SyncResult.failure('Lỗi: $e'), lastSyncTime: DateTime.now());
    }
  }
}

// Note Provider
final noteProvider = StateNotifierProvider<NoteNotifier, NoteState>(
  (ref) {
    return NoteNotifier(
      ref.watch(getAllNotesProvider),
      ref.watch(getPinnedNotesProvider),
      ref.watch(addNoteProvider),
      ref.watch(updateNoteProvider),
      ref.watch(deleteNoteProvider),
      ref.watch(pinNoteProvider),
      ref.watch(unpinNoteProvider),
      ref.watch(archiveNoteProvider),
      ref.watch(searchNotesProvider),
      ref.watch(noteLocalDataSourceProvider),
      ref.watch(moodLocalDataSourceProvider),
      ref,
    );
  },
);
