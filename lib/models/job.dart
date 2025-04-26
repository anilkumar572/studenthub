import 'package:equatable/equatable.dart';

class Job extends Equatable {
  final String id;
  final String title;
  final String company;
  final String location;
  final String type;
  final String description;
  final String salary;
  final String category;
  final List<String> requirements;
  final String applicationUrl;
  final DateTime postedDate;
  final String? imageUrl;

  const Job({
    required this.id,
    required this.title,
    required this.company,
    required this.location,
    required this.type,
    required this.description,
    required this.salary,
    required this.category,
    required this.requirements,
    required this.applicationUrl,
    required this.postedDate,
    this.imageUrl,
  });

  @override
  List<Object?> get props => [
        id,
        title,
        company,
        location,
        type,
        description,
        salary,
        category,
        requirements,
        applicationUrl,
        postedDate,
        imageUrl
      ];

  factory Job.fromJson(Map<String, dynamic> json) {
    return Job(
      id: json['id'] as String,
      title: json['title'] as String,
      company: json['company'] as String,
      location: json['location'] as String,
      type: json['type'] as String,
      description: json['description'] as String,
      salary: json['salary'] as String,
      category: json['category'] as String,
      requirements: List<String>.from(json['requirements'] as List),
      applicationUrl: json['applicationUrl'] as String,
      postedDate: DateTime.parse(json['postedDate'] as String),
      imageUrl: json['imageUrl'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'company': company,
      'location': location,
      'type': type,
      'description': description,
      'salary': salary,
      'category': category,
      'requirements': requirements,
      'applicationUrl': applicationUrl,
      'postedDate': postedDate.toIso8601String(),
      'imageUrl': imageUrl,
    };
  }
}
