import 'package:demo/models/event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

// Events
abstract class EventsEvent extends Equatable {
  const EventsEvent();

  @override
  List<Object?> get props => [];
}

class LoadEvents extends EventsEvent {}

// States
abstract class EventsState extends Equatable {
  const EventsState();

  @override
  List<Object?> get props => [];
}

class EventsInitial extends EventsState {}

class EventsLoading extends EventsState {}

class EventsLoaded extends EventsState {
  final List<Event> events;

  const EventsLoaded(this.events);

  @override
  List<Object?> get props => [events];
}

class EventsError extends EventsState {
  final String message;

  const EventsError(this.message);

  @override
  List<Object?> get props => [message];
}

// Cubit
class EventsCubit extends Cubit<EventsState> {
  EventsCubit() : super(EventsInitial());

  Future<void> loadEvents() async {
    try {
      emit(EventsLoading());
      // TODO: Replace with actual data fetching logic
      final mockEvents = [
        Event(
          id: '1',
          name: 'Tech Conference 2024',
          title: 'Tech Conference 2024',
          description:
              'Annual technology conference featuring the latest innovations and networking opportunities',
          date: DateTime.now().add(const Duration(days: 7)),
          time: '10:00 AM',
          location: 'Main Auditorium',
          organizer: 'Tech Club',
          attendees: const [],
          imageUrl: 'https://example.com/tech_conference.jpg',
          category: 'Conference',
        ),
        Event(
          id: '2',
          name: 'Hackathon',
          title: '24-Hour Hackathon',
          description: 'Join us for an exciting 24-hour coding competition',
          date: DateTime.now().add(const Duration(days: 14)),
          time: '9:00 AM',
          location: 'Computer Lab',
          organizer: 'Coding Club',
          attendees: const [],
          imageUrl: 'https://example.com/hackathon.jpg',
          category: 'Competition',
        ),
      ];
      emit(EventsLoaded(mockEvents));
    } catch (e) {
      emit(EventsError(e.toString()));
    }
  }
}
