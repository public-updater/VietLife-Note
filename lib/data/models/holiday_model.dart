import 'package:vietlife_note/domain/entities/holiday.dart';
import 'package:json_annotation/json_annotation.dart';

part 'holiday_model.g.dart';

@JsonSerializable()
class HolidayModel {
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

  HolidayModel({
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
    required this.tags,
  });

  factory HolidayModel.fromJson(Map<String, dynamic> json) =>
      _$HolidayModelFromJson(json);

  Map<String, dynamic> toJson() => _$HolidayModelToJson(this);

  Holiday toEntity() {
    return Holiday(
      id: id,
      title: title,
      date: date,
      type: type,
      color: color,
      shortDescription: shortDescription,
      longDescription: longDescription,
      imageUrl: imageUrl,
      isHoliday: isHoliday,
      isLunarDate: isLunarDate,
      quote: quote,
      endDate: endDate,
      tags: tags,
    );
  }

  factory HolidayModel.fromEntity(Holiday holiday) {
    return HolidayModel(
      id: holiday.id,
      title: holiday.title,
      date: holiday.date,
      type: holiday.type,
      color: holiday.color,
      shortDescription: holiday.shortDescription,
      longDescription: holiday.longDescription,
      imageUrl: holiday.imageUrl,
      isHoliday: holiday.isHoliday,
      isLunarDate: holiday.isLunarDate,
      quote: holiday.quote,
      endDate: holiday.endDate,
      tags: holiday.tags,
    );
  }
}
