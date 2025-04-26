import 'package:flutter/material.dart';
import '../models/roadmap.dart';
import 'roadmap_details_screen.dart';

class ResourcesScreen extends StatefulWidget {
  const ResourcesScreen({super.key});

  @override
  State<ResourcesScreen> createState() => _ResourcesScreenState();
}

class _ResourcesScreenState extends State<ResourcesScreen> {
  final TextEditingController _searchController = TextEditingController();
  List<Roadmap> _filteredRoadmaps = [];

  @override
  void initState() {
    super.initState();
    _filteredRoadmaps = _roadmaps;
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _filterRoadmaps(String query) {
    setState(() {
      if (query.isEmpty) {
        _filteredRoadmaps = _roadmaps;
      } else {
        _filteredRoadmaps = _roadmaps.where((roadmap) {
          final titleMatch =
              roadmap.title.toLowerCase().contains(query.toLowerCase());
          final descriptionMatch =
              roadmap.description.toLowerCase().contains(query.toLowerCase());
          final categoryMatch =
              roadmap.category.toLowerCase().contains(query.toLowerCase());
          return titleMatch || descriptionMatch || categoryMatch;
        }).toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      backgroundColor: colorScheme.background,
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                controller: _searchController,
                onChanged: _filterRoadmaps,
                decoration: InputDecoration(
                  hintText: 'Search roadmaps...',
                  hintStyle: TextStyle(color: colorScheme.onSurfaceVariant),
                  prefixIcon:
                      Icon(Icons.search, color: colorScheme.onSurfaceVariant),
                  filled: true,
                  fillColor: colorScheme.surfaceVariant,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                  contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                ),
                style: TextStyle(color: colorScheme.onSurface),
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.all(16.0),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  final roadmap = _filteredRoadmaps[index];
                  return Container(
                    margin: const EdgeInsets.only(bottom: 16),
                    decoration: BoxDecoration(
                      color: colorScheme.surface,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => RoadmapDetailsScreen(
                                roadmap: roadmap,
                              ),
                            ),
                          );
                        },
                        borderRadius: BorderRadius.circular(16),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(12),
                                child: Image.asset(
                                  roadmap.imageUrl,
                                  width: 80,
                                  height: 80,
                                  fit: BoxFit.cover,
                                  errorBuilder: (context, error, stackTrace) {
                                    return Container(
                                      width: 80,
                                      height: 80,
                                      color: colorScheme.primaryContainer,
                                      child: Icon(
                                        _getIconForCategory(roadmap.category),
                                        color: colorScheme.onPrimaryContainer,
                                      ),
                                    );
                                  },
                                ),
                              ),
                              const SizedBox(width: 16),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      roadmap.title,
                                      style: textTheme.titleMedium?.copyWith(
                                        color: colorScheme.onSurface,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const SizedBox(height: 4),
                                    Text(
                                      roadmap.description,
                                      style: textTheme.bodyMedium?.copyWith(
                                        color: colorScheme.onSurfaceVariant,
                                      ),
                                    ),
                                    const SizedBox(height: 12),
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.access_time,
                                          size: 16,
                                          color: colorScheme.onSurfaceVariant,
                                        ),
                                        const SizedBox(width: 4),
                                        Text(
                                          '${roadmap.estimatedHours}h',
                                          style: textTheme.bodyMedium?.copyWith(
                                            color: colorScheme.onSurfaceVariant,
                                          ),
                                        ),
                                        const SizedBox(width: 16),
                                        Icon(
                                          _getIconForCategory(roadmap.category),
                                          size: 16,
                                          color: colorScheme.onSurfaceVariant,
                                        ),
                                        const SizedBox(width: 4),
                                        Text(
                                          roadmap.category,
                                          style: textTheme.bodyMedium?.copyWith(
                                            color: colorScheme.onSurfaceVariant,
                                          ),
                                        ),
                                        const Spacer(),
                                        Container(
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 12,
                                            vertical: 6,
                                          ),
                                          decoration: BoxDecoration(
                                            color: _getDifficultyColor(
                                                roadmap.difficulty),
                                            borderRadius:
                                                BorderRadius.circular(12),
                                          ),
                                          child: Text(
                                            roadmap.difficulty,
                                            style: TextStyle(
                                              color: colorScheme.surface,
                                              fontSize: 12,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 12),
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.list,
                                          size: 16,
                                          color: colorScheme.onSurfaceVariant,
                                        ),
                                        const SizedBox(width: 4),
                                        Text(
                                          '${roadmap.steps.length} steps',
                                          style: textTheme.bodyMedium?.copyWith(
                                            color: colorScheme.onSurfaceVariant,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
                childCount: _filteredRoadmaps.length,
              ),
            ),
          ),
        ],
      ),
    );
  }

  IconData _getIconForCategory(String category) {
    switch (category.toLowerCase()) {
      case 'mobile':
        return Icons.phone_android;
      case 'web':
        return Icons.web;
      case 'ai/ml':
        return Icons.psychology;
      case 'devops':
        return Icons.cloud;
      default:
        return Icons.code;
    }
  }

  Color _getDifficultyColor(String difficulty) {
    switch (difficulty.toLowerCase()) {
      case 'beginner':
        return Colors.green;
      case 'intermediate':
        return Colors.blue;
      case 'advanced':
        return Colors.purple;
      default:
        return Colors.grey;
    }
  }
}

final _roadmaps = [
  Roadmap(
    id: '1',
    title: 'Flutter Development',
    description: 'Learn to build cross-platform mobile apps',
    imageUrl: 'assets/resources/flutter.jpg',
    category: 'Mobile',
    estimatedHours: 40,
    difficulty: 'Intermediate',
    steps: [
      RoadmapStep(
        title: 'Dart Basics',
        description: 'Learn the fundamentals of Dart programming language',
        resources: [
          'https://dart.dev/guides',
          'https://www.youtube.com/watch?v=Ej_Pcr4uC2Q',
        ],
      ),
      RoadmapStep(
        title: 'Flutter Widgets',
        description: 'Master Flutter widgets and their lifecycle',
        resources: [
          'https://flutter.dev/docs/development/ui/widgets-intro',
          'https://flutter.dev/docs/development/ui/widgets',
        ],
      ),
      RoadmapStep(
        title: 'State Management',
        description: 'Learn different state management approaches',
        resources: [
          'https://flutter.dev/docs/development/data-and-backend/state-mgmt/intro',
        ],
      ),
    ],
  ),
  Roadmap(
    id: '2',
    title: 'iOS Development',
    description: 'Master iOS app development with Swift',
    imageUrl: 'assets/resources/ios.jpg',
    category: 'Mobile',
    estimatedHours: 50,
    difficulty: 'Intermediate',
    steps: [
      RoadmapStep(
        title: 'Swift Programming',
        description: 'Learn Swift programming fundamentals',
        resources: [
          'https://docs.swift.org/swift-book/',
          'https://developer.apple.com/tutorials/swiftui',
        ],
      ),
      RoadmapStep(
        title: 'iOS UI Development',
        description: 'Master SwiftUI and UIKit',
        resources: [
          'https://developer.apple.com/documentation/swiftui',
          'https://developer.apple.com/documentation/uikit',
        ],
      ),
    ],
  ),
  Roadmap(
    id: '3',
    title: 'Web Development',
    description: 'Master modern web development',
    imageUrl: 'assets/resources/web.jpg',
    category: 'Web',
    estimatedHours: 60,
    difficulty: 'Beginner',
    steps: [
      RoadmapStep(
        title: 'HTML & CSS',
        description: 'Learn the basics of web structure and styling',
        resources: [
          'https://www.w3schools.com/html/',
          'https://www.w3schools.com/css/',
        ],
      ),
      RoadmapStep(
        title: 'JavaScript',
        description: 'Master JavaScript programming',
        resources: [
          'https://javascript.info/',
          'https://developer.mozilla.org/en-US/docs/Web/JavaScript',
        ],
      ),
    ],
  ),
  Roadmap(
    id: '4',
    title: 'Backend Development',
    description: 'Build robust and scalable backend systems',
    imageUrl: 'assets/resources/backend_develop.jpg',
    category: 'Backend',
    estimatedHours: 70,
    difficulty: 'Advanced',
    steps: [
      RoadmapStep(
        title: 'Server-side Programming',
        description: 'Learn Node.js/Python/Java backend development',
        resources: [
          'https://nodejs.org/en/docs/',
          'https://docs.python.org/3/',
        ],
      ),
      RoadmapStep(
        title: 'Databases',
        description: 'Master SQL and NoSQL databases',
        resources: [
          'https://www.postgresql.org/docs/',
          'https://docs.mongodb.com/',
        ],
      ),
    ],
  ),
  Roadmap(
    id: '5',
    title: 'Machine Learning',
    description: 'Master the fundamentals of ML and AI',
    imageUrl: 'assets/resources/ml.jpg',
    category: 'AI/ML',
    estimatedHours: 80,
    difficulty: 'Advanced',
    steps: [
      RoadmapStep(
        title: 'Python for Data Science',
        description:
            'Learn Python libraries for data manipulation and analysis',
        resources: [
          'https://pandas.pydata.org/docs/getting_started/',
          'https://numpy.org/doc/stable/user/quickstart.html',
        ],
      ),
      RoadmapStep(
        title: 'Machine Learning Basics',
        description: 'Understand fundamental ML concepts and algorithms',
        resources: [
          'https://www.coursera.org/learn/machine-learning',
          'https://scikit-learn.org/stable/tutorial/index.html',
        ],
      ),
    ],
  ),
  Roadmap(
    id: '6',
    title: 'Data Engineering',
    description: 'Build and maintain data processing systems',
    imageUrl: 'assets/resources/Data-Engineering.jpg',
    category: 'Data',
    estimatedHours: 75,
    difficulty: 'Advanced',
    steps: [
      RoadmapStep(
        title: 'Data Processing',
        description: 'Learn big data processing frameworks',
        resources: [
          'https://spark.apache.org/docs/latest/',
          'https://hadoop.apache.org/docs/current/',
        ],
      ),
      RoadmapStep(
        title: 'Data Warehousing',
        description: 'Master data warehouse solutions',
        resources: [
          'https://cloud.google.com/bigquery/docs',
          'https://docs.snowflake.com/',
        ],
      ),
    ],
  ),
  Roadmap(
    id: '7',
    title: 'Cloud Computing',
    description: 'Learn cloud platforms and DevOps practices',
    imageUrl: 'assets/resources/cloud.jpg',
    category: 'DevOps',
    estimatedHours: 70,
    difficulty: 'Intermediate',
    steps: [
      RoadmapStep(
        title: 'AWS Fundamentals',
        description: 'Master core AWS services and architecture',
        resources: [
          'https://aws.amazon.com/getting-started/',
          'https://www.udemy.com/course/aws-certified-cloud-practitioner/',
        ],
      ),
      RoadmapStep(
        title: 'Docker & Kubernetes',
        description: 'Learn containerization and orchestration',
        resources: [
          'https://docs.docker.com/get-started/',
          'https://kubernetes.io/docs/tutorials/',
        ],
      ),
    ],
  ),
  Roadmap(
    id: '8',
    title: 'UI/UX Design',
    description: 'Master the art of user interface and experience design',
    imageUrl: 'assets/resources/ui-ux-design.jpg',
    category: 'Design',
    estimatedHours: 45,
    difficulty: 'Intermediate',
    steps: [
      RoadmapStep(
        title: 'Design Fundamentals',
        description: 'Learn color theory, typography, and layout principles',
        resources: [
          'https://www.figma.com/resources/learn-design/',
          'https://www.coursera.org/learn/ui-design',
        ],
      ),
      RoadmapStep(
        title: 'Prototyping',
        description: 'Master interactive prototyping tools',
        resources: [
          'https://www.figma.com/prototyping/',
          'https://www.sketch.com/docs/',
        ],
      ),
    ],
  ),
  Roadmap(
    id: '9',
    title: 'Game Development',
    description: 'Create engaging games across multiple platforms',
    imageUrl: 'assets/resources/gamedevelop.jpg',
    category: 'Gaming',
    estimatedHours: 90,
    difficulty: 'Advanced',
    steps: [
      RoadmapStep(
        title: 'Game Engines',
        description: 'Learn Unity or Unreal Engine',
        resources: [
          'https://learn.unity.com/',
          'https://docs.unrealengine.com/5.0/',
        ],
      ),
      RoadmapStep(
        title: 'Game Design',
        description: 'Master game mechanics and level design',
        resources: [
          'https://www.coursera.org/learn/game-design',
          'https://www.udemy.com/course/level-design-master-class/',
        ],
      ),
    ],
  ),
  Roadmap(
    id: '10',
    title: 'AR/VR Development',
    description: 'Build immersive augmented and virtual reality experiences',
    imageUrl: 'assets/resources/Ar:Vr.jpg',
    category: 'AR/VR',
    estimatedHours: 85,
    difficulty: 'Advanced',
    steps: [
      RoadmapStep(
        title: 'AR Fundamentals',
        description: 'Learn ARKit and ARCore development',
        resources: [
          'https://developer.apple.com/augmented-reality/',
          'https://developers.google.com/ar',
        ],
      ),
      RoadmapStep(
        title: 'VR Development',
        description: 'Master VR development with Unity/Unreal',
        resources: [
          'https://developer.oculus.com/',
          'https://docs.unrealengine.com/VR/',
        ],
      ),
    ],
  ),
  Roadmap(
    id: '11',
    title: 'Blockchain Development',
    description: 'Build decentralized applications and smart contracts',
    imageUrl: 'assets/resources/blockchain.jpg',
    category: 'Blockchain',
    estimatedHours: 65,
    difficulty: 'Advanced',
    steps: [
      RoadmapStep(
        title: 'Smart Contracts',
        description: 'Learn Solidity and smart contract development',
        resources: [
          'https://docs.soliditylang.org/',
          'https://ethereum.org/developers/',
        ],
      ),
      RoadmapStep(
        title: 'Web3 Development',
        description: 'Build decentralized applications',
        resources: [
          'https://web3js.readthedocs.io/',
          'https://docs.ethers.io/',
        ],
      ),
    ],
  ),
  Roadmap(
    id: '12',
    title: 'Cybersecurity',
    description: 'Master the art of securing digital systems and networks',
    imageUrl: 'assets/resources/cyber.jpg',
    category: 'Security',
    estimatedHours: 80,
    difficulty: 'Advanced',
    steps: [
      RoadmapStep(
        title: 'Network Security',
        description: 'Learn network security fundamentals',
        resources: [
          'https://www.cybrary.it/course/network-security/',
          'https://www.sans.org/cyber-security-courses/',
        ],
      ),
      RoadmapStep(
        title: 'Ethical Hacking',
        description: 'Master penetration testing and security auditing',
        resources: [
          'https://www.offensive-security.com/',
          'https://www.hackthebox.eu/',
        ],
      ),
    ],
  ),
];
