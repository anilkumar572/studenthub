import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import '../../models/college.dart';

// Events
abstract class CollegesEvent extends Equatable {
  const CollegesEvent();

  @override
  List<Object?> get props => [];
}

class LoadColleges extends CollegesEvent {}

// States
abstract class CollegesState extends Equatable {
  const CollegesState();

  @override
  List<Object?> get props => [];
}

class CollegesInitial extends CollegesState {}

class CollegesLoading extends CollegesState {}

class CollegesLoaded extends CollegesState {
  final List<College> colleges;

  const CollegesLoaded(this.colleges);

  @override
  List<Object?> get props => [colleges];
}

class CollegesError extends CollegesState {
  final String message;

  const CollegesError(this.message);

  @override
  List<Object?> get props => [message];
}

// Cubit
class CollegesCubit extends Cubit<CollegesState> {
  CollegesCubit() : super(CollegesInitial());

  Future<void> loadColleges() async {
    try {
      emit(CollegesLoading());
      // TODO: Replace with actual data fetching logic
      final mockColleges = [
        const College(
          id: '1',
          name: 'Engineering College A',
          location: 'City A',
          courses: ['Computer Science', 'Mechanical', 'Electrical'],
          description: 'A premier engineering college',
          imageUrl: 'https://example.com/college1.jpg',
        ),
        const College(
          id: '2',
          name: 'Engineering College B',
          location: 'City B',
          courses: ['Civil', 'Chemical', 'Aerospace'],
          description: 'Leading in research and innovation',
          imageUrl: 'https://example.com/college2.jpg',
        ),
      ];
      emit(CollegesLoaded(mockColleges));
    } catch (e) {
      emit(CollegesError(e.toString()));
    }
  }
}
