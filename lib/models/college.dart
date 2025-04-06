import 'package:equatable/equatable.dart';

class College extends Equatable {
  final String id;
  final String name;
  final String location;
  final List<String> courses;
  final String description;
  final String imageUrl;

  const College({
    required this.id,
    required this.name,
    required this.location,
    required this.courses,
    required this.description,
    required this.imageUrl,
  });

  @override
  List<Object?> get props => [
    id,
    name,
    location,
    courses,
    description,
    imageUrl,
  ];
}
