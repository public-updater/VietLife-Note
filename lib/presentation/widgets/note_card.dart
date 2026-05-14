import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:vietlife_note/core/constants/app_constants.dart';
import 'package:vietlife_note/domain/entities/note.dart';
import 'package:vietlife_note/presentation/widgets/glass_card.dart';
import 'package:vietlife_note/core/utils/date_utils.dart';

class NoteCard extends StatelessWidget {
  final Note note;
  final VoidCallback? onTap;
  final VoidCallback? onPin;
  final VoidCallback? onArchive;
  final VoidCallback? onDelete;

  const NoteCard({
    super.key,
    required this.note,
    this.onTap,
    this.onPin,
    this.onArchive,
    this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      onLongPress: () {
        showModalBottomSheet(
          context: context,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
          ),
          builder: (context) => SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: 40,
                    height: 4,
                    margin: const EdgeInsets.only(bottom: 12),
                    decoration: BoxDecoration(
                      color: Colors.grey[400],
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                  ListTile(
                    leading: Icon(note.isPinned ? PhosphorIconsFill.pushPinSlash : PhosphorIconsRegular.pushPin),
                    title: Text(note.isPinned ? 'Bỏ ghim' : 'Ghim ghi chú'),
                    onTap: () {
                      Navigator.pop(context);
                      if (onPin != null) onPin!();
                    },
                  ),
                  ListTile(
                    leading: const Icon(PhosphorIconsRegular.pencilSimple),
                    title: const Text('Chỉnh sửa'),
                    onTap: () {
                      Navigator.pop(context);
                      if (onTap != null) onTap!();
                    },
                  ),
                  ListTile(
                    leading: const Icon(PhosphorIconsRegular.trash, color: Colors.red),
                    title: const Text('Xóa', style: TextStyle(color: Colors.red)),
                    onTap: () {
                      Navigator.pop(context);
                      if (onDelete != null) onDelete!();
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      },
      borderRadius: BorderRadius.circular(16),
      child: GlassCard(
        child: IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Color accent bar
              Container(
                width: 4,
                decoration: BoxDecoration(
                  color: Color(note.color),
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          note.title,
                          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      if (note.isPinned)
                        Icon(
                          PhosphorIconsFill.pushPin,
                          color: Theme.of(context).colorScheme.primary,
                          size: 20,
                        ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(
                    note.content,
                    style: Theme.of(context).textTheme.bodyMedium,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      // Mood indicator
                      if (note.mood != null) ...[
                        Icon(
                          _getMoodIcon(note.mood!),
                          size: 16,
                          color: _getMoodColor(note.mood!),
                        ),
                        const SizedBox(width: 4),
                        Text(
                          _getMoodLabel(note.mood!),
                          style: TextStyle(
                            fontSize: 12,
                            color: _getMoodColor(note.mood!),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(width: 12),
                      ],
                      Text(
                        AppDateUtils.formatDate(note.createdAt),
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              color: Colors.grey,
                            ),
                      ),
                      const Spacer(),
                      if (note.tags.isNotEmpty)
                        Row(
                          children: note.tags.take(2).map((tag) => Padding(
                            padding: const EdgeInsets.only(left: 4),
                            child: Container(
                              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                              decoration: BoxDecoration(
                                color: Theme.of(context).colorScheme.primary.withOpacity(0.1),
                                borderRadius: BorderRadius.circular(4),
                              ),
                              child: Text(
                                tag,
                                style: TextStyle(
                                  fontSize: 10,
                                  color: Theme.of(context).colorScheme.primary,
                                ),
                              ),
                            ),
                          )).toList(),
                        ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
        ),
      ),
    );
  }

  IconData _getMoodIcon(String mood) {
    switch (mood) {
      case 'happy': return PhosphorIconsRegular.smiley;
      case 'calm': return PhosphorIconsRegular.smileyBlank;
      case 'sad': return PhosphorIconsRegular.smileySad;
      case 'productive': return PhosphorIconsRegular.smileyWink;
      case 'anxious': return PhosphorIconsRegular.smileyNervous;
      case 'excited': return PhosphorIconsRegular.smileySticker;
      case 'angry': return PhosphorIconsRegular.smileyAngry;
      case 'tired': return PhosphorIconsRegular.smileyXEyes;
      case 'loved': return PhosphorIconsRegular.heart;
      case 'bored': return PhosphorIconsRegular.smileyMeh;
      default: return PhosphorIconsRegular.smiley;
    }
  }

  String _getMoodLabel(String mood) {
    switch (mood) {
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

  Color _getMoodColor(String mood) {
    switch (mood) {
      case 'happy': return Colors.amber;
      case 'calm': return Colors.blue;
      case 'sad': return Colors.blueGrey;
      case 'productive': return Colors.green;
      case 'anxious': return Colors.orange;
      case 'excited': return Colors.pink;
      case 'angry': return Colors.red;
      case 'tired': return Colors.grey;
      case 'loved': return Colors.pinkAccent;
      case 'bored': return Colors.brown;
      default: return Colors.grey;
    }
  }
}
