import 'package:equatable/equatable.dart';

class Job extends Equatable {
  final String id;
  final String title;
  final String company;
  final String location;
  final String description;
  final String applyLink;
  final DateTime postedDate;
  final List<String> requirements;

  const Job({
    required this.id,
    required this.title,
    required this.company,
    required this.location,
    required this.description,
    required this.applyLink,
    required this.postedDate,
    required this.requirements,
  });

  @override
  List<Object?> get props => [
        id,
        title,
        company,
        location,
        description,
        applyLink,
        postedDate,
        requirements
      ];
}
