import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubits/resources/resources_cubit.dart';
import '../models/resource.dart';

class ResourcesScreen extends StatelessWidget {
  const ResourcesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar.medium(
            title: const Text('Study Resources'),
            actions: [
              IconButton(
                icon: const Icon(Icons.search_rounded),
                onPressed: () {
                  // TODO: Implement search
                },
              ),
              IconButton(
                icon: const Icon(Icons.add_rounded),
                onPressed: () {
                  // TODO: Implement resource upload
                },
              ),
            ],
          ),
          BlocBuilder<ResourcesCubit, ResourcesState>(
            builder: (context, state) {
              if (state is ResourcesInitial) {
                context.read<ResourcesCubit>().loadResources();
                return const SliverFillRemaining(
                  child: Center(child: CircularProgressIndicator()),
                );
              }

              if (state is ResourcesLoading) {
                return const SliverFillRemaining(
                  child: Center(child: CircularProgressIndicator()),
                );
              }

              if (state is ResourcesError) {
                return SliverFillRemaining(
                  child: Center(child: Text('Error: ${state.message}')),
                );
              }

              if (state is ResourcesLoaded) {
                return _buildResourcesList(context, state.resources);
              }

              return const SliverFillRemaining(
                child: Center(child: Text('Unknown state')),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildResourcesList(BuildContext context, List<Resource> resources) {
    if (resources.isEmpty) {
      return const SliverFillRemaining(
        child: Center(
          child: Text('No resources found'),
        ),
      );
    }

    return SliverPadding(
      padding: const EdgeInsets.all(16.0),
      sliver: SliverList(
        delegate: SliverChildBuilderDelegate(
          (context, index) {
            final resource = resources[index];
            return Padding(
              padding: const EdgeInsets.only(bottom: 16.0),
              child: _buildResourceCard(context, resource),
            );
          },
          childCount: resources.length,
        ),
      ),
    );
  }

  Widget _buildResourceCard(BuildContext context, Resource resource) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    IconData resourceIcon;
    Color resourceColor;

    switch (resource.resourceType.toLowerCase()) {
      case 'pdf':
        resourceIcon = Icons.picture_as_pdf_rounded;
        resourceColor = colorScheme.error;
        break;
      case 'video':
        resourceIcon = Icons.play_circle_rounded;
        resourceColor = colorScheme.tertiary;
        break;
      case 'document':
        resourceIcon = Icons.article_rounded;
        resourceColor = colorScheme.primary;
        break;
      default:
        resourceIcon = Icons.insert_drive_file_rounded;
        resourceColor = colorScheme.secondary;
    }

    return Card(
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: () {
          // TODO: Show resource details
        },
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: resourceColor.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Icon(
                      resourceIcon,
                      color: resourceColor,
                      size: 24,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          resource.title,
                          style: textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          'Uploaded on: ${resource.uploadDate.toString().split(' ')[0]}',
                          style: textTheme.bodySmall?.copyWith(
                            color: colorScheme.onSurfaceVariant,
                          ),
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.download_rounded),
                    onPressed: () {
                      // TODO: Implement download functionality
                    },
                  ),
                ],
              ),
              if (resource.description.isNotEmpty) ...[
                const SizedBox(height: 12),
                Text(
                  resource.description,
                  style: textTheme.bodyMedium?.copyWith(
                    color: colorScheme.onSurfaceVariant,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
