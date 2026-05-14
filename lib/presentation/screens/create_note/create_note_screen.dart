import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:uuid/uuid.dart';
import 'package:vietlife_note/core/constants/app_constants.dart';
import 'package:vietlife_note/domain/entities/note.dart';
import 'package:vietlife_note/presentation/providers/note_provider.dart';
import 'package:vietlife_note/services/ai/smart_input_parser.dart';
import 'package:vietlife_note/presentation/widgets/glass_card.dart';

class CreateNoteScreen extends ConsumerStatefulWidget {
  final DateTime? initialDate;
  final Note? existingNote;

  const CreateNoteScreen({super.key, this.initialDate, this.existingNote});

  @override
  ConsumerState<CreateNoteScreen> createState() => _CreateNoteScreenState();
}

class _CreateNoteScreenState extends ConsumerState<CreateNoteScreen> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _contentController = TextEditingController();
  late DateTime _selectedDate;
  String _selectedMood = 'happy';
  int _selectedColor = 0xFF4CAF50;
  bool _hasReminder = false;
  List<String> _tags = [];

  @override
  void initState() {
    super.initState();
    if (widget.existingNote != null) {
      _titleController.text = widget.existingNote!.title;
      _contentController.text = widget.existingNote!.content;
      _selectedDate = widget.existingNote!.date;
      _selectedMood = widget.existingNote!.mood ?? 'happy';
      _selectedColor = widget.existingNote!.color;
      _tags = List.from(widget.existingNote!.tags);
      _hasReminder = widget.existingNote!.hasReminder;
    } else {
      _selectedDate = widget.initialDate ?? DateTime.now();
    }
  }

  // Removed _onSmartInput

  void _saveNote() {
    if (_titleController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Vui lòng nhập tiêu đề')),
      );
      return;
    }

    if (widget.existingNote != null) {
      final updatedNote = widget.existingNote!.copyWith(
        title: _titleController.text,
        content: _contentController.text,
        date: _selectedDate,
        mood: _selectedMood,
        color: _selectedColor,
        tags: _tags,
      );
      ref.read(noteProvider.notifier).updateNote(updatedNote);
    } else {
      ref.read(noteProvider.notifier).addNote(
        title: _titleController.text,
        content: _contentController.text,
        date: _selectedDate,
        mood: _selectedMood,
        tags: _tags,
      );
    }
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.existingNote != null ? 'Chỉnh sửa ghi chú' : 'Tạo ghi chú'),
        actions: [
          IconButton(
            icon: const Icon(PhosphorIconsRegular.check),
            onPressed: _saveNote,
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(AppConstants.spacingM),
        child: Column(
          children: [
            // Removed Smart Input field

            // Note Title
            TextField(
              controller: _titleController,
              style: Theme.of(context).textTheme.headlineSmall,
              decoration: const InputDecoration(
                hintText: 'Tiêu đề',
                border: InputBorder.none,
              ),
            ),

            const SizedBox(height: AppConstants.spacingM),

            // Mood & Color Picker
            Row(
              children: [
                Expanded(
                  child: _buildPicker(
                    context,
                    label: 'Cảm xúc',
                    value: _getMoodLabel(_selectedMood),
                    icon: PhosphorIconsRegular.smiley,
                    onTap: () {
                      _showMoodPicker();
                    },
                  ),
                ),
                const SizedBox(width: AppConstants.spacingM),
                Expanded(
                  child: _buildPicker(
                    context,
                    label: 'Màu sắc',
                    value: _getColorLabel(_selectedColor),
                    icon: PhosphorIconsRegular.palette,
                    onTap: () {
                      _showColorPicker();
                    },
                  ),
                ),
              ],
            ),

            const SizedBox(height: AppConstants.spacingM),

            // Note Content
            TextField(
              controller: _contentController,
              maxLines: 15,
              decoration: const InputDecoration(
                hintText: 'Nội dung ghi chú...',
                border: InputBorder.none,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPicker(
    BuildContext context, {
    required String label,
    required String value,
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: GlassCard(
        padding: const EdgeInsets.all(12),
        child: Row(
          children: [
            Icon(icon, size: 20),
            const SizedBox(width: 8),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(label, style: Theme.of(context).textTheme.bodySmall),
                  Text(value, style: Theme.of(context).textTheme.bodyMedium, maxLines: 1, overflow: TextOverflow.ellipsis),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _getMoodLabel(String moodValue) {
    switch (moodValue) {
      case 'happy': return 'Vui vẻ';
      case 'calm': return 'Bình yên';
      case 'sad': return 'Buồn';
      case 'productive': return 'Năng suất';
      case 'anxious': return 'Lo lắng';
      case 'excited': return 'Hào hứng';
      case 'angry': return 'Tức giận';
      case 'tired': return 'Mệt mỏi';
      case 'loved': return 'Yêu thương';
      case 'bored': return 'Chán nản';
      default: return 'Cảm xúc';
    }
  }

  String _getColorLabel(int colorValue) {
    switch (colorValue) {
      case 0xFF4CAF50: return 'Xanh lá';
      case 0xFF2196F3: return 'Xanh dương';
      case 0xFFF44336: return 'Đỏ';
      case 0xFFFF9800: return 'Cam';
      case 0xFF9C27B0: return 'Tím';
      case 0xFFFFEB3B: return 'Vàng';
      default: return 'Màu sắc';
    }
  }

  void _showMoodPicker() {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        final moods = [
          {'value': 'happy', 'label': 'Vui vẻ', 'icon': PhosphorIconsRegular.smiley},
          {'value': 'calm', 'label': 'Bình yên', 'icon': PhosphorIconsRegular.smileyBlank},
          {'value': 'sad', 'label': 'Buồn', 'icon': PhosphorIconsRegular.smileySad},
          {'value': 'productive', 'label': 'Năng suất', 'icon': PhosphorIconsRegular.smileyWink},
          {'value': 'anxious', 'label': 'Lo lắng', 'icon': PhosphorIconsRegular.smileyNervous},
          {'value': 'excited', 'label': 'Hào hứng', 'icon': PhosphorIconsRegular.smileySticker},
          {'value': 'angry', 'label': 'Tức giận', 'icon': PhosphorIconsRegular.smileyAngry},
          {'value': 'tired', 'label': 'Mệt mỏi', 'icon': PhosphorIconsRegular.smileyXEyes},
          {'value': 'loved', 'label': 'Yêu thương', 'icon': PhosphorIconsRegular.heart},
          {'value': 'bored', 'label': 'Chán nản', 'icon': PhosphorIconsRegular.smileyMeh},
        ];
        return SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: moods.map((mood) {
              return ListTile(
                leading: Icon(mood['icon'] as IconData),
                title: Text(mood['label'] as String),
                onTap: () {
                  setState(() {
                    _selectedMood = mood['value'] as String;
                  });
                  Navigator.pop(context);
                },
              );
            }).toList(),
          ),
        );
      },
    );
  }

  void _showColorPicker() {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        final colors = [
          {'value': 0xFF4CAF50, 'label': 'Xanh lá'},
          {'value': 0xFF2196F3, 'label': 'Xanh dương'},
          {'value': 0xFFF44336, 'label': 'Đỏ'},
          {'value': 0xFFFF9800, 'label': 'Cam'},
          {'value': 0xFF9C27B0, 'label': 'Tím'},
          {'value': 0xFFFFEB3B, 'label': 'Vàng'},
        ];
        return SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: colors.map((color) {
              return ListTile(
                leading: CircleAvatar(
                  backgroundColor: Color(color['value'] as int),
                  radius: 12,
                ),
                title: Text(color['label'] as String),
                onTap: () {
                  setState(() {
                    _selectedColor = color['value'] as int;
                  });
                  Navigator.pop(context);
                },
              );
            }).toList(),
          ),
        );
      },
    );
  }
}
