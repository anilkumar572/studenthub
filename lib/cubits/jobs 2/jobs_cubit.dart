import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import '../../models/job.dart';

// Events
abstract class JobsEvent extends Equatable {
  const JobsEvent();

  @override
  List<Object?> get props => [];
}

class LoadJobs extends JobsEvent {}

class AddJob extends JobsEvent {
  final Job job;

  const AddJob(this.job);

  @override
  List<Object?> get props => [job];
}

// States
abstract class JobsState extends Equatable {
  const JobsState();

  @override
  List<Object?> get props => [];
}

class JobsInitial extends JobsState {}

class JobsLoading extends JobsState {}

class JobsLoaded extends JobsState {
  final List<Job> jobs;

  const JobsLoaded(this.jobs);

  @override
  List<Object?> get props => [jobs];
}

class JobsError extends JobsState {
  final String message;

  const JobsError(this.message);

  @override
  List<Object?> get props => [message];
}

// Cubit
class JobsCubit extends Cubit<JobsState> {
  JobsCubit() : super(JobsInitial());

  Future<void> loadJobs() async {
    try {
      emit(JobsLoading());
      // TODO: Replace with actual data fetching logic
      final mockJobs = [
        Job(
          id: '1',
          title: 'Software Engineer',
          company: 'Tech Corp',
          location: 'Remote',
          description: 'Looking for experienced software engineers',
          applicationUrl: 'https://example.com/job1',
          postedDate: DateTime(2024, 3, 1),
          requirements: const ['3+ years experience', 'Python', 'Django'],
          type: 'Full-time',
          salary: '\$120,000 - \$150,000',
          category: 'Software Development',
        ),
        Job(
          id: '2',
          title: 'Data Scientist',
          company: 'Data Inc',
          location: 'New York',
          description: 'Join our data science team',
          applicationUrl: 'https://example.com/job2',
          postedDate: DateTime(2024, 3, 15),
          requirements: const ['Machine Learning', 'Python', 'SQL'],
          type: 'Full-time',
          salary: '\$130,000 - \$160,000',
          category: 'Data Science',
        ),
      ];
      emit(JobsLoaded(mockJobs));
    } catch (e) {
      emit(JobsError(e.toString()));
    }
  }

  Future<void> addJob(Job job) async {
    try {
      emit(JobsLoading());
      // TODO: Implement actual job posting logic
      if (state is JobsLoaded) {
        final currentJobs = (state as JobsLoaded).jobs;
        emit(JobsLoaded([...currentJobs, job]));
      }
    } catch (e) {
      emit(JobsError(e.toString()));
    }
  }
}
