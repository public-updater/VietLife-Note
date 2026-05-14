import 'package:intl/intl.dart';

class SmartInputResult {
  final String title;
  final DateTime date;
  final bool hasTime;
  final List<String> tags;
  final bool hasReminder;

  SmartInputResult({
    required this.title,
    required this.date,
    this.hasTime = false,
    this.tags = const [],
    this.hasReminder = false,
  });

  @override
  String toString() {
    return 'SmartInputResult(title: $title, date: $date, hasTime: $hasTime, tags: $tags, hasReminder: $hasReminder)';
  }
}

class SmartInputParser {
  static SmartInputResult parse(String input) {
    String title = input;
    DateTime date = DateTime.now();
    bool hasTime = false;
    List<String> tags = [];
    bool hasReminder = false;

    // 1. Extract Date Keywords
    final now = DateTime.now();
    if (input.contains('mai')) {
      date = DateTime(now.year, now.month, now.day + 1);
      title = title.replaceAll('mai', '').trim();
    } else if (input.contains('hôm nay')) {
      date = now;
      title = title.replaceAll('hôm nay', '').trim();
    } else if (input.contains('ngày kia')) {
      date = DateTime(now.year, now.month, now.day + 2);
      title = title.replaceAll('ngày kia', '').trim();
    }

    // 2. Extract Time (e.g., 8h, 8:00, 20h)
    final timeRegex = RegExp(r'(\d{1,2})[h:](\d{0,2})');
    final timeMatch = timeRegex.firstMatch(input);
    if (timeMatch != null) {
      int hour = int.parse(timeMatch.group(1)!);
      int minute = int.tryParse(timeMatch.group(2) ?? '0') ?? 0;
      date = DateTime(date.year, date.month, date.day, hour, minute);
      hasTime = true;
      title = title.replaceAll(timeMatch.group(0)!, '').trim();
    }

    // 3. Extract Tags (based on keywords)
    final tagKeywords = {
      'học': 'học tập',
      'làm': 'công việc',
      'họp': 'cuộc họp',
      'gia đình': 'gia đình',
      'quan trọng': 'quan trọng',
      'deadline': 'quan trọng',
    };

    tagKeywords.forEach((keyword, tag) {
      if (input.toLowerCase().contains(keyword)) {
        if (!tags.contains(tag)) tags.add(tag);
      }
    });

    // 4. Extract Reminder Intent
    final reminderKeywords = ['nhắc', 'deadline', 'hạn chót', 'nộp'];
    for (var keyword in reminderKeywords) {
      if (input.toLowerCase().contains(keyword)) {
        hasReminder = true;
        break;
      }
    }

    // Clean up title (remove double spaces)
    title = title.replaceAll(RegExp(r'\s+'), ' ').trim();
    
    // If title becomes empty, use original input or "Ghi chú mới"
    if (title.isEmpty) title = "Ghi chú mới";

    return SmartInputResult(
      title: title,
      date: date,
      hasTime: hasTime,
      tags: tags,
      hasReminder: hasReminder,
    );
  }
}
