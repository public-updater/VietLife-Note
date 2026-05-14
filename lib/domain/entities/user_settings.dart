import 'package:equatable/equatable.dart';

class UserSettings extends Equatable {
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

  const UserSettings({
    required this.id,
    this.themeMode = 'system',
    this.accentColor = 'blue',
    this.notificationsEnabled = true,
    this.biometricEnabled = false,
    this.pin,
    this.language = 'vi',
    this.syncEnabled = true,
    required this.lastSyncTime,
    required this.createdAt,
    required this.updatedAt,
  });

  UserSettings copyWith({
    String? id,
    String? themeMode,
    String? accentColor,
    bool? notificationsEnabled,
    bool? biometricEnabled,
    String? pin,
    String? language,
    bool? syncEnabled,
    DateTime? lastSyncTime,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return UserSettings(
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
    );
  }

  @override
  List<Object?> get props => [
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
        updatedAt,
      ];
}
