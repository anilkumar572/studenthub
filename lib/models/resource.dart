import 'package:equatable/equatable.dart';

class Resource {
  final String id;
  final String title;
  final String description;
  final String fileUrl;
  final String resourceType;
  final String uploaderId;
  final DateTime uploadDate;

  Resource({
    required this.id,
    required this.title,
    required this.description,
    required this.fileUrl,
    required this.resourceType,
    required this.uploaderId,
    required this.uploadDate,
  });

  factory Resource.fromMap(Map<String, dynamic> map) {
    return Resource(
      id: map['id'] ?? '',
      title: map['title'] ?? '',
      description: map['description'] ?? '',
      fileUrl: map['fileUrl'] ?? '',
      resourceType: map['resourceType'] ?? '',
      uploaderId: map['uploaderId'] ?? '',
      uploadDate: map['uploadDate'] != null
          ? DateTime.parse(map['uploadDate'])
          : DateTime.now(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'fileUrl': fileUrl,
      'resourceType': resourceType,
      'uploaderId': uploaderId,
      'uploadDate': uploadDate.toIso8601String(),
    };
  }

  Resource copyWith({
    String? id,
    String? title,
    String? description,
    String? fileUrl,
    String? resourceType,
    String? uploaderId,
    DateTime? uploadDate,
  }) {
    return Resource(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      fileUrl: fileUrl ?? this.fileUrl,
      resourceType: resourceType ?? this.resourceType,
      uploaderId: uploaderId ?? this.uploaderId,
      uploadDate: uploadDate ?? this.uploadDate,
    );
  }
}
