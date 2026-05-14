import 'package:equatable/equatable.dart';

class Holiday extends Equatable {
  final String id;
  final String title;
  final DateTime date;
  final String type;
  final int color;
  final String shortDescription;
  final String longDescription;
  final String? imageUrl;
  final bool isHoliday;
  final bool isLunarDate;
  final String? quote;
  final DateTime? endDate;
  final List<String> tags;

  const Holiday({
    required this.id,
    required this.title,
    required this.date,
    required this.type,
    required this.color,
    required this.shortDescription,
    required this.longDescription,
    this.imageUrl,
    required this.isHoliday,
    required this.isLunarDate,
    this.quote,
    this.endDate,
    this.tags = const [],
  });

  bool get isToday {
    final now = DateTime.now();
    return now.year == date.year &&
        now.month == date.month &&
        now.day == date.day;
  }

  bool get isPast => date.isBefore(DateTime.now());
  bool get isFuture => date.isAfter(DateTime.now());

  int get daysUntil {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final holidayDate = DateTime(date.year, date.month, date.day);
    return holidayDate.difference(today).inDays;
  }

  Holiday copyWith({
    String? id,
    String? title,
    DateTime? date,
    String? type,
    int? color,
    String? shortDescription,
    String? longDescription,
    String? imageUrl,
    bool? isHoliday,
    bool? isLunarDate,
    String? quote,
    DateTime? endDate,
    List<String>? tags,
  }) {
    return Holiday(
      id: id ?? this.id,
      title: title ?? this.title,
      date: date ?? this.date,
      type: type ?? this.type,
      color: color ?? this.color,
      shortDescription: shortDescription ?? this.shortDescription,
      longDescription: longDescription ?? this.longDescription,
      imageUrl: imageUrl ?? this.imageUrl,
      isHoliday: isHoliday ?? this.isHoliday,
      isLunarDate: isLunarDate ?? this.isLunarDate,
      quote: quote ?? this.quote,
      endDate: endDate ?? this.endDate,
      tags: tags ?? this.tags,
    );
  }

  @override
  List<Object?> get props => [
        id,
        title,
        date,
        type,
        color,
        shortDescription,
        longDescription,
        imageUrl,
        isHoliday,
        isLunarDate,
        quote,
        endDate,
        tags,
      ];
}
