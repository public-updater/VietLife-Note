import 'package:vietlife_note/domain/entities/mood.dart';
import 'package:json_annotation/json_annotation.dart';

part 'mood_model.g.dart';

@JsonSerializable()
class MoodModel {
  final String id;
  final String moodType;
  final DateTime date;
  final String? note;
  final List<String> tags;
  final DateTime createdAt;

  MoodModel({
    required this.id,
    required this.moodType,
    required this.date,
    this.note,
    required this.tags,
    required this.createdAt,
  });

  factory MoodModel.fromJson(Map<String, dynamic> json) =>
      _$MoodModelFromJson(json);

  Map<String, dynamic> toJson() => _$MoodModelToJson(this);

  Mood toEntity() {
    return Mood(
      id: id,
      moodType: moodType,
      date: date,
      note: note,
      tags: tags,
      createdAt: createdAt,
    );
  }

  factory MoodModel.fromEntity(Mood mood) {
    return MoodModel(
      id: mood.id,
      moodType: mood.moodType,
      date: mood.date,
      note: mood.note,
      tags: mood.tags,
      createdAt: mood.createdAt,
    );
  }
}
