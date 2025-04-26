import 'package:equatable/equatable.dart';

class RoadmapStep {
  final String title;
  final String description;
  final List<String> resources;
  final bool isCompleted;

  const RoadmapStep({
    required this.title,
    required this.description,
    required this.resources,
    this.isCompleted = false,
  });
}

class Roadmap extends Equatable {
  final String id;
  final String title;
  final String description;
  final String imageUrl;
  final String category;
  final int estimatedHours;
  final List<RoadmapStep> steps;
  final String difficulty;

  const Roadmap({
    required this.id,
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.category,
    required this.estimatedHours,
    required this.steps,
    required this.difficulty,
  });

  @override
  List<Object?> get props => [
        id,
        title,
        description,
        imageUrl,
        category,
        estimatedHours,
        steps,
        difficulty,
      ];

  factory Roadmap.fromJson(Map<String, dynamic> json) {
    return Roadmap(
      id: json['id'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      imageUrl: json['imageUrl'] as String,
      category: json['category'] as String,
      estimatedHours: json['estimatedHours'] as int,
      difficulty: json['difficulty'] as String,
      steps: (json['steps'] as List)
          .map((step) => RoadmapStep(
                title: step['title'] as String,
                description: step['description'] as String,
                resources: List<String>.from(step['resources'] as List),
                isCompleted: step['isCompleted'] as bool? ?? false,
              ))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'imageUrl': imageUrl,
      'category': category,
      'estimatedHours': estimatedHours,
      'difficulty': difficulty,
      'steps': steps
          .map((step) => {
                'title': step.title,
                'description': step.description,
                'resources': step.resources,
                'isCompleted': step.isCompleted,
              })
          .toList(),
    };
  }
}
