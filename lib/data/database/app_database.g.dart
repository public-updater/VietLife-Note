// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $NotesTable extends Notes with TableInfo<$NotesTable, Note> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $NotesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
      'title', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _contentMeta =
      const VerificationMeta('content');
  @override
  late final GeneratedColumn<String> content = GeneratedColumn<String>(
      'content', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<DateTime> date = GeneratedColumn<DateTime>(
      'date', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _startTimeMeta =
      const VerificationMeta('startTime');
  @override
  late final GeneratedColumn<DateTime> startTime = GeneratedColumn<DateTime>(
      'start_time', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _endTimeMeta =
      const VerificationMeta('endTime');
  @override
  late final GeneratedColumn<DateTime> endTime = GeneratedColumn<DateTime>(
      'end_time', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _hasReminderMeta =
      const VerificationMeta('hasReminder');
  @override
  late final GeneratedColumn<bool> hasReminder = GeneratedColumn<bool>(
      'has_reminder', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("has_reminder" IN (0, 1))'),
      defaultValue: const Constant(false));
  static const VerificationMeta _reminderTimeMeta =
      const VerificationMeta('reminderTime');
  @override
  late final GeneratedColumn<DateTime> reminderTime = GeneratedColumn<DateTime>(
      'reminder_time', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _repeatTypeMeta =
      const VerificationMeta('repeatType');
  @override
  late final GeneratedColumn<String> repeatType = GeneratedColumn<String>(
      'repeat_type', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant('none'));
  static const VerificationMeta _priorityMeta =
      const VerificationMeta('priority');
  @override
  late final GeneratedColumn<String> priority = GeneratedColumn<String>(
      'priority', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant('medium'));
  static const VerificationMeta _moodMeta = const VerificationMeta('mood');
  @override
  late final GeneratedColumn<String> mood = GeneratedColumn<String>(
      'mood', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _colorMeta = const VerificationMeta('color');
  @override
  late final GeneratedColumn<int> color = GeneratedColumn<int>(
      'color', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0xFF4CAF50));
  static const VerificationMeta _tagsMeta = const VerificationMeta('tags');
  @override
  late final GeneratedColumn<String> tags = GeneratedColumn<String>(
      'tags', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant('[]'));
  static const VerificationMeta _checklistMeta =
      const VerificationMeta('checklist');
  @override
  late final GeneratedColumn<String> checklist = GeneratedColumn<String>(
      'checklist', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant('[]'));
  static const VerificationMeta _attachmentsMeta =
      const VerificationMeta('attachments');
  @override
  late final GeneratedColumn<String> attachments = GeneratedColumn<String>(
      'attachments', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant('[]'));
  static const VerificationMeta _voiceNotePathMeta =
      const VerificationMeta('voiceNotePath');
  @override
  late final GeneratedColumn<String> voiceNotePath = GeneratedColumn<String>(
      'voice_note_path', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _locationMeta =
      const VerificationMeta('location');
  @override
  late final GeneratedColumn<String> location = GeneratedColumn<String>(
      'location', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _isPinnedMeta =
      const VerificationMeta('isPinned');
  @override
  late final GeneratedColumn<bool> isPinned = GeneratedColumn<bool>(
      'is_pinned', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_pinned" IN (0, 1))'),
      defaultValue: const Constant(false));
  static const VerificationMeta _isArchivedMeta =
      const VerificationMeta('isArchived');
  @override
  late final GeneratedColumn<bool> isArchived = GeneratedColumn<bool>(
      'is_archived', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_archived" IN (0, 1))'),
      defaultValue: const Constant(false));
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        title,
        content,
        date,
        startTime,
        endTime,
        hasReminder,
        reminderTime,
        repeatType,
        priority,
        mood,
        color,
        tags,
        checklist,
        attachments,
        voiceNotePath,
        location,
        isPinned,
        isArchived,
        createdAt,
        updatedAt
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'notes';
  @override
  VerificationContext validateIntegrity(Insertable<Note> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('content')) {
      context.handle(_contentMeta,
          content.isAcceptableOrUnknown(data['content']!, _contentMeta));
    } else if (isInserting) {
      context.missing(_contentMeta);
    }
    if (data.containsKey('date')) {
      context.handle(
          _dateMeta, date.isAcceptableOrUnknown(data['date']!, _dateMeta));
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    if (data.containsKey('start_time')) {
      context.handle(_startTimeMeta,
          startTime.isAcceptableOrUnknown(data['start_time']!, _startTimeMeta));
    }
    if (data.containsKey('end_time')) {
      context.handle(_endTimeMeta,
          endTime.isAcceptableOrUnknown(data['end_time']!, _endTimeMeta));
    }
    if (data.containsKey('has_reminder')) {
      context.handle(
          _hasReminderMeta,
          hasReminder.isAcceptableOrUnknown(
              data['has_reminder']!, _hasReminderMeta));
    }
    if (data.containsKey('reminder_time')) {
      context.handle(
          _reminderTimeMeta,
          reminderTime.isAcceptableOrUnknown(
              data['reminder_time']!, _reminderTimeMeta));
    }
    if (data.containsKey('repeat_type')) {
      context.handle(
          _repeatTypeMeta,
          repeatType.isAcceptableOrUnknown(
              data['repeat_type']!, _repeatTypeMeta));
    }
    if (data.containsKey('priority')) {
      context.handle(_priorityMeta,
          priority.isAcceptableOrUnknown(data['priority']!, _priorityMeta));
    }
    if (data.containsKey('mood')) {
      context.handle(
          _moodMeta, mood.isAcceptableOrUnknown(data['mood']!, _moodMeta));
    }
    if (data.containsKey('color')) {
      context.handle(
          _colorMeta, color.isAcceptableOrUnknown(data['color']!, _colorMeta));
    }
    if (data.containsKey('tags')) {
      context.handle(
          _tagsMeta, tags.isAcceptableOrUnknown(data['tags']!, _tagsMeta));
    }
    if (data.containsKey('checklist')) {
      context.handle(_checklistMeta,
          checklist.isAcceptableOrUnknown(data['checklist']!, _checklistMeta));
    }
    if (data.containsKey('attachments')) {
      context.handle(
          _attachmentsMeta,
          attachments.isAcceptableOrUnknown(
              data['attachments']!, _attachmentsMeta));
    }
    if (data.containsKey('voice_note_path')) {
      context.handle(
          _voiceNotePathMeta,
          voiceNotePath.isAcceptableOrUnknown(
              data['voice_note_path']!, _voiceNotePathMeta));
    }
    if (data.containsKey('location')) {
      context.handle(_locationMeta,
          location.isAcceptableOrUnknown(data['location']!, _locationMeta));
    }
    if (data.containsKey('is_pinned')) {
      context.handle(_isPinnedMeta,
          isPinned.isAcceptableOrUnknown(data['is_pinned']!, _isPinnedMeta));
    }
    if (data.containsKey('is_archived')) {
      context.handle(
          _isArchivedMeta,
          isArchived.isAcceptableOrUnknown(
              data['is_archived']!, _isArchivedMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Note map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Note(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      title: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}title'])!,
      content: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}content'])!,
      date: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}date'])!,
      startTime: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}start_time']),
      endTime: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}end_time']),
      hasReminder: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}has_reminder'])!,
      reminderTime: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}reminder_time']),
      repeatType: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}repeat_type'])!,
      priority: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}priority'])!,
      mood: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}mood']),
      color: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}color'])!,
      tags: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}tags'])!,
      checklist: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}checklist'])!,
      attachments: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}attachments'])!,
      voiceNotePath: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}voice_note_path']),
      location: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}location']),
      isPinned: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_pinned'])!,
      isArchived: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_archived'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at'])!,
    );
  }

  @override
  $NotesTable createAlias(String alias) {
    return $NotesTable(attachedDatabase, alias);
  }
}

class Note extends DataClass implements Insertable<Note> {
  final String id;
  final String title;
  final String content;
  final DateTime date;
  final DateTime? startTime;
  final DateTime? endTime;
  final bool hasReminder;
  final DateTime? reminderTime;
  final String repeatType;
  final String priority;
  final String? mood;
  final int color;
  final String tags;
  final String checklist;
  final String attachments;
  final String? voiceNotePath;
  final String? location;
  final bool isPinned;
  final bool isArchived;
  final DateTime createdAt;
  final DateTime updatedAt;
  const Note(
      {required this.id,
      required this.title,
      required this.content,
      required this.date,
      this.startTime,
      this.endTime,
      required this.hasReminder,
      this.reminderTime,
      required this.repeatType,
      required this.priority,
      this.mood,
      required this.color,
      required this.tags,
      required this.checklist,
      required this.attachments,
      this.voiceNotePath,
      this.location,
      required this.isPinned,
      required this.isArchived,
      required this.createdAt,
      required this.updatedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['title'] = Variable<String>(title);
    map['content'] = Variable<String>(content);
    map['date'] = Variable<DateTime>(date);
    if (!nullToAbsent || startTime != null) {
      map['start_time'] = Variable<DateTime>(startTime);
    }
    if (!nullToAbsent || endTime != null) {
      map['end_time'] = Variable<DateTime>(endTime);
    }
    map['has_reminder'] = Variable<bool>(hasReminder);
    if (!nullToAbsent || reminderTime != null) {
      map['reminder_time'] = Variable<DateTime>(reminderTime);
    }
    map['repeat_type'] = Variable<String>(repeatType);
    map['priority'] = Variable<String>(priority);
    if (!nullToAbsent || mood != null) {
      map['mood'] = Variable<String>(mood);
    }
    map['color'] = Variable<int>(color);
    map['tags'] = Variable<String>(tags);
    map['checklist'] = Variable<String>(checklist);
    map['attachments'] = Variable<String>(attachments);
    if (!nullToAbsent || voiceNotePath != null) {
      map['voice_note_path'] = Variable<String>(voiceNotePath);
    }
    if (!nullToAbsent || location != null) {
      map['location'] = Variable<String>(location);
    }
    map['is_pinned'] = Variable<bool>(isPinned);
    map['is_archived'] = Variable<bool>(isArchived);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  NotesCompanion toCompanion(bool nullToAbsent) {
    return NotesCompanion(
      id: Value(id),
      title: Value(title),
      content: Value(content),
      date: Value(date),
      startTime: startTime == null && nullToAbsent
          ? const Value.absent()
          : Value(startTime),
      endTime: endTime == null && nullToAbsent
          ? const Value.absent()
          : Value(endTime),
      hasReminder: Value(hasReminder),
      reminderTime: reminderTime == null && nullToAbsent
          ? const Value.absent()
          : Value(reminderTime),
      repeatType: Value(repeatType),
      priority: Value(priority),
      mood: mood == null && nullToAbsent ? const Value.absent() : Value(mood),
      color: Value(color),
      tags: Value(tags),
      checklist: Value(checklist),
      attachments: Value(attachments),
      voiceNotePath: voiceNotePath == null && nullToAbsent
          ? const Value.absent()
          : Value(voiceNotePath),
      location: location == null && nullToAbsent
          ? const Value.absent()
          : Value(location),
      isPinned: Value(isPinned),
      isArchived: Value(isArchived),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory Note.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Note(
      id: serializer.fromJson<String>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      content: serializer.fromJson<String>(json['content']),
      date: serializer.fromJson<DateTime>(json['date']),
      startTime: serializer.fromJson<DateTime?>(json['startTime']),
      endTime: serializer.fromJson<DateTime?>(json['endTime']),
      hasReminder: serializer.fromJson<bool>(json['hasReminder']),
      reminderTime: serializer.fromJson<DateTime?>(json['reminderTime']),
      repeatType: serializer.fromJson<String>(json['repeatType']),
      priority: serializer.fromJson<String>(json['priority']),
      mood: serializer.fromJson<String?>(json['mood']),
      color: serializer.fromJson<int>(json['color']),
      tags: serializer.fromJson<String>(json['tags']),
      checklist: serializer.fromJson<String>(json['checklist']),
      attachments: serializer.fromJson<String>(json['attachments']),
      voiceNotePath: serializer.fromJson<String?>(json['voiceNotePath']),
      location: serializer.fromJson<String?>(json['location']),
      isPinned: serializer.fromJson<bool>(json['isPinned']),
      isArchived: serializer.fromJson<bool>(json['isArchived']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'title': serializer.toJson<String>(title),
      'content': serializer.toJson<String>(content),
      'date': serializer.toJson<DateTime>(date),
      'startTime': serializer.toJson<DateTime?>(startTime),
      'endTime': serializer.toJson<DateTime?>(endTime),
      'hasReminder': serializer.toJson<bool>(hasReminder),
      'reminderTime': serializer.toJson<DateTime?>(reminderTime),
      'repeatType': serializer.toJson<String>(repeatType),
      'priority': serializer.toJson<String>(priority),
      'mood': serializer.toJson<String?>(mood),
      'color': serializer.toJson<int>(color),
      'tags': serializer.toJson<String>(tags),
      'checklist': serializer.toJson<String>(checklist),
      'attachments': serializer.toJson<String>(attachments),
      'voiceNotePath': serializer.toJson<String?>(voiceNotePath),
      'location': serializer.toJson<String?>(location),
      'isPinned': serializer.toJson<bool>(isPinned),
      'isArchived': serializer.toJson<bool>(isArchived),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  Note copyWith(
          {String? id,
          String? title,
          String? content,
          DateTime? date,
          Value<DateTime?> startTime = const Value.absent(),
          Value<DateTime?> endTime = const Value.absent(),
          bool? hasReminder,
          Value<DateTime?> reminderTime = const Value.absent(),
          String? repeatType,
          String? priority,
          Value<String?> mood = const Value.absent(),
          int? color,
          String? tags,
          String? checklist,
          String? attachments,
          Value<String?> voiceNotePath = const Value.absent(),
          Value<String?> location = const Value.absent(),
          bool? isPinned,
          bool? isArchived,
          DateTime? createdAt,
          DateTime? updatedAt}) =>
      Note(
        id: id ?? this.id,
        title: title ?? this.title,
        content: content ?? this.content,
        date: date ?? this.date,
        startTime: startTime.present ? startTime.value : this.startTime,
        endTime: endTime.present ? endTime.value : this.endTime,
        hasReminder: hasReminder ?? this.hasReminder,
        reminderTime:
            reminderTime.present ? reminderTime.value : this.reminderTime,
        repeatType: repeatType ?? this.repeatType,
        priority: priority ?? this.priority,
        mood: mood.present ? mood.value : this.mood,
        color: color ?? this.color,
        tags: tags ?? this.tags,
        checklist: checklist ?? this.checklist,
        attachments: attachments ?? this.attachments,
        voiceNotePath:
            voiceNotePath.present ? voiceNotePath.value : this.voiceNotePath,
        location: location.present ? location.value : this.location,
        isPinned: isPinned ?? this.isPinned,
        isArchived: isArchived ?? this.isArchived,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );
  Note copyWithCompanion(NotesCompanion data) {
    return Note(
      id: data.id.present ? data.id.value : this.id,
      title: data.title.present ? data.title.value : this.title,
      content: data.content.present ? data.content.value : this.content,
      date: data.date.present ? data.date.value : this.date,
      startTime: data.startTime.present ? data.startTime.value : this.startTime,
      endTime: data.endTime.present ? data.endTime.value : this.endTime,
      hasReminder:
          data.hasReminder.present ? data.hasReminder.value : this.hasReminder,
      reminderTime: data.reminderTime.present
          ? data.reminderTime.value
          : this.reminderTime,
      repeatType:
          data.repeatType.present ? data.repeatType.value : this.repeatType,
      priority: data.priority.present ? data.priority.value : this.priority,
      mood: data.mood.present ? data.mood.value : this.mood,
      color: data.color.present ? data.color.value : this.color,
      tags: data.tags.present ? data.tags.value : this.tags,
      checklist: data.checklist.present ? data.checklist.value : this.checklist,
      attachments:
          data.attachments.present ? data.attachments.value : this.attachments,
      voiceNotePath: data.voiceNotePath.present
          ? data.voiceNotePath.value
          : this.voiceNotePath,
      location: data.location.present ? data.location.value : this.location,
      isPinned: data.isPinned.present ? data.isPinned.value : this.isPinned,
      isArchived:
          data.isArchived.present ? data.isArchived.value : this.isArchived,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Note(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('content: $content, ')
          ..write('date: $date, ')
          ..write('startTime: $startTime, ')
          ..write('endTime: $endTime, ')
          ..write('hasReminder: $hasReminder, ')
          ..write('reminderTime: $reminderTime, ')
          ..write('repeatType: $repeatType, ')
          ..write('priority: $priority, ')
          ..write('mood: $mood, ')
          ..write('color: $color, ')
          ..write('tags: $tags, ')
          ..write('checklist: $checklist, ')
          ..write('attachments: $attachments, ')
          ..write('voiceNotePath: $voiceNotePath, ')
          ..write('location: $location, ')
          ..write('isPinned: $isPinned, ')
          ..write('isArchived: $isArchived, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hashAll([
        id,
        title,
        content,
        date,
        startTime,
        endTime,
        hasReminder,
        reminderTime,
        repeatType,
        priority,
        mood,
        color,
        tags,
        checklist,
        attachments,
        voiceNotePath,
        location,
        isPinned,
        isArchived,
        createdAt,
        updatedAt
      ]);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Note &&
          other.id == this.id &&
          other.title == this.title &&
          other.content == this.content &&
          other.date == this.date &&
          other.startTime == this.startTime &&
          other.endTime == this.endTime &&
          other.hasReminder == this.hasReminder &&
          other.reminderTime == this.reminderTime &&
          other.repeatType == this.repeatType &&
          other.priority == this.priority &&
          other.mood == this.mood &&
          other.color == this.color &&
          other.tags == this.tags &&
          other.checklist == this.checklist &&
          other.attachments == this.attachments &&
          other.voiceNotePath == this.voiceNotePath &&
          other.location == this.location &&
          other.isPinned == this.isPinned &&
          other.isArchived == this.isArchived &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class NotesCompanion extends UpdateCompanion<Note> {
  final Value<String> id;
  final Value<String> title;
  final Value<String> content;
  final Value<DateTime> date;
  final Value<DateTime?> startTime;
  final Value<DateTime?> endTime;
  final Value<bool> hasReminder;
  final Value<DateTime?> reminderTime;
  final Value<String> repeatType;
  final Value<String> priority;
  final Value<String?> mood;
  final Value<int> color;
  final Value<String> tags;
  final Value<String> checklist;
  final Value<String> attachments;
  final Value<String?> voiceNotePath;
  final Value<String?> location;
  final Value<bool> isPinned;
  final Value<bool> isArchived;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<int> rowid;
  const NotesCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.content = const Value.absent(),
    this.date = const Value.absent(),
    this.startTime = const Value.absent(),
    this.endTime = const Value.absent(),
    this.hasReminder = const Value.absent(),
    this.reminderTime = const Value.absent(),
    this.repeatType = const Value.absent(),
    this.priority = const Value.absent(),
    this.mood = const Value.absent(),
    this.color = const Value.absent(),
    this.tags = const Value.absent(),
    this.checklist = const Value.absent(),
    this.attachments = const Value.absent(),
    this.voiceNotePath = const Value.absent(),
    this.location = const Value.absent(),
    this.isPinned = const Value.absent(),
    this.isArchived = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  NotesCompanion.insert({
    required String id,
    required String title,
    required String content,
    required DateTime date,
    this.startTime = const Value.absent(),
    this.endTime = const Value.absent(),
    this.hasReminder = const Value.absent(),
    this.reminderTime = const Value.absent(),
    this.repeatType = const Value.absent(),
    this.priority = const Value.absent(),
    this.mood = const Value.absent(),
    this.color = const Value.absent(),
    this.tags = const Value.absent(),
    this.checklist = const Value.absent(),
    this.attachments = const Value.absent(),
    this.voiceNotePath = const Value.absent(),
    this.location = const Value.absent(),
    this.isPinned = const Value.absent(),
    this.isArchived = const Value.absent(),
    required DateTime createdAt,
    required DateTime updatedAt,
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        title = Value(title),
        content = Value(content),
        date = Value(date),
        createdAt = Value(createdAt),
        updatedAt = Value(updatedAt);
  static Insertable<Note> custom({
    Expression<String>? id,
    Expression<String>? title,
    Expression<String>? content,
    Expression<DateTime>? date,
    Expression<DateTime>? startTime,
    Expression<DateTime>? endTime,
    Expression<bool>? hasReminder,
    Expression<DateTime>? reminderTime,
    Expression<String>? repeatType,
    Expression<String>? priority,
    Expression<String>? mood,
    Expression<int>? color,
    Expression<String>? tags,
    Expression<String>? checklist,
    Expression<String>? attachments,
    Expression<String>? voiceNotePath,
    Expression<String>? location,
    Expression<bool>? isPinned,
    Expression<bool>? isArchived,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (content != null) 'content': content,
      if (date != null) 'date': date,
      if (startTime != null) 'start_time': startTime,
      if (endTime != null) 'end_time': endTime,
      if (hasReminder != null) 'has_reminder': hasReminder,
      if (reminderTime != null) 'reminder_time': reminderTime,
      if (repeatType != null) 'repeat_type': repeatType,
      if (priority != null) 'priority': priority,
      if (mood != null) 'mood': mood,
      if (color != null) 'color': color,
      if (tags != null) 'tags': tags,
      if (checklist != null) 'checklist': checklist,
      if (attachments != null) 'attachments': attachments,
      if (voiceNotePath != null) 'voice_note_path': voiceNotePath,
      if (location != null) 'location': location,
      if (isPinned != null) 'is_pinned': isPinned,
      if (isArchived != null) 'is_archived': isArchived,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  NotesCompanion copyWith(
      {Value<String>? id,
      Value<String>? title,
      Value<String>? content,
      Value<DateTime>? date,
      Value<DateTime?>? startTime,
      Value<DateTime?>? endTime,
      Value<bool>? hasReminder,
      Value<DateTime?>? reminderTime,
      Value<String>? repeatType,
      Value<String>? priority,
      Value<String?>? mood,
      Value<int>? color,
      Value<String>? tags,
      Value<String>? checklist,
      Value<String>? attachments,
      Value<String?>? voiceNotePath,
      Value<String?>? location,
      Value<bool>? isPinned,
      Value<bool>? isArchived,
      Value<DateTime>? createdAt,
      Value<DateTime>? updatedAt,
      Value<int>? rowid}) {
    return NotesCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      content: content ?? this.content,
      date: date ?? this.date,
      startTime: startTime ?? this.startTime,
      endTime: endTime ?? this.endTime,
      hasReminder: hasReminder ?? this.hasReminder,
      reminderTime: reminderTime ?? this.reminderTime,
      repeatType: repeatType ?? this.repeatType,
      priority: priority ?? this.priority,
      mood: mood ?? this.mood,
      color: color ?? this.color,
      tags: tags ?? this.tags,
      checklist: checklist ?? this.checklist,
      attachments: attachments ?? this.attachments,
      voiceNotePath: voiceNotePath ?? this.voiceNotePath,
      location: location ?? this.location,
      isPinned: isPinned ?? this.isPinned,
      isArchived: isArchived ?? this.isArchived,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (content.present) {
      map['content'] = Variable<String>(content.value);
    }
    if (date.present) {
      map['date'] = Variable<DateTime>(date.value);
    }
    if (startTime.present) {
      map['start_time'] = Variable<DateTime>(startTime.value);
    }
    if (endTime.present) {
      map['end_time'] = Variable<DateTime>(endTime.value);
    }
    if (hasReminder.present) {
      map['has_reminder'] = Variable<bool>(hasReminder.value);
    }
    if (reminderTime.present) {
      map['reminder_time'] = Variable<DateTime>(reminderTime.value);
    }
    if (repeatType.present) {
      map['repeat_type'] = Variable<String>(repeatType.value);
    }
    if (priority.present) {
      map['priority'] = Variable<String>(priority.value);
    }
    if (mood.present) {
      map['mood'] = Variable<String>(mood.value);
    }
    if (color.present) {
      map['color'] = Variable<int>(color.value);
    }
    if (tags.present) {
      map['tags'] = Variable<String>(tags.value);
    }
    if (checklist.present) {
      map['checklist'] = Variable<String>(checklist.value);
    }
    if (attachments.present) {
      map['attachments'] = Variable<String>(attachments.value);
    }
    if (voiceNotePath.present) {
      map['voice_note_path'] = Variable<String>(voiceNotePath.value);
    }
    if (location.present) {
      map['location'] = Variable<String>(location.value);
    }
    if (isPinned.present) {
      map['is_pinned'] = Variable<bool>(isPinned.value);
    }
    if (isArchived.present) {
      map['is_archived'] = Variable<bool>(isArchived.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('NotesCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('content: $content, ')
          ..write('date: $date, ')
          ..write('startTime: $startTime, ')
          ..write('endTime: $endTime, ')
          ..write('hasReminder: $hasReminder, ')
          ..write('reminderTime: $reminderTime, ')
          ..write('repeatType: $repeatType, ')
          ..write('priority: $priority, ')
          ..write('mood: $mood, ')
          ..write('color: $color, ')
          ..write('tags: $tags, ')
          ..write('checklist: $checklist, ')
          ..write('attachments: $attachments, ')
          ..write('voiceNotePath: $voiceNotePath, ')
          ..write('location: $location, ')
          ..write('isPinned: $isPinned, ')
          ..write('isArchived: $isArchived, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $HolidaysTable extends Holidays with TableInfo<$HolidaysTable, Holiday> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $HolidaysTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
      'title', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<DateTime> date = GeneratedColumn<DateTime>(
      'date', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _typeMeta = const VerificationMeta('type');
  @override
  late final GeneratedColumn<String> type = GeneratedColumn<String>(
      'type', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _colorMeta = const VerificationMeta('color');
  @override
  late final GeneratedColumn<int> color = GeneratedColumn<int>(
      'color', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _shortDescriptionMeta =
      const VerificationMeta('shortDescription');
  @override
  late final GeneratedColumn<String> shortDescription = GeneratedColumn<String>(
      'short_description', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _longDescriptionMeta =
      const VerificationMeta('longDescription');
  @override
  late final GeneratedColumn<String> longDescription = GeneratedColumn<String>(
      'long_description', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _imageUrlMeta =
      const VerificationMeta('imageUrl');
  @override
  late final GeneratedColumn<String> imageUrl = GeneratedColumn<String>(
      'image_url', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _isHolidayMeta =
      const VerificationMeta('isHoliday');
  @override
  late final GeneratedColumn<bool> isHoliday = GeneratedColumn<bool>(
      'is_holiday', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_holiday" IN (0, 1))'));
  static const VerificationMeta _isLunarDateMeta =
      const VerificationMeta('isLunarDate');
  @override
  late final GeneratedColumn<bool> isLunarDate = GeneratedColumn<bool>(
      'is_lunar_date', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("is_lunar_date" IN (0, 1))'));
  static const VerificationMeta _quoteMeta = const VerificationMeta('quote');
  @override
  late final GeneratedColumn<String> quote = GeneratedColumn<String>(
      'quote', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _endDateMeta =
      const VerificationMeta('endDate');
  @override
  late final GeneratedColumn<DateTime> endDate = GeneratedColumn<DateTime>(
      'end_date', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _tagsMeta = const VerificationMeta('tags');
  @override
  late final GeneratedColumn<String> tags = GeneratedColumn<String>(
      'tags', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant('[]'));
  @override
  List<GeneratedColumn> get $columns => [
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
        tags
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'holidays';
  @override
  VerificationContext validateIntegrity(Insertable<Holiday> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('date')) {
      context.handle(
          _dateMeta, date.isAcceptableOrUnknown(data['date']!, _dateMeta));
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    if (data.containsKey('type')) {
      context.handle(
          _typeMeta, type.isAcceptableOrUnknown(data['type']!, _typeMeta));
    } else if (isInserting) {
      context.missing(_typeMeta);
    }
    if (data.containsKey('color')) {
      context.handle(
          _colorMeta, color.isAcceptableOrUnknown(data['color']!, _colorMeta));
    } else if (isInserting) {
      context.missing(_colorMeta);
    }
    if (data.containsKey('short_description')) {
      context.handle(
          _shortDescriptionMeta,
          shortDescription.isAcceptableOrUnknown(
              data['short_description']!, _shortDescriptionMeta));
    } else if (isInserting) {
      context.missing(_shortDescriptionMeta);
    }
    if (data.containsKey('long_description')) {
      context.handle(
          _longDescriptionMeta,
          longDescription.isAcceptableOrUnknown(
              data['long_description']!, _longDescriptionMeta));
    } else if (isInserting) {
      context.missing(_longDescriptionMeta);
    }
    if (data.containsKey('image_url')) {
      context.handle(_imageUrlMeta,
          imageUrl.isAcceptableOrUnknown(data['image_url']!, _imageUrlMeta));
    }
    if (data.containsKey('is_holiday')) {
      context.handle(_isHolidayMeta,
          isHoliday.isAcceptableOrUnknown(data['is_holiday']!, _isHolidayMeta));
    } else if (isInserting) {
      context.missing(_isHolidayMeta);
    }
    if (data.containsKey('is_lunar_date')) {
      context.handle(
          _isLunarDateMeta,
          isLunarDate.isAcceptableOrUnknown(
              data['is_lunar_date']!, _isLunarDateMeta));
    } else if (isInserting) {
      context.missing(_isLunarDateMeta);
    }
    if (data.containsKey('quote')) {
      context.handle(
          _quoteMeta, quote.isAcceptableOrUnknown(data['quote']!, _quoteMeta));
    }
    if (data.containsKey('end_date')) {
      context.handle(_endDateMeta,
          endDate.isAcceptableOrUnknown(data['end_date']!, _endDateMeta));
    }
    if (data.containsKey('tags')) {
      context.handle(
          _tagsMeta, tags.isAcceptableOrUnknown(data['tags']!, _tagsMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Holiday map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Holiday(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      title: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}title'])!,
      date: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}date'])!,
      type: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}type'])!,
      color: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}color'])!,
      shortDescription: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}short_description'])!,
      longDescription: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}long_description'])!,
      imageUrl: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}image_url']),
      isHoliday: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_holiday'])!,
      isLunarDate: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_lunar_date'])!,
      quote: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}quote']),
      endDate: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}end_date']),
      tags: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}tags'])!,
    );
  }

  @override
  $HolidaysTable createAlias(String alias) {
    return $HolidaysTable(attachedDatabase, alias);
  }
}

class Holiday extends DataClass implements Insertable<Holiday> {
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
  final String tags;
  const Holiday(
      {required this.id,
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
      required this.tags});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['title'] = Variable<String>(title);
    map['date'] = Variable<DateTime>(date);
    map['type'] = Variable<String>(type);
    map['color'] = Variable<int>(color);
    map['short_description'] = Variable<String>(shortDescription);
    map['long_description'] = Variable<String>(longDescription);
    if (!nullToAbsent || imageUrl != null) {
      map['image_url'] = Variable<String>(imageUrl);
    }
    map['is_holiday'] = Variable<bool>(isHoliday);
    map['is_lunar_date'] = Variable<bool>(isLunarDate);
    if (!nullToAbsent || quote != null) {
      map['quote'] = Variable<String>(quote);
    }
    if (!nullToAbsent || endDate != null) {
      map['end_date'] = Variable<DateTime>(endDate);
    }
    map['tags'] = Variable<String>(tags);
    return map;
  }

  HolidaysCompanion toCompanion(bool nullToAbsent) {
    return HolidaysCompanion(
      id: Value(id),
      title: Value(title),
      date: Value(date),
      type: Value(type),
      color: Value(color),
      shortDescription: Value(shortDescription),
      longDescription: Value(longDescription),
      imageUrl: imageUrl == null && nullToAbsent
          ? const Value.absent()
          : Value(imageUrl),
      isHoliday: Value(isHoliday),
      isLunarDate: Value(isLunarDate),
      quote:
          quote == null && nullToAbsent ? const Value.absent() : Value(quote),
      endDate: endDate == null && nullToAbsent
          ? const Value.absent()
          : Value(endDate),
      tags: Value(tags),
    );
  }

  factory Holiday.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Holiday(
      id: serializer.fromJson<String>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      date: serializer.fromJson<DateTime>(json['date']),
      type: serializer.fromJson<String>(json['type']),
      color: serializer.fromJson<int>(json['color']),
      shortDescription: serializer.fromJson<String>(json['shortDescription']),
      longDescription: serializer.fromJson<String>(json['longDescription']),
      imageUrl: serializer.fromJson<String?>(json['imageUrl']),
      isHoliday: serializer.fromJson<bool>(json['isHoliday']),
      isLunarDate: serializer.fromJson<bool>(json['isLunarDate']),
      quote: serializer.fromJson<String?>(json['quote']),
      endDate: serializer.fromJson<DateTime?>(json['endDate']),
      tags: serializer.fromJson<String>(json['tags']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'title': serializer.toJson<String>(title),
      'date': serializer.toJson<DateTime>(date),
      'type': serializer.toJson<String>(type),
      'color': serializer.toJson<int>(color),
      'shortDescription': serializer.toJson<String>(shortDescription),
      'longDescription': serializer.toJson<String>(longDescription),
      'imageUrl': serializer.toJson<String?>(imageUrl),
      'isHoliday': serializer.toJson<bool>(isHoliday),
      'isLunarDate': serializer.toJson<bool>(isLunarDate),
      'quote': serializer.toJson<String?>(quote),
      'endDate': serializer.toJson<DateTime?>(endDate),
      'tags': serializer.toJson<String>(tags),
    };
  }

  Holiday copyWith(
          {String? id,
          String? title,
          DateTime? date,
          String? type,
          int? color,
          String? shortDescription,
          String? longDescription,
          Value<String?> imageUrl = const Value.absent(),
          bool? isHoliday,
          bool? isLunarDate,
          Value<String?> quote = const Value.absent(),
          Value<DateTime?> endDate = const Value.absent(),
          String? tags}) =>
      Holiday(
        id: id ?? this.id,
        title: title ?? this.title,
        date: date ?? this.date,
        type: type ?? this.type,
        color: color ?? this.color,
        shortDescription: shortDescription ?? this.shortDescription,
        longDescription: longDescription ?? this.longDescription,
        imageUrl: imageUrl.present ? imageUrl.value : this.imageUrl,
        isHoliday: isHoliday ?? this.isHoliday,
        isLunarDate: isLunarDate ?? this.isLunarDate,
        quote: quote.present ? quote.value : this.quote,
        endDate: endDate.present ? endDate.value : this.endDate,
        tags: tags ?? this.tags,
      );
  Holiday copyWithCompanion(HolidaysCompanion data) {
    return Holiday(
      id: data.id.present ? data.id.value : this.id,
      title: data.title.present ? data.title.value : this.title,
      date: data.date.present ? data.date.value : this.date,
      type: data.type.present ? data.type.value : this.type,
      color: data.color.present ? data.color.value : this.color,
      shortDescription: data.shortDescription.present
          ? data.shortDescription.value
          : this.shortDescription,
      longDescription: data.longDescription.present
          ? data.longDescription.value
          : this.longDescription,
      imageUrl: data.imageUrl.present ? data.imageUrl.value : this.imageUrl,
      isHoliday: data.isHoliday.present ? data.isHoliday.value : this.isHoliday,
      isLunarDate:
          data.isLunarDate.present ? data.isLunarDate.value : this.isLunarDate,
      quote: data.quote.present ? data.quote.value : this.quote,
      endDate: data.endDate.present ? data.endDate.value : this.endDate,
      tags: data.tags.present ? data.tags.value : this.tags,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Holiday(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('date: $date, ')
          ..write('type: $type, ')
          ..write('color: $color, ')
          ..write('shortDescription: $shortDescription, ')
          ..write('longDescription: $longDescription, ')
          ..write('imageUrl: $imageUrl, ')
          ..write('isHoliday: $isHoliday, ')
          ..write('isLunarDate: $isLunarDate, ')
          ..write('quote: $quote, ')
          ..write('endDate: $endDate, ')
          ..write('tags: $tags')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
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
      tags);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Holiday &&
          other.id == this.id &&
          other.title == this.title &&
          other.date == this.date &&
          other.type == this.type &&
          other.color == this.color &&
          other.shortDescription == this.shortDescription &&
          other.longDescription == this.longDescription &&
          other.imageUrl == this.imageUrl &&
          other.isHoliday == this.isHoliday &&
          other.isLunarDate == this.isLunarDate &&
          other.quote == this.quote &&
          other.endDate == this.endDate &&
          other.tags == this.tags);
}

class HolidaysCompanion extends UpdateCompanion<Holiday> {
  final Value<String> id;
  final Value<String> title;
  final Value<DateTime> date;
  final Value<String> type;
  final Value<int> color;
  final Value<String> shortDescription;
  final Value<String> longDescription;
  final Value<String?> imageUrl;
  final Value<bool> isHoliday;
  final Value<bool> isLunarDate;
  final Value<String?> quote;
  final Value<DateTime?> endDate;
  final Value<String> tags;
  final Value<int> rowid;
  const HolidaysCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.date = const Value.absent(),
    this.type = const Value.absent(),
    this.color = const Value.absent(),
    this.shortDescription = const Value.absent(),
    this.longDescription = const Value.absent(),
    this.imageUrl = const Value.absent(),
    this.isHoliday = const Value.absent(),
    this.isLunarDate = const Value.absent(),
    this.quote = const Value.absent(),
    this.endDate = const Value.absent(),
    this.tags = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  HolidaysCompanion.insert({
    required String id,
    required String title,
    required DateTime date,
    required String type,
    required int color,
    required String shortDescription,
    required String longDescription,
    this.imageUrl = const Value.absent(),
    required bool isHoliday,
    required bool isLunarDate,
    this.quote = const Value.absent(),
    this.endDate = const Value.absent(),
    this.tags = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        title = Value(title),
        date = Value(date),
        type = Value(type),
        color = Value(color),
        shortDescription = Value(shortDescription),
        longDescription = Value(longDescription),
        isHoliday = Value(isHoliday),
        isLunarDate = Value(isLunarDate);
  static Insertable<Holiday> custom({
    Expression<String>? id,
    Expression<String>? title,
    Expression<DateTime>? date,
    Expression<String>? type,
    Expression<int>? color,
    Expression<String>? shortDescription,
    Expression<String>? longDescription,
    Expression<String>? imageUrl,
    Expression<bool>? isHoliday,
    Expression<bool>? isLunarDate,
    Expression<String>? quote,
    Expression<DateTime>? endDate,
    Expression<String>? tags,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (date != null) 'date': date,
      if (type != null) 'type': type,
      if (color != null) 'color': color,
      if (shortDescription != null) 'short_description': shortDescription,
      if (longDescription != null) 'long_description': longDescription,
      if (imageUrl != null) 'image_url': imageUrl,
      if (isHoliday != null) 'is_holiday': isHoliday,
      if (isLunarDate != null) 'is_lunar_date': isLunarDate,
      if (quote != null) 'quote': quote,
      if (endDate != null) 'end_date': endDate,
      if (tags != null) 'tags': tags,
      if (rowid != null) 'rowid': rowid,
    });
  }

  HolidaysCompanion copyWith(
      {Value<String>? id,
      Value<String>? title,
      Value<DateTime>? date,
      Value<String>? type,
      Value<int>? color,
      Value<String>? shortDescription,
      Value<String>? longDescription,
      Value<String?>? imageUrl,
      Value<bool>? isHoliday,
      Value<bool>? isLunarDate,
      Value<String?>? quote,
      Value<DateTime?>? endDate,
      Value<String>? tags,
      Value<int>? rowid}) {
    return HolidaysCompanion(
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
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (date.present) {
      map['date'] = Variable<DateTime>(date.value);
    }
    if (type.present) {
      map['type'] = Variable<String>(type.value);
    }
    if (color.present) {
      map['color'] = Variable<int>(color.value);
    }
    if (shortDescription.present) {
      map['short_description'] = Variable<String>(shortDescription.value);
    }
    if (longDescription.present) {
      map['long_description'] = Variable<String>(longDescription.value);
    }
    if (imageUrl.present) {
      map['image_url'] = Variable<String>(imageUrl.value);
    }
    if (isHoliday.present) {
      map['is_holiday'] = Variable<bool>(isHoliday.value);
    }
    if (isLunarDate.present) {
      map['is_lunar_date'] = Variable<bool>(isLunarDate.value);
    }
    if (quote.present) {
      map['quote'] = Variable<String>(quote.value);
    }
    if (endDate.present) {
      map['end_date'] = Variable<DateTime>(endDate.value);
    }
    if (tags.present) {
      map['tags'] = Variable<String>(tags.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('HolidaysCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('date: $date, ')
          ..write('type: $type, ')
          ..write('color: $color, ')
          ..write('shortDescription: $shortDescription, ')
          ..write('longDescription: $longDescription, ')
          ..write('imageUrl: $imageUrl, ')
          ..write('isHoliday: $isHoliday, ')
          ..write('isLunarDate: $isLunarDate, ')
          ..write('quote: $quote, ')
          ..write('endDate: $endDate, ')
          ..write('tags: $tags, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $MoodsTable extends Moods with TableInfo<$MoodsTable, Mood> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $MoodsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _moodTypeMeta =
      const VerificationMeta('moodType');
  @override
  late final GeneratedColumn<String> moodType = GeneratedColumn<String>(
      'mood_type', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<DateTime> date = GeneratedColumn<DateTime>(
      'date', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _noteMeta = const VerificationMeta('note');
  @override
  late final GeneratedColumn<String> note = GeneratedColumn<String>(
      'note', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _tagsMeta = const VerificationMeta('tags');
  @override
  late final GeneratedColumn<String> tags = GeneratedColumn<String>(
      'tags', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant('[]'));
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, moodType, date, note, tags, createdAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'moods';
  @override
  VerificationContext validateIntegrity(Insertable<Mood> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('mood_type')) {
      context.handle(_moodTypeMeta,
          moodType.isAcceptableOrUnknown(data['mood_type']!, _moodTypeMeta));
    } else if (isInserting) {
      context.missing(_moodTypeMeta);
    }
    if (data.containsKey('date')) {
      context.handle(
          _dateMeta, date.isAcceptableOrUnknown(data['date']!, _dateMeta));
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    if (data.containsKey('note')) {
      context.handle(
          _noteMeta, note.isAcceptableOrUnknown(data['note']!, _noteMeta));
    }
    if (data.containsKey('tags')) {
      context.handle(
          _tagsMeta, tags.isAcceptableOrUnknown(data['tags']!, _tagsMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Mood map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Mood(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      moodType: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}mood_type'])!,
      date: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}date'])!,
      note: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}note']),
      tags: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}tags'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
    );
  }

  @override
  $MoodsTable createAlias(String alias) {
    return $MoodsTable(attachedDatabase, alias);
  }
}

class Mood extends DataClass implements Insertable<Mood> {
  final String id;
  final String moodType;
  final DateTime date;
  final String? note;
  final String tags;
  final DateTime createdAt;
  const Mood(
      {required this.id,
      required this.moodType,
      required this.date,
      this.note,
      required this.tags,
      required this.createdAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['mood_type'] = Variable<String>(moodType);
    map['date'] = Variable<DateTime>(date);
    if (!nullToAbsent || note != null) {
      map['note'] = Variable<String>(note);
    }
    map['tags'] = Variable<String>(tags);
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  MoodsCompanion toCompanion(bool nullToAbsent) {
    return MoodsCompanion(
      id: Value(id),
      moodType: Value(moodType),
      date: Value(date),
      note: note == null && nullToAbsent ? const Value.absent() : Value(note),
      tags: Value(tags),
      createdAt: Value(createdAt),
    );
  }

  factory Mood.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Mood(
      id: serializer.fromJson<String>(json['id']),
      moodType: serializer.fromJson<String>(json['moodType']),
      date: serializer.fromJson<DateTime>(json['date']),
      note: serializer.fromJson<String?>(json['note']),
      tags: serializer.fromJson<String>(json['tags']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'moodType': serializer.toJson<String>(moodType),
      'date': serializer.toJson<DateTime>(date),
      'note': serializer.toJson<String?>(note),
      'tags': serializer.toJson<String>(tags),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  Mood copyWith(
          {String? id,
          String? moodType,
          DateTime? date,
          Value<String?> note = const Value.absent(),
          String? tags,
          DateTime? createdAt}) =>
      Mood(
        id: id ?? this.id,
        moodType: moodType ?? this.moodType,
        date: date ?? this.date,
        note: note.present ? note.value : this.note,
        tags: tags ?? this.tags,
        createdAt: createdAt ?? this.createdAt,
      );
  Mood copyWithCompanion(MoodsCompanion data) {
    return Mood(
      id: data.id.present ? data.id.value : this.id,
      moodType: data.moodType.present ? data.moodType.value : this.moodType,
      date: data.date.present ? data.date.value : this.date,
      note: data.note.present ? data.note.value : this.note,
      tags: data.tags.present ? data.tags.value : this.tags,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Mood(')
          ..write('id: $id, ')
          ..write('moodType: $moodType, ')
          ..write('date: $date, ')
          ..write('note: $note, ')
          ..write('tags: $tags, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, moodType, date, note, tags, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Mood &&
          other.id == this.id &&
          other.moodType == this.moodType &&
          other.date == this.date &&
          other.note == this.note &&
          other.tags == this.tags &&
          other.createdAt == this.createdAt);
}

class MoodsCompanion extends UpdateCompanion<Mood> {
  final Value<String> id;
  final Value<String> moodType;
  final Value<DateTime> date;
  final Value<String?> note;
  final Value<String> tags;
  final Value<DateTime> createdAt;
  final Value<int> rowid;
  const MoodsCompanion({
    this.id = const Value.absent(),
    this.moodType = const Value.absent(),
    this.date = const Value.absent(),
    this.note = const Value.absent(),
    this.tags = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  MoodsCompanion.insert({
    required String id,
    required String moodType,
    required DateTime date,
    this.note = const Value.absent(),
    this.tags = const Value.absent(),
    required DateTime createdAt,
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        moodType = Value(moodType),
        date = Value(date),
        createdAt = Value(createdAt);
  static Insertable<Mood> custom({
    Expression<String>? id,
    Expression<String>? moodType,
    Expression<DateTime>? date,
    Expression<String>? note,
    Expression<String>? tags,
    Expression<DateTime>? createdAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (moodType != null) 'mood_type': moodType,
      if (date != null) 'date': date,
      if (note != null) 'note': note,
      if (tags != null) 'tags': tags,
      if (createdAt != null) 'created_at': createdAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  MoodsCompanion copyWith(
      {Value<String>? id,
      Value<String>? moodType,
      Value<DateTime>? date,
      Value<String?>? note,
      Value<String>? tags,
      Value<DateTime>? createdAt,
      Value<int>? rowid}) {
    return MoodsCompanion(
      id: id ?? this.id,
      moodType: moodType ?? this.moodType,
      date: date ?? this.date,
      note: note ?? this.note,
      tags: tags ?? this.tags,
      createdAt: createdAt ?? this.createdAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (moodType.present) {
      map['mood_type'] = Variable<String>(moodType.value);
    }
    if (date.present) {
      map['date'] = Variable<DateTime>(date.value);
    }
    if (note.present) {
      map['note'] = Variable<String>(note.value);
    }
    if (tags.present) {
      map['tags'] = Variable<String>(tags.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MoodsCompanion(')
          ..write('id: $id, ')
          ..write('moodType: $moodType, ')
          ..write('date: $date, ')
          ..write('note: $note, ')
          ..write('tags: $tags, ')
          ..write('createdAt: $createdAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $UserSettingsTable extends UserSettings
    with TableInfo<$UserSettingsTable, UserSetting> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $UserSettingsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _themeModeMeta =
      const VerificationMeta('themeMode');
  @override
  late final GeneratedColumn<String> themeMode = GeneratedColumn<String>(
      'theme_mode', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant('system'));
  static const VerificationMeta _accentColorMeta =
      const VerificationMeta('accentColor');
  @override
  late final GeneratedColumn<String> accentColor = GeneratedColumn<String>(
      'accent_color', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant('blue'));
  static const VerificationMeta _notificationsEnabledMeta =
      const VerificationMeta('notificationsEnabled');
  @override
  late final GeneratedColumn<bool> notificationsEnabled = GeneratedColumn<bool>(
      'notifications_enabled', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("notifications_enabled" IN (0, 1))'),
      defaultValue: const Constant(true));
  static const VerificationMeta _biometricEnabledMeta =
      const VerificationMeta('biometricEnabled');
  @override
  late final GeneratedColumn<bool> biometricEnabled = GeneratedColumn<bool>(
      'biometric_enabled', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("biometric_enabled" IN (0, 1))'),
      defaultValue: const Constant(false));
  static const VerificationMeta _pinMeta = const VerificationMeta('pin');
  @override
  late final GeneratedColumn<String> pin = GeneratedColumn<String>(
      'pin', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _languageMeta =
      const VerificationMeta('language');
  @override
  late final GeneratedColumn<String> language = GeneratedColumn<String>(
      'language', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant('vi'));
  static const VerificationMeta _syncEnabledMeta =
      const VerificationMeta('syncEnabled');
  @override
  late final GeneratedColumn<bool> syncEnabled = GeneratedColumn<bool>(
      'sync_enabled', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("sync_enabled" IN (0, 1))'),
      defaultValue: const Constant(true));
  static const VerificationMeta _lastSyncTimeMeta =
      const VerificationMeta('lastSyncTime');
  @override
  late final GeneratedColumn<DateTime> lastSyncTime = GeneratedColumn<DateTime>(
      'last_sync_time', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        themeMode,
        accentColor,
        notificationsEnabled,
        biometricEnabled,
        pin,
        language,
        syncEnabled,
        lastSyncTime,
        createdAt,
        updatedAt
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'user_settings';
  @override
  VerificationContext validateIntegrity(Insertable<UserSetting> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('theme_mode')) {
      context.handle(_themeModeMeta,
          themeMode.isAcceptableOrUnknown(data['theme_mode']!, _themeModeMeta));
    }
    if (data.containsKey('accent_color')) {
      context.handle(
          _accentColorMeta,
          accentColor.isAcceptableOrUnknown(
              data['accent_color']!, _accentColorMeta));
    }
    if (data.containsKey('notifications_enabled')) {
      context.handle(
          _notificationsEnabledMeta,
          notificationsEnabled.isAcceptableOrUnknown(
              data['notifications_enabled']!, _notificationsEnabledMeta));
    }
    if (data.containsKey('biometric_enabled')) {
      context.handle(
          _biometricEnabledMeta,
          biometricEnabled.isAcceptableOrUnknown(
              data['biometric_enabled']!, _biometricEnabledMeta));
    }
    if (data.containsKey('pin')) {
      context.handle(
          _pinMeta, pin.isAcceptableOrUnknown(data['pin']!, _pinMeta));
    }
    if (data.containsKey('language')) {
      context.handle(_languageMeta,
          language.isAcceptableOrUnknown(data['language']!, _languageMeta));
    }
    if (data.containsKey('sync_enabled')) {
      context.handle(
          _syncEnabledMeta,
          syncEnabled.isAcceptableOrUnknown(
              data['sync_enabled']!, _syncEnabledMeta));
    }
    if (data.containsKey('last_sync_time')) {
      context.handle(
          _lastSyncTimeMeta,
          lastSyncTime.isAcceptableOrUnknown(
              data['last_sync_time']!, _lastSyncTimeMeta));
    } else if (isInserting) {
      context.missing(_lastSyncTimeMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  UserSetting map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return UserSetting(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      themeMode: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}theme_mode'])!,
      accentColor: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}accent_color'])!,
      notificationsEnabled: attachedDatabase.typeMapping.read(
          DriftSqlType.bool, data['${effectivePrefix}notifications_enabled'])!,
      biometricEnabled: attachedDatabase.typeMapping.read(
          DriftSqlType.bool, data['${effectivePrefix}biometric_enabled'])!,
      pin: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}pin']),
      language: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}language'])!,
      syncEnabled: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}sync_enabled'])!,
      lastSyncTime: attachedDatabase.typeMapping.read(
          DriftSqlType.dateTime, data['${effectivePrefix}last_sync_time'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at'])!,
    );
  }

  @override
  $UserSettingsTable createAlias(String alias) {
    return $UserSettingsTable(attachedDatabase, alias);
  }
}

class UserSetting extends DataClass implements Insertable<UserSetting> {
  final String id;
  final String themeMode;
  final String accentColor;
  final bool notificationsEnabled;
  final bool biometricEnabled;
  final String? pin;
  final String language;
  final bool syncEnabled;
  final DateTime lastSyncTime;
  final DateTime createdAt;
  final DateTime updatedAt;
  const UserSetting(
      {required this.id,
      required this.themeMode,
      required this.accentColor,
      required this.notificationsEnabled,
      required this.biometricEnabled,
      this.pin,
      required this.language,
      required this.syncEnabled,
      required this.lastSyncTime,
      required this.createdAt,
      required this.updatedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['theme_mode'] = Variable<String>(themeMode);
    map['accent_color'] = Variable<String>(accentColor);
    map['notifications_enabled'] = Variable<bool>(notificationsEnabled);
    map['biometric_enabled'] = Variable<bool>(biometricEnabled);
    if (!nullToAbsent || pin != null) {
      map['pin'] = Variable<String>(pin);
    }
    map['language'] = Variable<String>(language);
    map['sync_enabled'] = Variable<bool>(syncEnabled);
    map['last_sync_time'] = Variable<DateTime>(lastSyncTime);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  UserSettingsCompanion toCompanion(bool nullToAbsent) {
    return UserSettingsCompanion(
      id: Value(id),
      themeMode: Value(themeMode),
      accentColor: Value(accentColor),
      notificationsEnabled: Value(notificationsEnabled),
      biometricEnabled: Value(biometricEnabled),
      pin: pin == null && nullToAbsent ? const Value.absent() : Value(pin),
      language: Value(language),
      syncEnabled: Value(syncEnabled),
      lastSyncTime: Value(lastSyncTime),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory UserSetting.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return UserSetting(
      id: serializer.fromJson<String>(json['id']),
      themeMode: serializer.fromJson<String>(json['themeMode']),
      accentColor: serializer.fromJson<String>(json['accentColor']),
      notificationsEnabled:
          serializer.fromJson<bool>(json['notificationsEnabled']),
      biometricEnabled: serializer.fromJson<bool>(json['biometricEnabled']),
      pin: serializer.fromJson<String?>(json['pin']),
      language: serializer.fromJson<String>(json['language']),
      syncEnabled: serializer.fromJson<bool>(json['syncEnabled']),
      lastSyncTime: serializer.fromJson<DateTime>(json['lastSyncTime']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'themeMode': serializer.toJson<String>(themeMode),
      'accentColor': serializer.toJson<String>(accentColor),
      'notificationsEnabled': serializer.toJson<bool>(notificationsEnabled),
      'biometricEnabled': serializer.toJson<bool>(biometricEnabled),
      'pin': serializer.toJson<String?>(pin),
      'language': serializer.toJson<String>(language),
      'syncEnabled': serializer.toJson<bool>(syncEnabled),
      'lastSyncTime': serializer.toJson<DateTime>(lastSyncTime),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  UserSetting copyWith(
          {String? id,
          String? themeMode,
          String? accentColor,
          bool? notificationsEnabled,
          bool? biometricEnabled,
          Value<String?> pin = const Value.absent(),
          String? language,
          bool? syncEnabled,
          DateTime? lastSyncTime,
          DateTime? createdAt,
          DateTime? updatedAt}) =>
      UserSetting(
        id: id ?? this.id,
        themeMode: themeMode ?? this.themeMode,
        accentColor: accentColor ?? this.accentColor,
        notificationsEnabled: notificationsEnabled ?? this.notificationsEnabled,
        biometricEnabled: biometricEnabled ?? this.biometricEnabled,
        pin: pin.present ? pin.value : this.pin,
        language: language ?? this.language,
        syncEnabled: syncEnabled ?? this.syncEnabled,
        lastSyncTime: lastSyncTime ?? this.lastSyncTime,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );
  UserSetting copyWithCompanion(UserSettingsCompanion data) {
    return UserSetting(
      id: data.id.present ? data.id.value : this.id,
      themeMode: data.themeMode.present ? data.themeMode.value : this.themeMode,
      accentColor:
          data.accentColor.present ? data.accentColor.value : this.accentColor,
      notificationsEnabled: data.notificationsEnabled.present
          ? data.notificationsEnabled.value
          : this.notificationsEnabled,
      biometricEnabled: data.biometricEnabled.present
          ? data.biometricEnabled.value
          : this.biometricEnabled,
      pin: data.pin.present ? data.pin.value : this.pin,
      language: data.language.present ? data.language.value : this.language,
      syncEnabled:
          data.syncEnabled.present ? data.syncEnabled.value : this.syncEnabled,
      lastSyncTime: data.lastSyncTime.present
          ? data.lastSyncTime.value
          : this.lastSyncTime,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('UserSetting(')
          ..write('id: $id, ')
          ..write('themeMode: $themeMode, ')
          ..write('accentColor: $accentColor, ')
          ..write('notificationsEnabled: $notificationsEnabled, ')
          ..write('biometricEnabled: $biometricEnabled, ')
          ..write('pin: $pin, ')
          ..write('language: $language, ')
          ..write('syncEnabled: $syncEnabled, ')
          ..write('lastSyncTime: $lastSyncTime, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      themeMode,
      accentColor,
      notificationsEnabled,
      biometricEnabled,
      pin,
      language,
      syncEnabled,
      lastSyncTime,
      createdAt,
      updatedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is UserSetting &&
          other.id == this.id &&
          other.themeMode == this.themeMode &&
          other.accentColor == this.accentColor &&
          other.notificationsEnabled == this.notificationsEnabled &&
          other.biometricEnabled == this.biometricEnabled &&
          other.pin == this.pin &&
          other.language == this.language &&
          other.syncEnabled == this.syncEnabled &&
          other.lastSyncTime == this.lastSyncTime &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class UserSettingsCompanion extends UpdateCompanion<UserSetting> {
  final Value<String> id;
  final Value<String> themeMode;
  final Value<String> accentColor;
  final Value<bool> notificationsEnabled;
  final Value<bool> biometricEnabled;
  final Value<String?> pin;
  final Value<String> language;
  final Value<bool> syncEnabled;
  final Value<DateTime> lastSyncTime;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<int> rowid;
  const UserSettingsCompanion({
    this.id = const Value.absent(),
    this.themeMode = const Value.absent(),
    this.accentColor = const Value.absent(),
    this.notificationsEnabled = const Value.absent(),
    this.biometricEnabled = const Value.absent(),
    this.pin = const Value.absent(),
    this.language = const Value.absent(),
    this.syncEnabled = const Value.absent(),
    this.lastSyncTime = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  UserSettingsCompanion.insert({
    required String id,
    this.themeMode = const Value.absent(),
    this.accentColor = const Value.absent(),
    this.notificationsEnabled = const Value.absent(),
    this.biometricEnabled = const Value.absent(),
    this.pin = const Value.absent(),
    this.language = const Value.absent(),
    this.syncEnabled = const Value.absent(),
    required DateTime lastSyncTime,
    required DateTime createdAt,
    required DateTime updatedAt,
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        lastSyncTime = Value(lastSyncTime),
        createdAt = Value(createdAt),
        updatedAt = Value(updatedAt);
  static Insertable<UserSetting> custom({
    Expression<String>? id,
    Expression<String>? themeMode,
    Expression<String>? accentColor,
    Expression<bool>? notificationsEnabled,
    Expression<bool>? biometricEnabled,
    Expression<String>? pin,
    Expression<String>? language,
    Expression<bool>? syncEnabled,
    Expression<DateTime>? lastSyncTime,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (themeMode != null) 'theme_mode': themeMode,
      if (accentColor != null) 'accent_color': accentColor,
      if (notificationsEnabled != null)
        'notifications_enabled': notificationsEnabled,
      if (biometricEnabled != null) 'biometric_enabled': biometricEnabled,
      if (pin != null) 'pin': pin,
      if (language != null) 'language': language,
      if (syncEnabled != null) 'sync_enabled': syncEnabled,
      if (lastSyncTime != null) 'last_sync_time': lastSyncTime,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  UserSettingsCompanion copyWith(
      {Value<String>? id,
      Value<String>? themeMode,
      Value<String>? accentColor,
      Value<bool>? notificationsEnabled,
      Value<bool>? biometricEnabled,
      Value<String?>? pin,
      Value<String>? language,
      Value<bool>? syncEnabled,
      Value<DateTime>? lastSyncTime,
      Value<DateTime>? createdAt,
      Value<DateTime>? updatedAt,
      Value<int>? rowid}) {
    return UserSettingsCompanion(
      id: id ?? this.id,
      themeMode: themeMode ?? this.themeMode,
      accentColor: accentColor ?? this.accentColor,
      notificationsEnabled: notificationsEnabled ?? this.notificationsEnabled,
      biometricEnabled: biometricEnabled ?? this.biometricEnabled,
      pin: pin ?? this.pin,
      language: language ?? this.language,
      syncEnabled: syncEnabled ?? this.syncEnabled,
      lastSyncTime: lastSyncTime ?? this.lastSyncTime,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (themeMode.present) {
      map['theme_mode'] = Variable<String>(themeMode.value);
    }
    if (accentColor.present) {
      map['accent_color'] = Variable<String>(accentColor.value);
    }
    if (notificationsEnabled.present) {
      map['notifications_enabled'] = Variable<bool>(notificationsEnabled.value);
    }
    if (biometricEnabled.present) {
      map['biometric_enabled'] = Variable<bool>(biometricEnabled.value);
    }
    if (pin.present) {
      map['pin'] = Variable<String>(pin.value);
    }
    if (language.present) {
      map['language'] = Variable<String>(language.value);
    }
    if (syncEnabled.present) {
      map['sync_enabled'] = Variable<bool>(syncEnabled.value);
    }
    if (lastSyncTime.present) {
      map['last_sync_time'] = Variable<DateTime>(lastSyncTime.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UserSettingsCompanion(')
          ..write('id: $id, ')
          ..write('themeMode: $themeMode, ')
          ..write('accentColor: $accentColor, ')
          ..write('notificationsEnabled: $notificationsEnabled, ')
          ..write('biometricEnabled: $biometricEnabled, ')
          ..write('pin: $pin, ')
          ..write('language: $language, ')
          ..write('syncEnabled: $syncEnabled, ')
          ..write('lastSyncTime: $lastSyncTime, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $NotesTable notes = $NotesTable(this);
  late final $HolidaysTable holidays = $HolidaysTable(this);
  late final $MoodsTable moods = $MoodsTable(this);
  late final $UserSettingsTable userSettings = $UserSettingsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [notes, holidays, moods, userSettings];
}

typedef $$NotesTableCreateCompanionBuilder = NotesCompanion Function({
  required String id,
  required String title,
  required String content,
  required DateTime date,
  Value<DateTime?> startTime,
  Value<DateTime?> endTime,
  Value<bool> hasReminder,
  Value<DateTime?> reminderTime,
  Value<String> repeatType,
  Value<String> priority,
  Value<String?> mood,
  Value<int> color,
  Value<String> tags,
  Value<String> checklist,
  Value<String> attachments,
  Value<String?> voiceNotePath,
  Value<String?> location,
  Value<bool> isPinned,
  Value<bool> isArchived,
  required DateTime createdAt,
  required DateTime updatedAt,
  Value<int> rowid,
});
typedef $$NotesTableUpdateCompanionBuilder = NotesCompanion Function({
  Value<String> id,
  Value<String> title,
  Value<String> content,
  Value<DateTime> date,
  Value<DateTime?> startTime,
  Value<DateTime?> endTime,
  Value<bool> hasReminder,
  Value<DateTime?> reminderTime,
  Value<String> repeatType,
  Value<String> priority,
  Value<String?> mood,
  Value<int> color,
  Value<String> tags,
  Value<String> checklist,
  Value<String> attachments,
  Value<String?> voiceNotePath,
  Value<String?> location,
  Value<bool> isPinned,
  Value<bool> isArchived,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
  Value<int> rowid,
});

class $$NotesTableTableManager extends RootTableManager<
    _$AppDatabase,
    $NotesTable,
    Note,
    $$NotesTableFilterComposer,
    $$NotesTableOrderingComposer,
    $$NotesTableCreateCompanionBuilder,
    $$NotesTableUpdateCompanionBuilder> {
  $$NotesTableTableManager(_$AppDatabase db, $NotesTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$NotesTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$NotesTableOrderingComposer(ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> title = const Value.absent(),
            Value<String> content = const Value.absent(),
            Value<DateTime> date = const Value.absent(),
            Value<DateTime?> startTime = const Value.absent(),
            Value<DateTime?> endTime = const Value.absent(),
            Value<bool> hasReminder = const Value.absent(),
            Value<DateTime?> reminderTime = const Value.absent(),
            Value<String> repeatType = const Value.absent(),
            Value<String> priority = const Value.absent(),
            Value<String?> mood = const Value.absent(),
            Value<int> color = const Value.absent(),
            Value<String> tags = const Value.absent(),
            Value<String> checklist = const Value.absent(),
            Value<String> attachments = const Value.absent(),
            Value<String?> voiceNotePath = const Value.absent(),
            Value<String?> location = const Value.absent(),
            Value<bool> isPinned = const Value.absent(),
            Value<bool> isArchived = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              NotesCompanion(
            id: id,
            title: title,
            content: content,
            date: date,
            startTime: startTime,
            endTime: endTime,
            hasReminder: hasReminder,
            reminderTime: reminderTime,
            repeatType: repeatType,
            priority: priority,
            mood: mood,
            color: color,
            tags: tags,
            checklist: checklist,
            attachments: attachments,
            voiceNotePath: voiceNotePath,
            location: location,
            isPinned: isPinned,
            isArchived: isArchived,
            createdAt: createdAt,
            updatedAt: updatedAt,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String title,
            required String content,
            required DateTime date,
            Value<DateTime?> startTime = const Value.absent(),
            Value<DateTime?> endTime = const Value.absent(),
            Value<bool> hasReminder = const Value.absent(),
            Value<DateTime?> reminderTime = const Value.absent(),
            Value<String> repeatType = const Value.absent(),
            Value<String> priority = const Value.absent(),
            Value<String?> mood = const Value.absent(),
            Value<int> color = const Value.absent(),
            Value<String> tags = const Value.absent(),
            Value<String> checklist = const Value.absent(),
            Value<String> attachments = const Value.absent(),
            Value<String?> voiceNotePath = const Value.absent(),
            Value<String?> location = const Value.absent(),
            Value<bool> isPinned = const Value.absent(),
            Value<bool> isArchived = const Value.absent(),
            required DateTime createdAt,
            required DateTime updatedAt,
            Value<int> rowid = const Value.absent(),
          }) =>
              NotesCompanion.insert(
            id: id,
            title: title,
            content: content,
            date: date,
            startTime: startTime,
            endTime: endTime,
            hasReminder: hasReminder,
            reminderTime: reminderTime,
            repeatType: repeatType,
            priority: priority,
            mood: mood,
            color: color,
            tags: tags,
            checklist: checklist,
            attachments: attachments,
            voiceNotePath: voiceNotePath,
            location: location,
            isPinned: isPinned,
            isArchived: isArchived,
            createdAt: createdAt,
            updatedAt: updatedAt,
            rowid: rowid,
          ),
        ));
}

class $$NotesTableFilterComposer
    extends FilterComposer<_$AppDatabase, $NotesTable> {
  $$NotesTableFilterComposer(super.$state);
  ColumnFilters<String> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get title => $state.composableBuilder(
      column: $state.table.title,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get content => $state.composableBuilder(
      column: $state.table.content,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get date => $state.composableBuilder(
      column: $state.table.date,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get startTime => $state.composableBuilder(
      column: $state.table.startTime,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get endTime => $state.composableBuilder(
      column: $state.table.endTime,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<bool> get hasReminder => $state.composableBuilder(
      column: $state.table.hasReminder,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get reminderTime => $state.composableBuilder(
      column: $state.table.reminderTime,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get repeatType => $state.composableBuilder(
      column: $state.table.repeatType,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get priority => $state.composableBuilder(
      column: $state.table.priority,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get mood => $state.composableBuilder(
      column: $state.table.mood,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get color => $state.composableBuilder(
      column: $state.table.color,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get tags => $state.composableBuilder(
      column: $state.table.tags,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get checklist => $state.composableBuilder(
      column: $state.table.checklist,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get attachments => $state.composableBuilder(
      column: $state.table.attachments,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get voiceNotePath => $state.composableBuilder(
      column: $state.table.voiceNotePath,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get location => $state.composableBuilder(
      column: $state.table.location,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<bool> get isPinned => $state.composableBuilder(
      column: $state.table.isPinned,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<bool> get isArchived => $state.composableBuilder(
      column: $state.table.isArchived,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get createdAt => $state.composableBuilder(
      column: $state.table.createdAt,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get updatedAt => $state.composableBuilder(
      column: $state.table.updatedAt,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));
}

class $$NotesTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $NotesTable> {
  $$NotesTableOrderingComposer(super.$state);
  ColumnOrderings<String> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get title => $state.composableBuilder(
      column: $state.table.title,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get content => $state.composableBuilder(
      column: $state.table.content,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get date => $state.composableBuilder(
      column: $state.table.date,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get startTime => $state.composableBuilder(
      column: $state.table.startTime,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get endTime => $state.composableBuilder(
      column: $state.table.endTime,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<bool> get hasReminder => $state.composableBuilder(
      column: $state.table.hasReminder,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get reminderTime => $state.composableBuilder(
      column: $state.table.reminderTime,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get repeatType => $state.composableBuilder(
      column: $state.table.repeatType,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get priority => $state.composableBuilder(
      column: $state.table.priority,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get mood => $state.composableBuilder(
      column: $state.table.mood,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get color => $state.composableBuilder(
      column: $state.table.color,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get tags => $state.composableBuilder(
      column: $state.table.tags,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get checklist => $state.composableBuilder(
      column: $state.table.checklist,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get attachments => $state.composableBuilder(
      column: $state.table.attachments,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get voiceNotePath => $state.composableBuilder(
      column: $state.table.voiceNotePath,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get location => $state.composableBuilder(
      column: $state.table.location,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<bool> get isPinned => $state.composableBuilder(
      column: $state.table.isPinned,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<bool> get isArchived => $state.composableBuilder(
      column: $state.table.isArchived,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get createdAt => $state.composableBuilder(
      column: $state.table.createdAt,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get updatedAt => $state.composableBuilder(
      column: $state.table.updatedAt,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

typedef $$HolidaysTableCreateCompanionBuilder = HolidaysCompanion Function({
  required String id,
  required String title,
  required DateTime date,
  required String type,
  required int color,
  required String shortDescription,
  required String longDescription,
  Value<String?> imageUrl,
  required bool isHoliday,
  required bool isLunarDate,
  Value<String?> quote,
  Value<DateTime?> endDate,
  Value<String> tags,
  Value<int> rowid,
});
typedef $$HolidaysTableUpdateCompanionBuilder = HolidaysCompanion Function({
  Value<String> id,
  Value<String> title,
  Value<DateTime> date,
  Value<String> type,
  Value<int> color,
  Value<String> shortDescription,
  Value<String> longDescription,
  Value<String?> imageUrl,
  Value<bool> isHoliday,
  Value<bool> isLunarDate,
  Value<String?> quote,
  Value<DateTime?> endDate,
  Value<String> tags,
  Value<int> rowid,
});

class $$HolidaysTableTableManager extends RootTableManager<
    _$AppDatabase,
    $HolidaysTable,
    Holiday,
    $$HolidaysTableFilterComposer,
    $$HolidaysTableOrderingComposer,
    $$HolidaysTableCreateCompanionBuilder,
    $$HolidaysTableUpdateCompanionBuilder> {
  $$HolidaysTableTableManager(_$AppDatabase db, $HolidaysTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$HolidaysTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$HolidaysTableOrderingComposer(ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> title = const Value.absent(),
            Value<DateTime> date = const Value.absent(),
            Value<String> type = const Value.absent(),
            Value<int> color = const Value.absent(),
            Value<String> shortDescription = const Value.absent(),
            Value<String> longDescription = const Value.absent(),
            Value<String?> imageUrl = const Value.absent(),
            Value<bool> isHoliday = const Value.absent(),
            Value<bool> isLunarDate = const Value.absent(),
            Value<String?> quote = const Value.absent(),
            Value<DateTime?> endDate = const Value.absent(),
            Value<String> tags = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              HolidaysCompanion(
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
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String title,
            required DateTime date,
            required String type,
            required int color,
            required String shortDescription,
            required String longDescription,
            Value<String?> imageUrl = const Value.absent(),
            required bool isHoliday,
            required bool isLunarDate,
            Value<String?> quote = const Value.absent(),
            Value<DateTime?> endDate = const Value.absent(),
            Value<String> tags = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              HolidaysCompanion.insert(
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
            rowid: rowid,
          ),
        ));
}

class $$HolidaysTableFilterComposer
    extends FilterComposer<_$AppDatabase, $HolidaysTable> {
  $$HolidaysTableFilterComposer(super.$state);
  ColumnFilters<String> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get title => $state.composableBuilder(
      column: $state.table.title,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get date => $state.composableBuilder(
      column: $state.table.date,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get type => $state.composableBuilder(
      column: $state.table.type,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get color => $state.composableBuilder(
      column: $state.table.color,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get shortDescription => $state.composableBuilder(
      column: $state.table.shortDescription,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get longDescription => $state.composableBuilder(
      column: $state.table.longDescription,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get imageUrl => $state.composableBuilder(
      column: $state.table.imageUrl,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<bool> get isHoliday => $state.composableBuilder(
      column: $state.table.isHoliday,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<bool> get isLunarDate => $state.composableBuilder(
      column: $state.table.isLunarDate,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get quote => $state.composableBuilder(
      column: $state.table.quote,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get endDate => $state.composableBuilder(
      column: $state.table.endDate,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get tags => $state.composableBuilder(
      column: $state.table.tags,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));
}

class $$HolidaysTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $HolidaysTable> {
  $$HolidaysTableOrderingComposer(super.$state);
  ColumnOrderings<String> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get title => $state.composableBuilder(
      column: $state.table.title,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get date => $state.composableBuilder(
      column: $state.table.date,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get type => $state.composableBuilder(
      column: $state.table.type,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get color => $state.composableBuilder(
      column: $state.table.color,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get shortDescription => $state.composableBuilder(
      column: $state.table.shortDescription,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get longDescription => $state.composableBuilder(
      column: $state.table.longDescription,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get imageUrl => $state.composableBuilder(
      column: $state.table.imageUrl,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<bool> get isHoliday => $state.composableBuilder(
      column: $state.table.isHoliday,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<bool> get isLunarDate => $state.composableBuilder(
      column: $state.table.isLunarDate,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get quote => $state.composableBuilder(
      column: $state.table.quote,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get endDate => $state.composableBuilder(
      column: $state.table.endDate,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get tags => $state.composableBuilder(
      column: $state.table.tags,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

typedef $$MoodsTableCreateCompanionBuilder = MoodsCompanion Function({
  required String id,
  required String moodType,
  required DateTime date,
  Value<String?> note,
  Value<String> tags,
  required DateTime createdAt,
  Value<int> rowid,
});
typedef $$MoodsTableUpdateCompanionBuilder = MoodsCompanion Function({
  Value<String> id,
  Value<String> moodType,
  Value<DateTime> date,
  Value<String?> note,
  Value<String> tags,
  Value<DateTime> createdAt,
  Value<int> rowid,
});

class $$MoodsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $MoodsTable,
    Mood,
    $$MoodsTableFilterComposer,
    $$MoodsTableOrderingComposer,
    $$MoodsTableCreateCompanionBuilder,
    $$MoodsTableUpdateCompanionBuilder> {
  $$MoodsTableTableManager(_$AppDatabase db, $MoodsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$MoodsTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$MoodsTableOrderingComposer(ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> moodType = const Value.absent(),
            Value<DateTime> date = const Value.absent(),
            Value<String?> note = const Value.absent(),
            Value<String> tags = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              MoodsCompanion(
            id: id,
            moodType: moodType,
            date: date,
            note: note,
            tags: tags,
            createdAt: createdAt,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String moodType,
            required DateTime date,
            Value<String?> note = const Value.absent(),
            Value<String> tags = const Value.absent(),
            required DateTime createdAt,
            Value<int> rowid = const Value.absent(),
          }) =>
              MoodsCompanion.insert(
            id: id,
            moodType: moodType,
            date: date,
            note: note,
            tags: tags,
            createdAt: createdAt,
            rowid: rowid,
          ),
        ));
}

class $$MoodsTableFilterComposer
    extends FilterComposer<_$AppDatabase, $MoodsTable> {
  $$MoodsTableFilterComposer(super.$state);
  ColumnFilters<String> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get moodType => $state.composableBuilder(
      column: $state.table.moodType,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get date => $state.composableBuilder(
      column: $state.table.date,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get note => $state.composableBuilder(
      column: $state.table.note,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get tags => $state.composableBuilder(
      column: $state.table.tags,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get createdAt => $state.composableBuilder(
      column: $state.table.createdAt,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));
}

class $$MoodsTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $MoodsTable> {
  $$MoodsTableOrderingComposer(super.$state);
  ColumnOrderings<String> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get moodType => $state.composableBuilder(
      column: $state.table.moodType,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get date => $state.composableBuilder(
      column: $state.table.date,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get note => $state.composableBuilder(
      column: $state.table.note,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get tags => $state.composableBuilder(
      column: $state.table.tags,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get createdAt => $state.composableBuilder(
      column: $state.table.createdAt,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

typedef $$UserSettingsTableCreateCompanionBuilder = UserSettingsCompanion
    Function({
  required String id,
  Value<String> themeMode,
  Value<String> accentColor,
  Value<bool> notificationsEnabled,
  Value<bool> biometricEnabled,
  Value<String?> pin,
  Value<String> language,
  Value<bool> syncEnabled,
  required DateTime lastSyncTime,
  required DateTime createdAt,
  required DateTime updatedAt,
  Value<int> rowid,
});
typedef $$UserSettingsTableUpdateCompanionBuilder = UserSettingsCompanion
    Function({
  Value<String> id,
  Value<String> themeMode,
  Value<String> accentColor,
  Value<bool> notificationsEnabled,
  Value<bool> biometricEnabled,
  Value<String?> pin,
  Value<String> language,
  Value<bool> syncEnabled,
  Value<DateTime> lastSyncTime,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
  Value<int> rowid,
});

class $$UserSettingsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $UserSettingsTable,
    UserSetting,
    $$UserSettingsTableFilterComposer,
    $$UserSettingsTableOrderingComposer,
    $$UserSettingsTableCreateCompanionBuilder,
    $$UserSettingsTableUpdateCompanionBuilder> {
  $$UserSettingsTableTableManager(_$AppDatabase db, $UserSettingsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$UserSettingsTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$UserSettingsTableOrderingComposer(ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> themeMode = const Value.absent(),
            Value<String> accentColor = const Value.absent(),
            Value<bool> notificationsEnabled = const Value.absent(),
            Value<bool> biometricEnabled = const Value.absent(),
            Value<String?> pin = const Value.absent(),
            Value<String> language = const Value.absent(),
            Value<bool> syncEnabled = const Value.absent(),
            Value<DateTime> lastSyncTime = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              UserSettingsCompanion(
            id: id,
            themeMode: themeMode,
            accentColor: accentColor,
            notificationsEnabled: notificationsEnabled,
            biometricEnabled: biometricEnabled,
            pin: pin,
            language: language,
            syncEnabled: syncEnabled,
            lastSyncTime: lastSyncTime,
            createdAt: createdAt,
            updatedAt: updatedAt,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            Value<String> themeMode = const Value.absent(),
            Value<String> accentColor = const Value.absent(),
            Value<bool> notificationsEnabled = const Value.absent(),
            Value<bool> biometricEnabled = const Value.absent(),
            Value<String?> pin = const Value.absent(),
            Value<String> language = const Value.absent(),
            Value<bool> syncEnabled = const Value.absent(),
            required DateTime lastSyncTime,
            required DateTime createdAt,
            required DateTime updatedAt,
            Value<int> rowid = const Value.absent(),
          }) =>
              UserSettingsCompanion.insert(
            id: id,
            themeMode: themeMode,
            accentColor: accentColor,
            notificationsEnabled: notificationsEnabled,
            biometricEnabled: biometricEnabled,
            pin: pin,
            language: language,
            syncEnabled: syncEnabled,
            lastSyncTime: lastSyncTime,
            createdAt: createdAt,
            updatedAt: updatedAt,
            rowid: rowid,
          ),
        ));
}

class $$UserSettingsTableFilterComposer
    extends FilterComposer<_$AppDatabase, $UserSettingsTable> {
  $$UserSettingsTableFilterComposer(super.$state);
  ColumnFilters<String> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get themeMode => $state.composableBuilder(
      column: $state.table.themeMode,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get accentColor => $state.composableBuilder(
      column: $state.table.accentColor,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<bool> get notificationsEnabled => $state.composableBuilder(
      column: $state.table.notificationsEnabled,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<bool> get biometricEnabled => $state.composableBuilder(
      column: $state.table.biometricEnabled,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get pin => $state.composableBuilder(
      column: $state.table.pin,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get language => $state.composableBuilder(
      column: $state.table.language,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<bool> get syncEnabled => $state.composableBuilder(
      column: $state.table.syncEnabled,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get lastSyncTime => $state.composableBuilder(
      column: $state.table.lastSyncTime,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get createdAt => $state.composableBuilder(
      column: $state.table.createdAt,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get updatedAt => $state.composableBuilder(
      column: $state.table.updatedAt,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));
}

class $$UserSettingsTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $UserSettingsTable> {
  $$UserSettingsTableOrderingComposer(super.$state);
  ColumnOrderings<String> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get themeMode => $state.composableBuilder(
      column: $state.table.themeMode,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get accentColor => $state.composableBuilder(
      column: $state.table.accentColor,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<bool> get notificationsEnabled => $state.composableBuilder(
      column: $state.table.notificationsEnabled,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<bool> get biometricEnabled => $state.composableBuilder(
      column: $state.table.biometricEnabled,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get pin => $state.composableBuilder(
      column: $state.table.pin,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get language => $state.composableBuilder(
      column: $state.table.language,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<bool> get syncEnabled => $state.composableBuilder(
      column: $state.table.syncEnabled,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get lastSyncTime => $state.composableBuilder(
      column: $state.table.lastSyncTime,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get createdAt => $state.composableBuilder(
      column: $state.table.createdAt,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get updatedAt => $state.composableBuilder(
      column: $state.table.updatedAt,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$NotesTableTableManager get notes =>
      $$NotesTableTableManager(_db, _db.notes);
  $$HolidaysTableTableManager get holidays =>
      $$HolidaysTableTableManager(_db, _db.holidays);
  $$MoodsTableTableManager get moods =>
      $$MoodsTableTableManager(_db, _db.moods);
  $$UserSettingsTableTableManager get userSettings =>
      $$UserSettingsTableTableManager(_db, _db.userSettings);
}
