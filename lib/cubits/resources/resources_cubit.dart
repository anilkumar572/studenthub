import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import '../../models/resource.dart';

// Events
abstract class ResourcesEvent extends Equatable {
  const ResourcesEvent();

  @override
  List<Object?> get props => [];
}

class LoadResources extends ResourcesEvent {}

class UploadResource extends ResourcesEvent {
  final Resource resource;

  const UploadResource(this.resource);

  @override
  List<Object?> get props => [resource];
}

// States
abstract class ResourcesState extends Equatable {
  const ResourcesState();

  @override
  List<Object?> get props => [];
}

class ResourcesInitial extends ResourcesState {}

class ResourcesLoading extends ResourcesState {}

class ResourcesLoaded extends ResourcesState {
  final List<Resource> resources;

  const ResourcesLoaded(this.resources);

  @override
  List<Object?> get props => [resources];
}

class ResourcesError extends ResourcesState {
  final String message;

  const ResourcesError(this.message);

  @override
  List<Object?> get props => [message];
}

// Cubit
class ResourcesCubit extends Cubit<ResourcesState> {
  ResourcesCubit() : super(ResourcesInitial());

  Future<void> loadResources() async {
    try {
      emit(ResourcesLoading());
      // TODO: Replace with actual data fetching logic
      final mockResources = [
        Resource(
          id: '1',
          title: 'Data Structures Notes',
          description: 'Comprehensive notes on data structures',
          fileUrl: 'https://example.com/ds_notes.pdf',
          resourceType: 'PDF',
          uploaderId: 'user1',
          uploadDate: DateTime(2024, 1, 1),
        ),
        Resource(
          id: '2',
          title: 'Algorithms Tutorial',
          description: 'Step-by-step guide to algorithms',
          fileUrl: 'https://example.com/algo_tutorial.pdf',
          resourceType: 'PDF',
          uploaderId: 'user2',
          uploadDate: DateTime(2024, 2, 1),
        ),
      ];
      emit(ResourcesLoaded(mockResources));
    } catch (e) {
      emit(ResourcesError(e.toString()));
    }
  }

  Future<void> uploadResource(Resource resource) async {
    try {
      emit(ResourcesLoading());
      // TODO: Implement actual upload logic
      if (state is ResourcesLoaded) {
        final currentResources = (state as ResourcesLoaded).resources;
        emit(ResourcesLoaded([...currentResources, resource]));
      }
    } catch (e) {
      emit(ResourcesError(e.toString()));
    }
  }
}
