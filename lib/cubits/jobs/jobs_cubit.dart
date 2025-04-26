import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import '../../models/job.dart';
import '../../dummy_data.dart';

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
      // Convert dummy data to Job objects
      final jobs = DummyData.jobs
          .map((jobData) => Job(
                id: jobData['id'] ?? '',
                title: jobData['title'] ?? '',
                company: jobData['company'] ?? '',
                location: jobData['location'] ?? '',
                description: jobData['description'] ?? '',
                category: jobData['category'] ?? 'Other',
                applicationUrl: jobData['applyLink'] ??
                    'https://example.com/apply/${jobData['id']}',
                postedDate: DateTime.now()
                    .subtract(Duration(days: int.parse(jobData['id'] ?? '1'))),
                requirements: List<String>.from(jobData['requirements'] ?? []),
                salary: jobData['salary'] ?? 'Not specified',
                type: jobData['type'] ?? 'Full-time',
              ))
          .toList();
      emit(JobsLoaded(jobs));
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
