import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar.large(
            title: const Text('Engineering Hub'),
            centerTitle: true,
            expandedHeight: 200,
            flexibleSpace: FlexibleSpaceBar(
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
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.all(16.0),
            sliver: SliverList(
              delegate: SliverChildListDelegate([
                const Text(
                  'Welcome!',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Explore resources, events, and opportunities',
                  style: TextStyle(
                    fontSize: 16,
                    color: colorScheme.onSurfaceVariant,
                  ),
                ),
                const SizedBox(height: 24),
                const Text(
                  'Quick Access',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16),
                GridView.count(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  crossAxisCount: 2,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                  children: [
                    _buildQuickLinkCard(
                      context,
                      'Colleges',
                      Icons.school_rounded,
                      colorScheme.primary,
                      () {
                        if (context.mounted) {
                          Navigator.of(context).pop(1);
                        }
                      },
                    ),
                    _buildQuickLinkCard(
                      context,
                      'Resources',
                      Icons.book_rounded,
                      colorScheme.secondary,
                      () {
                        if (context.mounted) {
                          Navigator.of(context).pop(2);
                        }
                      },
                    ),
                    _buildQuickLinkCard(
                      context,
                      'Events',
                      Icons.event_rounded,
                      colorScheme.tertiary,
                      () {
                        if (context.mounted) {
                          Navigator.of(context).pop(3);
                        }
                      },
                    ),
                    _buildQuickLinkCard(
                      context,
                      'Jobs',
                      Icons.work_rounded,
                      colorScheme.primary,
                      () {
                        if (context.mounted) {
                          Navigator.of(context).pop(4);
                        }
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                const Text(
                  'Latest Updates',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16),
                _buildUpdateCard(
                  context,
                  'New Resources Added',
                  'Check out the latest study materials for Data Structures',
                  Icons.new_releases_rounded,
                  colorScheme.secondary,
                ),
                const SizedBox(height: 12),
                _buildUpdateCard(
                  context,
                  'Upcoming Career Fair',
                  'Don\'t miss the opportunity to meet top employers',
                  Icons.event_available_rounded,
                  colorScheme.tertiary,
                ),
              ]),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildQuickLinkCard(
    BuildContext context,
    String title,
    IconData icon,
    Color color,
    VoidCallback onTap,
  ) {
    return Card(
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: color.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(
                  icon,
                  size: 32,
                  color: color,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildUpdateCard(
    BuildContext context,
    String title,
    String subtitle,
    IconData icon,
    Color color,
  ) {
    return Card(
      child: ListTile(
        contentPadding: const EdgeInsets.all(16),
        leading: Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: color.withOpacity(0.1),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(
            icon,
            color: color,
          ),
        ),
        title: Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.w600,
          ),
        ),
        subtitle: Padding(
          padding: const EdgeInsets.only(top: 8),
          child: Text(subtitle),
        ),
        trailing: const Icon(Icons.arrow_forward_ios_rounded, size: 16),
      ),
    );
  }
}
