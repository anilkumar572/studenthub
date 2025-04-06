import 'package:equatable/equatable.dart';

class Resource extends Equatable {
  final String id;
  final String title;
  final String description;
  final String fileUrl;
  final String resourceType;
  final String uploaderId;
  final DateTime uploadDate;

  const Resource({
    required this.id,
    required this.title,
    required this.description,
    required this.fileUrl,
    required this.resourceType,
    required this.uploaderId,
    required this.uploadDate,
  });

  @override
  List<Object?> get props =>
      [id, title, description, fileUrl, resourceType, uploaderId, uploadDate];
}
