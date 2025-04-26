import 'package:demo/dummy_data.dart';
import 'package:demo/models/resource.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

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
      // Convert dummy data to Resource objects
      final resources = DummyData.resources
          .map((resourceData) => Resource(
                id: resourceData['id'],
                title: resourceData['title'],
                description: resourceData['description'],
                fileUrl: resourceData['url'],
                resourceType: resourceData['type'],
                uploaderId: 'system',
                uploadDate: DateTime.now()
                    .subtract(Duration(days: int.parse(resourceData['id']))),
              ))
          .toList();
      emit(ResourcesLoaded(resources));
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
