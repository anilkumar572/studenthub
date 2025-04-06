import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubits/colleges/colleges_cubit.dart';
import '../models/college.dart';

class CollegeDirectoryScreen extends StatelessWidget {
  const CollegeDirectoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar.medium(
            title: const Text('College Directory'),
            actions: [
              IconButton(
                icon: const Icon(Icons.search_rounded),
                onPressed: () {
                  // TODO: Implement search
                },
              ),
              IconButton(
                icon: const Icon(Icons.filter_list_rounded),
                onPressed: () {
                  // TODO: Implement filters
                },
              ),
            ],
          ),
          BlocBuilder<CollegesCubit, CollegesState>(
            builder: (context, state) {
              if (state is CollegesInitial) {
                context.read<CollegesCubit>().loadColleges();
                return const SliverFillRemaining(
                  child: Center(child: CircularProgressIndicator()),
                );
              }

              if (state is CollegesLoading) {
                return const SliverFillRemaining(
                  child: Center(child: CircularProgressIndicator()),
                );
              }

              if (state is CollegesError) {
                return SliverFillRemaining(
                  child: Center(child: Text('Error: ${state.message}')),
                );
              }

              if (state is CollegesLoaded) {
                return _buildCollegesList(context, state.colleges);
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

  Widget _buildCollegesList(BuildContext context, List<College> colleges) {
    if (colleges.isEmpty) {
      return const SliverFillRemaining(
        child: Center(
          child: Text('No colleges found'),
        ),
      );
    }

    return SliverPadding(
      padding: const EdgeInsets.all(16.0),
      sliver: SliverList(
        delegate: SliverChildBuilderDelegate(
          (context, index) {
            final college = colleges[index];
            return Padding(
              padding: const EdgeInsets.only(bottom: 16.0),
              child: _buildCollegeCard(context, college),
            );
          },
          childCount: colleges.length,
        ),
      ),
    );
  }

  Widget _buildCollegeCard(BuildContext context, College college) {
    final colorScheme = Theme.of(context).colorScheme;

    return Card(
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: () {
          // TODO: Navigate to college details
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AspectRatio(
              aspectRatio: 16 / 9,
              child: Container(
                decoration: BoxDecoration(
                  color: colorScheme.primaryContainer,
                  image: DecorationImage(
                    image: NetworkImage(college.imageUrl),
                    fit: BoxFit.cover,
                    onError: (_, __) {},
                  ),
                ),
                child: college.imageUrl.isEmpty
                    ? Center(
                        child: Text(
                          college.name[0],
                          style: TextStyle(
                            fontSize: 48,
                            color: colorScheme.onPrimaryContainer,
                          ),
                        ),
                      )
                    : null,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    college.name,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Icon(
                        Icons.location_on_rounded,
                        size: 16,
                        color: colorScheme.primary,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        college.location,
                        style: TextStyle(
                          color: colorScheme.onSurfaceVariant,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: college.courses.map((course) {
                      return Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          color: colorScheme.secondaryContainer,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          course,
                          style: TextStyle(
                            color: colorScheme.onSecondaryContainer,
                            fontSize: 12,
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
