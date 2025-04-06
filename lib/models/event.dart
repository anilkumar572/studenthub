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
  final String imageUrl;
  final String category;

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
    required this.imageUrl,
    required this.category,
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
      ];
}
