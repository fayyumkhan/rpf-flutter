import 'dart:convert';

import '../config/app_config.dart';

class UserProfile {
  final int? id;
  final String? name;
  final String? designation;
  final String? photoUrl;
  final String? role;

  const UserProfile({
    this.id,
    this.name,
    this.designation,
    this.photoUrl,
    this.role,
  });

  bool get hasPhoto => (photoUrl ?? '').trim().isNotEmpty;

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'designation': designation,
        'photo_url': photoUrl,
        'role': role,
      };

  factory UserProfile.fromJson(Map<String, dynamic> json) {
    final roleRaw = json['role'];
    final roleName = roleRaw is Map
        ? (roleRaw['name'] ?? roleRaw['role_name'])?.toString()
        : (json['role_name'] ?? json['rank_name'])?.toString();

    return UserProfile(
      id: (json['id'] as num?)?.toInt(),
      name: (json['name'] ??
              json['full_name'] ??
              json['employee_name'] ??
              json['display_name'])
          as String?,
      designation: (json['designation'] ??
              json['designation_name'] ??
              json['role_name'] ??
              json['rank_name'])
          as String?,
      photoUrl: _resolvePhotoUrl(json),
      role: roleName,
    );
  }

  static UserProfile? fromDynamic(dynamic raw) {
    if (raw is Map<String, dynamic>) {
      return UserProfile.fromJson(raw);
    }
    if (raw is Map) {
      return UserProfile.fromJson(raw.cast<String, dynamic>());
    }
    return null;
  }

  String toJsonString() => jsonEncode(toJson());

  factory UserProfile.fromJsonString(String? raw) {
    if (raw == null) throw Exception('Cannot decode null string');
    return UserProfile.fromJson(jsonDecode(raw) as Map<String, dynamic>);
  }

  UserProfile copyWith({
    int? id,
    String? name,
    String? designation,
    String? photoUrl,
    String? role,
  }) {
    return UserProfile(
      id: id ?? this.id,
      name: name ?? this.name,
      designation: designation ?? this.designation,
      photoUrl: photoUrl ?? this.photoUrl,
      role: role ?? this.role,
    );
  }

  @override
  String toString() =>
      'UserProfile(id: $id, name: $name, designation: $designation, role: $role)';
}

String? _resolvePhotoUrl(Map<String, dynamic> json) {
  final photoRaw = json['photo'] ??
      json['photo_url'] ??
      json['profile_photo'] ??
      json['avatar'] ??
      json['avatar_url'];

  if (photoRaw == null) return null;

  final url = photoRaw.toString().trim();
  if (url.isEmpty) return null;
  if (url.startsWith('http')) return url;

  return '${AppConfig.publicBaseUrl}/$url';
}
