import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:vietlife_note/core/constants/app_constants.dart';
import 'package:vietlife_note/presentation/providers/note_provider.dart';
import 'package:vietlife_note/presentation/widgets/note_card.dart';
import 'package:vietlife_note/presentation/screens/create_note/create_note_screen.dart';

class NotesScreen extends ConsumerStatefulWidget {
  const NotesScreen({super.key});

  @override
  ConsumerState<NotesScreen> createState() => _NotesScreenState();
}

class _NotesScreenState extends ConsumerState<NotesScreen> {
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final noteState = ref.watch(noteProvider);
    final displayNotes = _searchQuery.isEmpty
        ? noteState.notes
        : noteState.searchResults;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Ghi chú'),
        actions: [
          IconButton(
            icon: const Icon(PhosphorIconsRegular.magnifyingGlass),
            onPressed: () {
              // Show search
            },
          ),
        ],
      ),
      body: Column(
        children: [
          // Search Bar
          Padding(
            padding: const EdgeInsets.all(AppConstants.spacingM),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Tìm kiếm ghi chú...',
                prefixIcon: const Icon(PhosphorIconsRegular.magnifyingGlass),
                suffixIcon: _searchQuery.isNotEmpty
                    ? IconButton(
                        icon: const Icon(PhosphorIconsRegular.x),
                        onPressed: () {
                          _searchController.clear();
                          setState(() {
                            _searchQuery = '';
                          });
                        },
                      )
                    : null,
              ),
              onChanged: (value) {
                setState(() {
                  _searchQuery = value;
                });
                ref.read(noteProvider.notifier).searchNotes(value);
              },
            ),
          ),

          // Notes List
          Expanded(
            child: noteState.status == NoteStatus.loading
                ? const Center(child: CircularProgressIndicator())
                : noteState.status == NoteStatus.error
                    ? Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              PhosphorIconsRegular.warningCircle,
                              size: 48,
                              color: Colors.red,
                            ),
                            const SizedBox(height: AppConstants.spacingM),
                            Text(
                              noteState.errorMessage ?? 'Có lỗi xảy ra',
                              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                    color: Colors.red,
                                  ),
                            ),
                            const SizedBox(height: AppConstants.spacingM),
                            ElevatedButton(
                              onPressed: () {
                                ref.read(noteProvider.notifier).refresh();
                              },
                              child: const Text('Thử lại'),
                            ),
                          ],
                        ),
                      )
                    : displayNotes.isEmpty
                        ? Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  PhosphorIconsRegular.notebook,
                                  size: 64,
                                  color: Colors.grey[400],
                                ),
                                const SizedBox(height: AppConstants.spacingM),
                                Text(
                                  _searchQuery.isEmpty
                                      ? 'Chưa có ghi chú nào'
                                      : 'Không tìm thấy kết quả',
                                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                                        color: Colors.grey,
                                      ),
                                ),
                              ],
                            ),
                          )
                        : RefreshIndicator(
                            onRefresh: () async {
                              await ref.read(noteProvider.notifier).refresh();
                            },
                            child: ListView.builder(
                              padding: const EdgeInsets.all(AppConstants.spacingM),
                              itemCount: displayNotes.length,
                              itemBuilder: (context, index) {
                                final note = displayNotes[index];
                                return Padding(
                                  padding: const EdgeInsets.only(
                                    bottom: AppConstants.spacingM,
                                  ),
                                  child: NoteCard(
                                    note: note,
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (_) => CreateNoteScreen(existingNote: note),
                                        ),
                                      );
                                    },
                                    onPin: () {
                                      if (note.isPinned) {
                                        ref.read(noteProvider.notifier).unpinNote(note.id);
                                      } else {
                                        ref.read(noteProvider.notifier).pinNote(note.id);
                                      }
                                    },
                                    onArchive: () {
                                      ref.read(noteProvider.notifier).archiveNote(note.id);
                                    },
                                    onDelete: () {
                                      _showDeleteDialog(note.id);
                                    },
                                  ),
                                );
                              },
                            ),
                          ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => const CreateNoteScreen(),
            ),
          );
        },
        icon: const Icon(PhosphorIconsRegular.plus),
        label: const Text('Tạo ghi chú'),
      ),
    );
  }

  void _showDeleteDialog(String noteId) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Xóa ghi chú'),
        content: const Text('Bạn có chắc chắn muốn xóa ghi chú này không?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Hủy'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              ref.read(noteProvider.notifier).deleteNote(noteId);
            },
            child: const Text('Xóa', style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
  }
}
