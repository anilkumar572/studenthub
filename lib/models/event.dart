import 'package:equatable/equatable.dart';

class Event extends Equatable {
  final String id;
  final String name;
  final String title;
  final String description;
  final DateTime date;
  final String time;
  final String location;
  final String organizer;
  final List<String> attendees;
  final String? imageUrl;
  final String category;
  final String? registrationUrl;

  const Event({
    required this.id,
    required this.name,
    required this.title,
    required this.description,
    required this.date,
    required this.time,
    required this.location,
    required this.organizer,
    required this.attendees,
    this.imageUrl,
    required this.category,
    this.registrationUrl,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        title,
        description,
        date,
        time,
        location,
        organizer,
        attendees,
        imageUrl,
        category,
        registrationUrl,
      ];

  factory Event.fromJson(Map<String, dynamic> json) {
    return Event(
      id: json['id'] as String,
      name: json['name'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      date: DateTime.parse(json['date'] as String),
      time: json['time'] as String,
      location: json['location'] as String,
      organizer: json['organizer'] as String,
      attendees: List<String>.from(json['attendees'] as List),
      imageUrl: json['imageUrl'] as String?,
      category: json['category'] as String,
      registrationUrl: json['registrationUrl'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'title': title,
      'description': description,
      'date': date.toIso8601String(),
      'time': time,
      'location': location,
      'organizer': organizer,
      'attendees': attendees,
      'imageUrl': imageUrl,
      'category': category,
      'registrationUrl': registrationUrl,
    };
  }
}
