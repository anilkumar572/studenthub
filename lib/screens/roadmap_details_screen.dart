import 'package:demo/models/roadmap.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class RoadmapDetailsScreen extends StatelessWidget {
  final Roadmap roadmap;

  const RoadmapDetailsScreen({
    super.key,
    required this.roadmap,
  });

  Future<void> _launchUrl(String url) async {
    if (url.isEmpty) return;

    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar.large(
            expandedHeight: 200,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                roadmap.title,
                style: TextStyle(
                  color: colorScheme.onSurface,
                  fontWeight: FontWeight.bold,
                ),
              ),
              background: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      colorScheme.primaryContainer,
                      colorScheme.surface,
                    ],
                  ),
                ),
                child: Center(
                  child: Icon(
                    Icons.account_tree_rounded,
                    size: 64,
                    color: colorScheme.primary,
                  ),
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Roadmap Info
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: colorScheme.surfaceVariant,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          children: [
                            Icon(
                              Icons.timer_outlined,
                              color: colorScheme.primary,
                            ),
                            const SizedBox(height: 4),
                            Text(
                              '${roadmap.estimatedHours}h',
                              style: textTheme.titleMedium?.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              'Duration',
                              style: textTheme.bodySmall,
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Icon(
                              Icons.category_outlined,
                              color: colorScheme.primary,
                            ),
                            const SizedBox(height: 4),
                            Text(
                              roadmap.category,
                              style: textTheme.titleMedium?.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              'Category',
                              style: textTheme.bodySmall,
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Icon(
                              Icons.trending_up,
                              color: colorScheme.primary,
                            ),
                            const SizedBox(height: 4),
                            Text(
                              roadmap.difficulty,
                              style: textTheme.titleMedium?.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              'Level',
                              style: textTheme.bodySmall,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),
                  Text(
                    'About this Roadmap',
                    style: textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    roadmap.description,
                    style: textTheme.bodyLarge,
                  ),
                  const SizedBox(height: 24),
                  Text(
                    'Learning Path',
                    style: textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                ],
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                final step = roadmap.steps[index];
                return Padding(
                  padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                  child: Card(
                    child: Theme(
                      data: Theme.of(context).copyWith(
                        dividerColor: Colors.transparent,
                      ),
                      child: ExpansionTile(
                        leading: CircleAvatar(
                          backgroundColor: step.isCompleted
                              ? colorScheme.primary
                              : colorScheme.surfaceVariant,
                          child: Icon(
                            step.isCompleted
                                ? Icons.check_rounded
                                : Icons.circle_outlined,
                            color: step.isCompleted
                                ? colorScheme.onPrimary
                                : colorScheme.primary,
                          ),
                        ),
                        title: Text(
                          step.title,
                          style: textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  step.description,
                                  style: textTheme.bodyLarge,
                                ),
                                if (step.resources.isNotEmpty) ...[
                                  const SizedBox(height: 16),
                                  Text(
                                    'Resources',
                                    style: textTheme.titleMedium?.copyWith(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  ...step.resources.map((resource) {
                                    return ListTile(
                                      contentPadding: EdgeInsets.zero,
                                      leading: const Icon(Icons.link),
                                      title: Text(
                                        resource,
                                        style: const TextStyle(
                                          decoration: TextDecoration.underline,
                                        ),
                                      ),
                                      onTap: () => _launchUrl(resource),
                                    );
                                  }).toList(),
                                ],
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
              childCount: roadmap.steps.length,
            ),
          ),
        ],
      ),
    );
  }
}
